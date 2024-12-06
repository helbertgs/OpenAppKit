import Foundation

extension NSLayoutConstraint {
    /// The relation between the first attribute and the modified second attribute in a constraint.
    public enum Relation: Equatable, Hashable, Sendable {
        /// The constraint requires the first attribute to be less than or equal to the modified second attribute.
        case lessThanOrEqual
        /// The constraint requires the first attribute to be exactly equal to the modified second attribute.
        case equal
        /// The constraint requires the first attribute to be greater than or equal to the modified second attribute.
        case greaterThanOrEqual
    }
}