import OpenCoreGraphics
import OpenCoreImage
import Foundation

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
