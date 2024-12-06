import Foundation

/// The relationship between two user interface objects that must be satisfied by the constraint-based layout system.
/// 
/// Each constraint is a linear equation with the following format:
/// 
/// ```item1.attribute1 = multiplier × item2.attribute2 + constant```
/// 
/// In this equation, attribute1 and attribute2 are the variables that Auto Layout can adjust when solving these constraints. 
/// The other values are defined when you create the constraint. 
/// For example, If you’re defining the relative position of two buttons, you might say “the leading edge of the second button should be 8 points after the trailing edge of the first button.” 
/// The linear equation for this relationship is shown below:
/// positive values move to the right in left-to-right languages like English.
/// 
/// ```button2.leading = 1.0 × button1.trailing + 8.0```
/// 
/// Auto Layout then modifies the values of the specified leading and trailing edges until both sides of the equation are equal. 
/// Note that Auto Layout does not simply assign the value of the right side of this equation to the left side. 
/// Instead, the system can modify either attribute or both attributes as needed to solve for this constraint.
/// 
/// The fact that constraints are equations (and not assignment operators) means that you can switch the order of the items in the equation as needed to more clearly express the desired relationship. 
/// However, if you switch the order, you must also invert the multiplier and constant. 
/// For example, the following two equations produce identical constraints:
/// These equations produce identical constraints
/// ```button2.leading = 1.0 × button1.trailing + 8.0
/// button1.trailing = 1.0 × button2.leading - 8.0```
/// 
/// A valid layout is defined as a set constraints with one and only one possible solution. 
/// Valid layouts are also referred to as a nonambiguous, nonconflicting layouts. 
/// Constraints with more than one solution are ambiguous. 
/// Constraints with no valid solutions are conflicting. 
/// For more information on resolving ambiguous and conflicting constraints, see Types of Errors in Auto Layout Guide.
/// 
/// Additionally, constraints are not limited to equality relationships. 
/// They can also use greater than or equal to (>=) or less than or equal to (<=) to describe the relationship between the two attributes. 
/// Constraints also have priorities between 1 and 1,000. 
/// Constraints with a priority of 1,000 are required. 
/// All priorities less than 1,000 are optional. By default, all constraints are required (priority = 1,000).
/// 
/// After solving for the required constraints, Auto Layout tries to solve all the optional constraints in priority order from highest to lowest. 
/// If it cannot solve for an optional constraint, it tries to come as close as possible to the desired result, and then moves on to the next constraint.
/// 
/// This combination of inequalities, equalities, and priorities gives you a great amount of flexibility and power. 
/// By combining multiple constraints, you can define layouts that dynamically adapt as the size and location of the elements in your user interface change. 
/// For some example layouts, see Stack Views in Auto Layout Guide.
@MainActor public class NSLayoutConstraint {
    
    // MARK: - Accessing constraint data
    
    /// The first object participating in the constraint.
    public private(set) unowned var firstItem: AnyObject?

    /// The attribute of the first object participating in the constraint.
    public private(set) var firstAttribute: NSLayoutConstraint.Attribute

    /// The relation between the two attributes in the constraint.
    public private(set) var relation: NSLayoutConstraint.Relation

    /// The second object participating in the constraint.
    public private(set) unowned var secondItem: AnyObject?

    /// The attribute of the second object participating in the constraint.
    public private(set) var secondAttribute: NSLayoutConstraint.Attribute

    /// The multiplier applied to the second attribute participating in the constraint.
    public private(set) var multiplier: CGFloat

    /// The constant added to the multiplied second attribute participating in the constraint.
    /// 
    /// Unlike the other properties, the constant can be modified after constraint creation. 
    /// Setting the constant on an existing constraint performs much better than removing the constraint and adding a new one that’s exactly like the old except that it has a different constant.
    public private(set) var constant: CGFloat

    /// The first anchor that defines the constraint.
    public private(set) var firstAnchor: NSLayoutAnchor<AnyObject>

    /// The second anchor that defines the constraint.
    public private(set) var secondAnchor: NSLayoutAnchor<AnyObject>?

    // MARK: - Getting the layout priority
    
    /// The priority of the constraint.
    /// 
    /// By default, all constraints are required; this property is set to required in macOS or UILayoutPriorityRequired in iOS.
    /// 
    /// If a constraint’s priority level is less than required in macOS or UILayoutPriorityRequired in iOS, then it is optional. 
    /// Higher priority constraints are satisfied before lower priority constraints; however, optional constraint satisfaction is not all or nothing. If a constraint a == b is optional, the constraint-based layout system will attempt to minimize abs(a-b).
    /// 
    /// Priorities may not change from nonrequired to required, or from required to nonrequired. 
    /// An exception will be thrown if a priority of required in macOS or UILayoutPriorityRequired in iOS is changed to a lower priority, or if a lower priority is changed to a required priority after the constraints is added to a view. 
    /// Changing from one optional priority to another optional priority is allowed even after the constraint is installed on a view.
    /// 
    /// Priorities must be greater than 0 and less than or equal to required in macOS or UILayoutPriorityRequired in iOS.
    public private(set) var priority: NSLayoutConstraint.Priority

    // MARK: - Identifying a constraint

