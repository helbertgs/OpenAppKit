import Foundation

extension NSLayoutConstraint {
    /// The part of the object’s visual representation that should be used to get the value for the constraint.
    public enum Attribute: Equatable, Hashable, Sendable {

        /// The left side of the object’s alignment rectangle.
        case left

        /// The right side of the object’s alignment rectangle.
        case right

        /// The top of the object’s alignment rectangle.
        case top

        /// The bottom of the object’s alignment rectangle.
        case bottom

        /// The leading edge of the object’s alignment rectangle.
        case leading

        /// The trailing edge of the object’s alignment rectangle.
        case trailing

        /// The width of the object’s alignment rectangle.
        case width

        /// The height of the object’s alignment rectangle.
        case height

        /// The center along the x-axis of the object’s alignment rectangle.
        case centerX

        /// The center along the y-axis of the object’s alignment rectangle.
        case centerY

        /// The object’s baseline.
        case lastBaseline

        /// The object’s baseline.
        case firstBaseline

        /// A placeholder value for indicating that the constraint’s second item and second attribute aren’t used in any calculations.
        case notAnAttribute
    }
}