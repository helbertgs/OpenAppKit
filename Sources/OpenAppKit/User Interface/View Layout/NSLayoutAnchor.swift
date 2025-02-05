import Foundation

/// A factory class for creating layout constraint objects using a fluent API.
/// 
/// Use these constraints to programatically define your layout using Auto Layout. 
/// Instead of creating ``NSLayoutConstraint`` objects directly, start with a ``UIView``, ``NSView``, or ``UILayoutGuide`` object you wish to constrain, and select one of that object’s anchor properties. 
/// These properties correspond to the main ``NSLayoutConstraint.Attribute`` values used in Auto Layout, and provide an appropriate ``NSLayoutAnchor`` subclass for creating constraints to that attribute. 
/// Use the anchor’s methods to construct your constraint.
public class NSLayoutAnchor<AnchorType> where AnchorType : AnyObject {

    // MARK: - Debugging the anchor

    internal private(set) var value: AnchorType?

    /// The constraints that impact the layout of the anchor.
    public private(set) var constraintsAffectingLayout: [NSLayoutConstraint] = []

    /// A Boolean value indicating whether the constraints impacting the anchor specify its location ambiguously.
    public private(set) var hasAmbiguousLayout: Bool = false

    /// The name assigned to the anchor for debugging purposes.
    public private(set) var name: String = ""

    /// The layout item used to calculate the anchor’s position.
    public private(set) weak var item: AnyObject?

    // MARK: - Creating an NSLayoutAnchor

    public init() {
    }

    // MARK: - Building constraints

    /// Returns a constraint that defines one item’s attribute as equal to another.
    /// 
    /// This method defines the relationship first attribute = second attribute. 
    /// Where first attribute is the layout attribute represented by the anchor receiving this method call, and second attribute is the layout attribute represented by the anchor parameter.
    /// - Parameter anchor: A layout anchor from an ``NSView`` or ``NSLayoutGuide`` object. You must use a subclass of ``NSLayoutAnchor`` that matches the current anchor.
    /// - Returns: An ``NSLayoutConstraint`` object that defines an equal relationship between the attributes represented by the two layout anchors.
    public func constraint(equalTo anchor: NSLayoutAnchor<AnchorType>) -> NSLayoutConstraint {
        fatalError("not implemented yet")
    }

    /// Returns a constraint that defines one item’s attribute as equal to another item’s attribute plus a constant offset.
    /// 
    /// This method defines the relationship first attribute = second attribute + c.
    /// Where first attribute is the layout attribute represented by the anchor receiving this method call, and second attribute is the layout attribute represented by the anchor parameter. 
    /// The value c, represents a constant offset. 
    /// All values are measured in points; however, these values can be interpreted in different ways, depending on the type of layout anchor.
    /// 
    /// * For NSLayoutXAxisAnchor objects, the first attribute is positioned c points after the second attribute. 
    ///   When using leading or trailing attributes, values increase as you move in the language’s reading direction. 
    ///   In English, for example, values increase as you move to the right. 
    ///   For left and right attributes, values always increase as you move right.
    /// 
    /// * For NSLayoutYAxisAnchor objects, the first attribute is positioned c points below the second attribute. 
    ///   Values increase as you move down.
    /// 
    /// * For NSLayoutDimension objects, the size of the first attribute is c points larger than the size of the second attribute. 
    ///   Values increase as items increase in size.
    /// - Parameters:
    ///   - anchor: A layout anchor from an ``NSView`` or ``NSLayoutGuide`` object. You must use a subclass of ``NSLayoutAnchor`` that matches the current anchor.
    ///   - c: The constant offset for the constraint.
    /// - Returns: An ``NSLayoutConstraint`` object that defines an equal relationship between the attributes represented by the two layout anchors plus a constant offset.
    public func constraint(equalTo anchor: NSLayoutAnchor<AnchorType>, constant c: CGFloat) -> NSLayoutConstraint {
        fatalError("not implemented yet")
    }

    /// Returns a constraint that defines one item’s attribute as greater than or equal to another.
    /// 
    /// This method creates a relationship where first attribute >= second attribute. 
    /// Where first attribute is the layout attribute represented by the anchor receiving this method call, and second attribute is the layout attribute represented by the anchor parameter. 
    /// All values are measured in points; however, these values can be interpreted in different ways, depending on the type of layout anchor.
    /// 
    /// * For leading or trailing anchors, the values increase as you move in the current language’s reading direction. 
    ///   In English, for example, values increase as you move to the right.
    /// 
    /// * For left and right anchors, the values increase as you move to the right.
    /// * For NSLayoutYAxisAnchor objects, the values increase as you move down.
    /// * For NSLayoutDimension objects, the values increase as the items increase in size.
    /// - Parameter anchor: A layout anchor from an ``NSView`` or ``NSLayoutGuide`` object. You must use a subclass of NSLayoutAnchor that matches the current anchor.
    /// - Returns: An ``NSLayoutConstraint`` object that defines the attribute represented by this layout anchor as greater than or equal to the attribute represented by the anchor parameter.
    public func constraint(greaterThanOrEqualTo anchor: NSLayoutAnchor<AnchorType>) -> NSLayoutConstraint {
        fatalError("not implemented yet")
    }

