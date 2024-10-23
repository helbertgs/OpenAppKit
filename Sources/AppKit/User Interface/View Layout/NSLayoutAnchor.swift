import Foundation

/// A factory class for creating layout constraint objects using a fluent API.
/// 
/// Use these constraints to programatically define your layout using Auto Layout. 
/// Instead of creating ``NSLayoutConstraint`` objects directly, start with a ``UIView``, ``NSView``, or ``UILayoutGuide`` object you wish to constrain, and select one of that object’s anchor properties. 
/// These properties correspond to the main ``NSLayoutConstraint.Attribute`` values used in Auto Layout, and provide an appropriate ``NSLayoutAnchor`` subclass for creating constraints to that attribute. 
/// Use the anchor’s methods to construct your constraint.
public class NSLayoutAnchor<AnchorType> where AnchorType : AnyObject {

}