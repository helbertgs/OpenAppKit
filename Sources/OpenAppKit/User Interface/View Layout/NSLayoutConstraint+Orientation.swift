import Foundation

extension NSLayoutConstraint {
    /// The layout constraint orientation, either horizontal or vertical, that the constraint uses to enforce layout between objects.
    public enum Orientation: Equatable, Hashable, Sendable {
        /// The constraint orientation applied to laying out the horizontal relationship between objects.
        case horizontal
        /// The constraint orientation applied to laying out the vertical relationship between objects.
        case vertical
    }
}