    /// Returns a constraint that defines one item’s attribute as greater than or equal to another item’s attribute plus a constant offset.
    /// 
    /// This method defines the relationship first attribute >= second attribute + c. 
    /// Where first attribute is the layout attribute represented by the anchor receiving this method call, and second attribute is the layout attribute represented by the anchor parameter. 
    /// The value c, represents a constant offset. 
    /// All values are measured in points; however, these values can be interpreted in different ways, depending on the type of layout anchor.
    /// 
    /// * For NSLayoutXAxisAnchor objects, the first attribute is positioned c points after the second attribute. 
    ///   When using leading or trailing attributes, values increase as you move in the language’s reading direction. 
    ///   In English, for example, values increase as you move to the right. 
    ///   For left and right attributes, values always increase as you move right.
    /// 
    /// * For NSLayoutYAxisAnchor objects, the first attribute is positioned c points below the second attribute. 
    ///   Values increase as you move down.
    /// 
    /// * For NSLayoutDimension objects, the size of the first attribute is c points larger than the size of the second attribute. 
    ///   Values increase as items increase in size.
    /// - Parameters:
    ///   - anchor: A layout anchor from an ``NSView`` or ``NSLayoutGuide`` object. You must use a subclass of NSLayoutAnchor that matches the current anchor.
    ///   - c: The constant offset for the constraint.
    /// - Returns: An ``NSLayoutConstraint`` object that defines the attribute represented by this layout anchor as greater than or equal to the attribute represented by the anchor parameter plus a constant offset.
    public func constraint(greaterThanOrEqualTo anchor: NSLayoutAnchor<AnchorType>, constant c: CGFloat) -> NSLayoutConstraint {
        fatalError("not implemented yet")
    }

    /// Returns a constraint that defines one item’s attribute as less than or equal to another.
    /// 
    /// This method defines the relationship first attribute <= second attribute. 
    /// Where first attribute is the layout attribute represented by the anchor receiving this method call, and second attribute is the layout attribute represented by the anchor parameter. 
    /// All values are measured in points; however, these values can be interpreted in different ways, depending on the type of layout anchor.
    /// 
    /// * For leading or trailing anchors, the values increase as you move in the current language’s reading direction. 
    ///   For English, values increase as you move to the right.
    /// 
    /// * For left and right anchors, the values increase as you move to the right.
    /// * For NSLayoutYAxisAnchor objects, the values increase as you move down.
    /// * For NSLayoutDimension objects, the values increase as the items increase in size.
    /// - Parameter anchor: A layout anchor from an ``NSView`` or ``NSLayoutGuide`` object. You must use a subclass of NSLayoutAnchor that matches the current anchor.
    /// - Returns: An ``NSLayoutConstraint`` object that defines the attribute represented by this layout anchor as less than or equal to the attribute represented by the anchor parameter.
    public func constraint(lessThanOrEqualTo anchor: NSLayoutAnchor<AnchorType>) -> NSLayoutConstraint {
        fatalError("not implemented yet")
    }

    /// Returns a constraint that defines one item’s attribute as less than or equal to another item’s attribute plus a constant offset.
    /// 
    /// This method defines the relationship first attribute <= second attribute + c. 
    /// Where first attribute is the layout attribute represented by the anchor receiving this method call, and second attribute is the layout attribute represented by the anchor parameter. 
    /// The value c, represents a constant offset. 
    /// All values are measured in points; however, these values can be interpreted in different ways, depending on the type of layout anchor.
    /// 
    /// * For NSLayoutXAxisAnchor objects, the first attribute is positioned c points after the second attribute. 
    ///   When using leading or trailing attributes, values increase as you move in the language’s reading direction. 
    ///   In English, for example, values increase as you move to the right. 
    ///   For left and right attributes, values always increase as you move right.
    /// 
    /// * For NSLayoutYAxisAnchor objects, the first attribute is positioned c points below the second attribute. 
    ///   Values increase as you move down.
    /// 
    /// * For NSLayoutDimension objects, the size of the first attribute is c points larger than the size of the second attribute. 
    ///   Values increase as items increase in size.
    /// - Parameters:
    ///   - anchor: A layout anchor from an ``NSView`` or ``NSLayoutGuide`` object. You must use a subclass of NSLayoutAnchor that matches the current anchor
    ///   - c: The constant offset for the constraint.
    /// - Returns: An ``NSLayoutConstraint`` object that defines the attribute represented by this layout anchor as less than or equal to the attribute represented by the anchor parameter plus a constant offset.
    public func constraint(lessThanOrEqualTo anchor: NSLayoutAnchor<AnchorType>, constant c: CGFloat) -> NSLayoutConstraint {
        fatalError("not implemented yet")
    }
}