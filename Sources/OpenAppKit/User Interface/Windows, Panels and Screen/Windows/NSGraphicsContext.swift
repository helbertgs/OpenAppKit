import Foundation
import OpenCoreGraphics
import OpenCoreImage
import OpenGLFW
// import OpenGLAD

/// An object that represents a graphics context.
@MainActor
public class NSGraphicsContext {

    // MARK: - Managing the Current Context

    /// The Core Graphics context, which is a low-level, platform-specific graphics context.
    public internal(set) var cgContext: OpenCoreGraphics.CGContext = .init()

    // MARK: - Getting Information About the Context

    /// The attributes used to create this instance.
    /// 
    /// Screen-based graphics contexts do not store attributes, even if you create them using init(attributes:).
    public internal(set) var attributes: [NSGraphicsContext.AttributeKey : Any]?

    /// The view’s window object, if it is installed in a window.
    public internal(set) unowned var window: NSWindow

    private var windowRef: OpaquePointer

    /// A Boolean value that indicates the graphics context’s flipped state.
    /// 
    /// The state is determined by sending flipped to the receiver’s view that has focus. 
    /// If no view has focus, returns false unless the receiver is instantiated using ``init(cgContext:flipped:)`` specifying true as the flipped parameter.
    public var isFlipped: Bool = false

    // MARK: - Getting the Context for Rendering Core Image Objects

    /// Creates a new graphics context for drawing into a window.
    /// - Parameter attributes: A dictionary of values associated with the keys described in ``NSGraphicsContext.AttributeKey``.
    /// - Parameter window: The window object representing the window to use for drawing.
    public init(attributes: [NSGraphicsContext.AttributeKey : Any] = [:], window: NSWindow) {
        self.attributes = attributes
        self.cgContext = .init()
        self.window = window

        glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3)
        glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3)
        glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE)
        
        guard glfwInit() == GLFW_TRUE else {
            fatalError("Fail to initialize GLFW")
        }
        
        guard let windowRef = glfwCreateWindow(900, 450, "My Title", nil, nil) else {
            fatalError("Fail to create a GLFW Window")
        }

        self.windowRef = windowRef
        setupCallbacks()
    }

    deinit {
        print("\(Self.self).\(#function)")
        glfwTerminate()
    }

    func render() {
       guard glfwWindowShouldClose(self.windowRef) == GLFW_FALSE else {
           glfwSetWindowShouldClose(self.windowRef, GLFW_TRUE)
           return
       }

       updateFrame()
    }

    // MARK: - Window Management
    
    /// Define o título da janela GLFW
    public func setWindowTitle(_ title: String) {
        glfwSetWindowTitle(windowRef, title)
    }
    
    /// Define o tamanho da janela GLFWl
    public func setWindowSize(width: Int, height: Int) {
        glfwSetWindowSize(windowRef, Int32(width), Int32(height))
    }
    
    /// Define a posição da janela GLFW
    public func setWindowPosition(x: Int, y: Int) {
        glfwSetWindowPos(windowRef, Int32(x), Int32(y))
    }
    
    /// Obtém o tamanho atual da janela
    public func getWindowSize() -> (width: Int, height: Int) {
        var width: Int32 = 0
        var height: Int32 = 0
        glfwGetWindowSize(windowRef, &width, &height)
        return (Int(width), Int(height))
    }
    
    /// Obtém a posição atual da janela
    public func getWindowPosition() -> (x: Int, y: Int) {
        var x: Int32 = 0
        var y: Int32 = 0
        glfwGetWindowPos(windowRef, &x, &y)
        return (Int(x), Int(y))
    }
    
    /// Define se a janela pode ser redimensionada
    public func setResizable(_ resizable: Bool) {
        glfwSetWindowAttrib(windowRef, GLFW_RESIZABLE, resizable ? GLFW_TRUE : GLFW_FALSE)
    }
    
    /// Define se a janela deve ser decorada (ter borda, título etc)
    public func setDecorated(_ decorated: Bool) {
        glfwSetWindowAttrib(windowRef, GLFW_DECORATED, decorated ? GLFW_TRUE : GLFW_FALSE)
    }
    
    /// Minimiza a janela
    public func minimizeWindow() {
        glfwIconifyWindow(windowRef)
    }
    
    /// Maximiza a janela
    public func maximizeWindow() {
        glfwMaximizeWindow(windowRef)
    }
    
    /// Restaura a janela ao tamanho normal
    public func restoreWindow() {
        glfwRestoreWindow(windowRef)
    }
    
    /// Torna a janela visível
    public func showWindow() {
        glfwShowWindow(windowRef)
    }
    
    /// Oculta a janela
    public func hideWindow() {
        glfwHideWindow(windowRef)
    }
    
    /// Foca a janela
    public func focusWindow() {
        glfwFocusWindow(windowRef)
    }
    
    /// Verifica se a janela está minimizada
    public func isMinimized() -> Bool {
        return glfwGetWindowAttrib(windowRef, GLFW_ICONIFIED) == GLFW_TRUE
    }
    
    /// Verifica se a janela está maximizada
    public func isMaximized() -> Bool {
        return glfwGetWindowAttrib(windowRef, GLFW_MAXIMIZED) == GLFW_TRUE
    }
    
    /// Verifica se a janela está visível
    public func isVisible() -> Bool {
        return glfwGetWindowAttrib(windowRef, GLFW_VISIBLE) == GLFW_TRUE
    }
    
    /// Verifica se a janela está focada
    public func isFocused() -> Bool {
        return glfwGetWindowAttrib(windowRef, GLFW_FOCUSED) == GLFW_TRUE
    }
    
    /// Configura os callbacks da janela
    private func setupCallbacks() {
        let contextPtr = Unmanaged.passUnretained(self).toOpaque()
        glfwSetWindowUserPointer(windowRef, contextPtr)
        
        glfwSetWindowSizeCallback(windowRef) { window, width, height in
            guard let pointer = glfwGetWindowUserPointer(window) else { return }
            
            let context = Unmanaged<NSGraphicsContext>
                .fromOpaque(pointer)
                .takeUnretainedValue()
            
            context.window.setFrame(CGRect(x: 0, y: 0, width: Int(width), height: Int(height)), display: true)
        }
        
        glfwSetWindowCloseCallback(windowRef) { window in
            guard let pointer = glfwGetWindowUserPointer(window) else { return }
            
            let context = Unmanaged<NSGraphicsContext>
                .fromOpaque(pointer)
                .takeUnretainedValue()

            context.window.close()
        }
        
        // Adicione outros callbacks conforme necessário
    }
    
    /// Atualiza o frame da janela
    public func updateFrame() {
        glfwSwapBuffers(windowRef)
        glfwPollEvents()
    }
    
    /// Limpa o buffer da janela com uma cor específica
    public func clearBuffer(red: Float, green: Float, blue: Float, alpha: Float) {
        // glad_glClearColor(red, green, blue, alpha)
        // glad_glClear(GL_COLOR_BUFFER_BIT)
    }
}