    /// The name that identifies the constraint.
    /// 
    /// A constraint’s identifier is available in its description. 
    /// Identifiers that start with NS are reserved by the system.
    public private(set) var identifier: String?

    // MARK: - Controlling constraint archiving
    
    /// A Boolean value that determines whether the constraint should be archived by its owning view.
    /// 
    /// When a view is archived, it archives some but not all constraints in its constraints array. 
    /// The value of shouldBeArchived informs the view if a particular constraint should be archived by the view.
    /// 
    /// If a constraint is created at runtime in response to the state of the object, it isn’t appropriate to archive the constraint. 
    /// Instead you archive the state that gives rise to the constraint. 
    /// The default value for this property is false.
    public private(set) var shouldBeArchived: Bool = false

    // MARK: - Activating and deactivating constraints
    
    /// The active state of the constraint.
    /// 
    /// You can activate or deactivate a constraint by changing this property. 
    /// Note that only active constraints affect the calculated layout. 
    /// If you try to activate a constraint whose items have no common ancestor, an exception is thrown. 
    /// For newly created constraints, the isActive property is false by default.
    /// 
    /// Activating or deactivating the constraint calls ``addConstraint(_:)`` and ``removeConstraint(_:)`` on the view that is the closest common ancestor of the items managed by this constraint. 
    /// Use this property instead of calling ``addConstraint(_:)`` or ``removeConstraint(_:)`` directly.
    public var isActive: Bool = false

    /// Activates each constraint in the specified array.
    /// 
    /// This convenience method provides an easy way to activate a set of constraints with one call. 
    /// The effect of this method is the same as setting the ``isActive`` property of each constraint to ``true``. 
    /// Typically, using this method is more efficient than activating each constraint individually.
    /// - Parameter constraints: An array of constraints to activate.
    public static func activate(_ constraints: [NSLayoutConstraint]) {
        constraints.forEach {
            $0.isActive = true
        }
    }
    
    /// Deactivates each constraint in the specified array.
    /// 
    /// This is a convenience method that provides an easy way to deactivate a set of constraints with one call. 
    /// The effect of this method is the same as setting the ``isActive`` property of each constraint to ``false``. 
    /// Typically, using this method is more efficient than deactivating each constraint individually.
    /// - Parameter constraints: An array of constraints to deactivate.
    public static func deactivate(_ constraints: [NSLayoutConstraint]) {
        constraints.forEach {
            $0.isActive = false
        }
    }

    // MARK: - Creating constraints

    /// Creates constraints described by an ASCII art-like visual format string.
    /// - Parameters:
    ///   - format: The format specification for the constraints.
    ///   - opts: Options describing the attribute and the direction of layout for all objects in the visual format string.
    ///   - metrics: A dictionary of constants that appear in the visual format string. The dictionary’s keys must be the string values used in the visual format string.
    ///   - views: A dictionary of views that appear in the visual format string. The keys must be the string values used in the visual format string, and the values must be the view objects.
    /// - Returns: An array of constraints that, combined, express the constraints between the provided views and their parent view as described by the visual format string. The constraints are returned in the same order they were specified in the visual format string.
    public static func constraints(withVisualFormat format: String, options opts: NSLayoutConstraint.FormatOptions = [], metrics: [String : Any]?, views: [String : Any]) -> [NSLayoutConstraint] {
        []
    }

    /// Creates a constraint that defines the relationship between the specified attributes of the given views.
    /// 
    /// Constraints represent linear equations of the form view1.attr1 <relation> multiplier × view2.attr2 + c. 
    /// If the constraint you wish to express does not have a second view and attribute, use nil and NSLayoutConstraint.Attribute.notAnAttribute.
    /// 
    /// > Note: This method throws an ``invalidArgumentException`` exception if it is used to create an invalid constraint (for example, view1.top == 0.0 x nil.NotAnAttribute + 200.0 or view1.top == 1.0 x view2.height + 20.0).
    /// >
    /// > In general, you should use the layout anchor API to programmatically create constraints. 
    /// > This API includes additional type information that can catch many invalid constraints at build time. 
    /// > For more information, see Creating Constraints Using Layout Anchors in ``NSView``.
    /// 
    /// - Parameters:
    ///   - item: The view for the left side of the constraint.
    ///   - attribute: The attribute of the view for the left side of the constraint.
    ///   - relatedBy: The relationship between the left side of the constraint and the right side of the constraint.
    ///   - toItem: The view for the right side of the constraint.
    ///   - attribute: The attribute of the view for the right side of the constraint.
    ///   - multiplier: The constant multiplied with the attribute on the right side of the constraint as part of getting the modified attribute.
    ///   - constant : The constant added to the multiplied attribute value on the right side of the constraint to yield the final modified attribute.
    public init(item view1: AnyObject, attribute attr1: NSLayoutConstraint.Attribute, relatedBy relation: NSLayoutConstraint.Relation, toItem view2: AnyObject?, attribute attr2: NSLayoutConstraint.Attribute, multiplier: CGFloat, constant c: CGFloat) {
        self.firstItem = view1
        self.firstAttribute = attr1
        self.relation = relation
        self.secondItem = view2
        self.secondAttribute = attr2
        self.multiplier = multiplier
        self.constant = c
        self.priority = .defaultLow
        self.firstAnchor = .init()
    }
}