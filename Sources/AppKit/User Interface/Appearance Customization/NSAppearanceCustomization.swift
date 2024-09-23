import Foundation

/// A set of methods for getting and setting the appearance attributes of a view.
/// 
/// When an object adopts this protocol, assigning a value to the appearance property causes that object to use the appearance attributes you specified instead of any inherited attributes. 
/// You can access the current attributes for the object from the effectiveAppearance property, which reflects any inherited attributes.
public protocol NSAppearanceCustomization: AnyObject {

    // MARK: - Getting and Setting Appearance

    /// The appearance of the receiver, in an NSAppearance object.
    var appearance: NSAppearance? { get set }

    /// The appearance that will be used when the receiver is drawn onscreen, in an NSAppearance object. (read-only)
    var effectiveAppearance: NSAppearance { get set }
}