extension NSGraphicsContext {
    /// Constants that specify the dictionary keys for the attributes of the graphics context.
    /// 
    /// You use these dictionary keys with init(attributes:) and attributes.
    public struct AttributeKey: Codable, Equatable, Hashable, RawRepresentable, Sendable {

        // MARK: - Attribute Keys

        /// Specifies the destination.
        public static let destination = AttributeKey(rawValue: "destination")

        /// Specifies the destination file format.
        public static let representationFormat = AttributeKey(rawValue: "representationFormat")

        // MARK: - Accessing the Raw Value

        /// The corresponding value of the raw type.
        public var rawValue: String

        // MARK: - Creating a Value

        /// Creates a new instance with the specified raw value.
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
}

//extension NSWindow {
//    private func setupCallbacks() {
//        glfwSetWindowUserPointer(_context, Unmanaged.passUnretained(self).toOpaque())
//
//        glfwSetWindowFocusCallback(_context) { window, isFocused in
//            // print("glfwSetWindowFocusCallback")
//        }
//
//        glfwSetWindowSizeCallback(_context) { window, width, height in
//            // print("glfwSetWindowSizeCallback")
//        }
//
//        glfwSetWindowPosCallback(_context) { window, x, y in
//            // print("glfwSetWindowSizeCallback")
//        }
//
//        glfwSetWindowRefreshCallback(_context) { window in
//            // print("glfwSetWindowRefreshCallback")
//            // let win = Unmanaged<NSWindow>.fromOpaque(glfwGetWindowUserPointer(window)!).takeUnretainedValue()
//            // win.update()
//        }
//
//        glfwSetKeyCallback(_context) { window, key, scancode, action, mods in
//            print("glfwSetKeyCallback: [key: \(key), scancode: \(scancode), action: \(action), mods: \(mods)]")
//            
//            // let win = Unmanaged<Window>.fromOpaque(glfwGetWindowUserPointer(window)!).takeUnretainedValue()
//            // let event = NSEvent.keyEvent(with: .keyDown, characters: String, charactersIgnoringModifiers: String, keyCode: Int)
//        }
//
//        glfwSetCursorPosCallback(_context) { window, x, y in
//            // print("glfwSetCursorPosCallback")
//        }
//
//        glfwSetMouseButtonCallback(_context) { window, button, action, mods in
//            // print("glfwSetMouseButtonCallback")
//        }
//
//        glfwSetScrollCallback(_context) { window, xOffset, yOffset in 
//            // print("glfwSetScrollCallback")
//        }
//
//        glfwSetDropCallback(_context) { window, count, paths in
//            // print("glfwSetDropCallback")
//        }
//    }
//}