import Foundation

/// A representation of a single layout constraint between two layers.
/// 
/// Each CAConstraint instance encapsulates one geometry relationship between two layers on the same axis.
/// Sibling layers are referenced by name, using the name property of each layer. 
/// The special name superlayer is used to refer to the layer's superlayer.
/// 
/// For example, to specify that a layer should be horizontally centered in its superview you would use the following:
/// ```let theConstraint = CAConstraint(attribute: .midX, relativeTo: "superlayer", attribute: .midX)```
/// 
/// A minimum of two relationships must be specified per axis. 
/// If you specify constraints for the left and right edges of a layer, the width will vary. 
/// If you specify constraints for the left edge and the width, the right edge of the layer will move relative to the superlayer’s frame. 
/// Often you’ll specify only a single edge constraint, the layer’s size in the same axis will be used as the second relationship.
@MainActor public class CAConstraint {

    // MARK: - Accessing Constraint Values

    /// The attribute the constraint affects.
    public var attribute: CAConstraintAttribute

    /// Offset value of the constraint attribute.
    public var offset: Float

    /// Scale factor of the constraint attribute.
    public var scale: Float

    /// The constraint attribute of the layer the receiver is calculated relative to
    public var sourceAttribute: CAConstraintAttribute

    /// Name of the layer that the constraint is calculated relative to.
    public var sourceName: String

    // MARK: - Create a New Constraint

    /// Creates and returns an CAConstraint object with the specified parameters.
    /// 
    /// The value for the constraint is calculated as (srcAttr + offset).
    /// - Parameters:
    ///   - attribute: The attribute of the layer for which to create a new constraint.
    ///   - relativeTo: The name of the layer that this constraint is calculated relative to.
    ///   - attribute: The attribute of srcLayer the constraint is calculated relative to.
    ///   - offset: The offset added to the value of srcAttr.
    public convenience init(attribute attr: CAConstraintAttribute, relativeTo srcId: String, attribute srcAttr: CAConstraintAttribute, offset c: Float) {
        self.init(attribute: attr, relativeTo: srcId, attribute: srcAttr, scale: 1, offset: c)
    }

    /// Creates and returns an CAConstraint object with the specified parameters.
    /// 
    /// The value for the constraint is calculated is srcAttr.
    /// - Parameters:
    ///   - attribute: The attribute of the layer for which to create a new constraint.
    ///   - relativeTo: The name of the layer that this constraint is calculated relative to.
    ///   - attribute: The attribute of srcLayer the constraint is calculated relative to.
    /// - Returns: A new CAConstraint object with the specified parameters. The scale of the constraint is set to 1.0. The offset of the constraint is set to 0.0.
    public convenience init(attribute attr: CAConstraintAttribute, relativeTo srcId: String, attribute srcAttr: CAConstraintAttribute) {
       self.init(attribute: attr, relativeTo: srcId, attribute: srcAttr, scale: 1, offset: 0)
    }

    /// Returns an CAConstraint object with the specified parameters. Designated initializer.
    /// 
    /// The value for the constraint is calculated as (srcAttr * scale) + offset).
    /// - Parameters:
    ///   - attribute: The attribute of the layer for which to create a new constraint.
    ///   - relativeTo: The name of the layer that this constraint is calculated relative to.
    ///   - attribute: The attribute of srcLayer the constraint is calculated relative to.
    ///   - scale: The amount to scale the value of srcAttr.
    ///   - offset: The offset added to the value of srcAttr. 
    public init(attribute attr: CAConstraintAttribute, relativeTo srcId: String, attribute srcAttr: CAConstraintAttribute, scale m: Float, offset c: Float) {
        self.attribute = attr
        self.sourceName = srcId
        self.sourceAttribute = srcAttr
        self.scale = m
        self.offset = c
    }
}

extension CAConstraint {
    /// The constraint attribute type.
    @MainActor public enum CAConstraintAttribute : Int, @unchecked Sendable {
        
        // MARK: - Enumeration Cases
        
        /// The height of a layer.
        case height

        /// The right edge of a layer’s frame.
        case maxX

        /// The top edge of a layer’s frame.
        case maxY

        /// The horizontal location of the center of a layer’s frame.
        case midX

        /// The vertical location of the center of a layer’s frame.
        case midY

        /// The left edge of a layer’s frame.
        case minX

        /// The bottom edge of a layer’s frame.
        case minY

        /// The width of a layer.
        case width
    }
}