import Foundation
import OpenCoreGraphics
import OpenCoreImage

/// An object that represents a graphics context.
@MainActor
public class NSGraphicsContext {

    // MARK: - Managing the Current Context
    
    /// Returns the current graphics context of the current thread.
    public static package(set) var current: NSGraphicsContext?

    /// The Core Graphics context, which is a low-level, platform-specific graphics context.
    public var cgContext: CGContext

    // MARK: - Getting Information About the Context

    /// The attributes used to create this instance.
    /// 
    /// Screen-based graphics contexts do not store attributes, even if you create them using ``init(attributes:)``.
    public private(set) var attributes: [NSGraphicsContext.AttributeKey : Any]?

    /// A Boolean value that indicates the graphics context’s flipped state.
    public private(set) var isFlipped: Bool = false

    // MARK: - Testing the Drawing Destination

    /// A Boolean value that indicates whether the drawing destination is the screen.
    /// 
    /// ``true`` if the drawing destination is the screen. 
    /// If the value of the property is ``false`` may mean that the drawing destination is a printer, but the destination may also be a PDF or EPS file. 
    /// You can call attributes to see if additional information is available about the drawing destination.
    public private(set) var isDrawingToScreen: Bool = false

    // MARK: - Creating a Graphics Context

    /// Creates a graphics context using the specified attributes.
    /// 
    /// Use this method to create a graphics context for a window or bitmap destination.
    /// If you want to create a graphics context for a ``PDF`` or ``PostScript`` destination, do not use this method; instead, use the ``NSPrintOperation`` class to set up the printing environment needed to generate that type of information.
    /// - Parameter attributes: A dictionary of values associated with the keys described in ``NSGraphicsContext.AttributeKey``. The attributes specify such things as representation format and destination.
    public init?(attributes: [NSGraphicsContext.AttributeKey : Any] = [:]) {
        self.attributes = attributes
        self.cgContext = CGContext()
    }

    /// Creates a new graphics context from the specified Core Graphics context and the initial flipped state.
    /// 
    /// - Parameters:
    ///   - cgContext: The graphics port used to create the graphics-context object, as a CGContext (opaque type) object.
    ///   - flipped: Specifies the receiver’s initial flipped state. This is the value returned by isFlipped when no view has focus.
    public init(cgContext: CGContext, flipped initialFlippedState: Bool) {
        self.cgContext = cgContext
        self.isFlipped = initialFlippedState
    }

    // MARK: - Managing the Graphics State

    /// Saves the current graphics state and creates a new graphics state on the top of the stack.
    /// 
    /// The new graphics state is a copy of the previous state that can be modified to handle new drawing operations.
    /// Saving the graphics state saves such attributes as the current drawing style, transformation matrix, color, and font.
    public func saveGraphicsState() {
        cgContext.saveGState()
    }

    /// Removes the context’s graphics state from the top of the graphics state stack and makes the next graphics state the current graphics state.
    /// 
    /// This method must have been preceded with a ``saveGraphicsState()`` message to add the graphics state to the stack. 
    /// Invocations of ``saveGraphicsState()`` and ``restoreGraphicsState()`` methods may be nested.
    /// 
    /// Restoring the graphics state restores such attributes as the current drawing style, transformation matrix, color, and font of the original graphics state.
    public func restoreGraphicsState() {
        cgContext.restoreGState()
    }

    // MARK: - Flushing Graphics to the Context

    /// Forces any buffered operations or data to be sent to the graphics context’s destination.
    /// 
    /// Graphics contexts use buffers to queue pending operations but for efficiency reasons may not always empty those buffers immediately. 
    /// This method forces the buffers to be emptied.
    public func flushGraphics() {
        cgContext.flush()
    }

    // MARK: - Configuring Rendering Options

    /// The graphics context’s global compositing operation setting.
    /// 
    /// The compositing operation is a global attribute of the graphics context and affects drawing operations that do not take an explicit compositing operation parameter. 
    /// For methods that do take an explicit compositing operation parameter, the value of that parameter supersedes the global value. 
    /// The compositing operations are related to (but different from) the blend mode settings used in Core Graphics.
    public var compositingOperation: NSCompositingOperation = .copy

    /// A constant that specifies the graphics context’s interpolation, or image smoothing, behavior.
    /// 
    /// Note that this value is not part of the graphics state, so it cannot be reset using restoreGraphicsState().
    public var imageInterpolation: NSImageInterpolation = .high

    /// A Boolean value that indicates whether the graphics context uses antialiasing.
    /// 
    /// true if the receiver uses antialiasing. 
    /// This value is part of the graphics state and is restored by ``restoreGraphicsState()``.
    public var shouldAntialias: Bool = false

    /// The amount to offset the pattern color when filling the graphics context.
    /// 
    /// Use this property when you need to line up the pattern color with another pattern, such as the pattern in a superview. 
    /// The pattern phase is a translation (width, height) applied before a pattern is drawn in the current context and is part of the saved graphics state of the context. 
    /// The default pattern phase is (0,0). 
    /// Setting the pattern phase has the effect of temporarily changing the pattern matrix of any pattern you decide to draw. 
    /// For example, setting the pattern phase to (2,3) has the effect of moving the start of pattern cell tiling to the point (2,3) in default user space.
    public var patternPhase: OpenCoreGraphics.CGPoint = .zero

    // MARK: - Getting the Context for Rendering Core Image Objects

    /// A context for Core Image objects that you can use to render into the graphics context.
    public private(set) var ciContext: CIContext?
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
