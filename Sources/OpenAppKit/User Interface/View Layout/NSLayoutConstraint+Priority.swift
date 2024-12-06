import Foundation

extension NSLayoutConstraint {
    /// Layout priority used to indicate the relative importance of constraints, allowing Auto Layout to make appropriate tradeoffs when satisfying the constraints of the system as a whole.
    public struct Priority: Equatable, Hashable, RawRepresentable, Sendable {

        // MARK: - Accessing the Raw Value

        /// The corresponding value of the raw type.
        public var rawValue: Float

        // MARK: - Constants
    
        /// A required constraint.
        public static let required = Priority(rawValue: 0)

        /// Priority level with which a button resists compressing its content.
        public static let defaultHigh = Priority(rawValue: 0)

        /// Appropriate priority level for a drag that may end up resizing the window.
        public static let dragThatCanResizeWindow = Priority(rawValue: 0)

        /// Priority level for the window’s current size.
        public static let windowSizeStayPut = Priority(rawValue: 0)

        /// Priority level at which a split view divider, say, is dragged.
        public static let dragThatCannotResizeWindow = Priority(rawValue: 0)

        /// Priority level at which a button hugs its contents horizontally.
        public static let defaultLow = Priority(rawValue: 0)

        /// When you send a fittingSize message to a view, the smallest size that is large enough for the view’s contents is computed.
        public static let fittingSizeCompression = Priority(rawValue: 0)

        // MARK: - Initializers

        /// Creates a new instance with the specified raw value.
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init(rawValue: Float) {
            self.rawValue = rawValue
        }
    }
}