import Foundation

/// An encapsulation of the design-time view controller and window controller graph represented in an Interface Builder storyboard resource file.
public class NSStoryboard {

    // MARK: - Creating a Storyboard Object

    /// The name of the storyboard file.
    public typealias Name = String

    /// The app’s main storyboard.
    /// 
    /// The name of the main storyboard is stored in the NSMainStoryboardFile key of the app’s Info.plist file.
    public static var main: NSStoryboard? {
        nil
    }

    /// Creates a storyboard based on the named storyboard file in the specified bundle.
    /// - Parameters:
    ///   - name: The name of the storyboard file, without the filename extension. This method raises an exception if this parameter’s value is nil.
    ///   - storyboardBundleOrNil: The bundle used to resolve references to resources, typically images, in the archived controllers represented in the storyboard file. If you specify nil, OpenAppKit uses the app’s main bundle.
    public init(name: NSStoryboard.Name = "", bundle storyboardBundleOrNil: Bundle? = nil) {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Loading the Initial View Controller

    /// Creates the initial view controller or window controller from a storyboard.
    /// 
    /// Every storyboard has an initial view controller or window controller that represents its starting point. 
    /// For the main storyboard, this is usually the first controller presented to the user at launch time. 
    /// Designate the initial view controller in Interface Builder when configuring the storyboard file.
    /// 
    /// Typically, you call this method only when transitioning to the initial view controller in a different storyboard file. 
    /// For your app’s main storyboard file—that is, the storyboard file specified in the app’s Info.plist file using the ``UIMainStoryboardFile`` key—the initial view controller is loaded into memory and presented automatically.
    /// 
    /// Each time you call this method, it creates a new instance of the initial controller.
    /// - Returns: 
    public func instantiateInitialController() -> Any? {
        print("\(Self.self).\(#function)")
        return nil
    }

    /// Creates the initial view controller from the storyboard and initializes it using your custom code.
    /// 
    /// Every storyboard file has an initial controller object that represents the default interface to create. 
    /// Use this method to construct that object using a custom code that you provide. 
    /// Use this method when the constructor for your object takes parameters in addition to the specified coder object.
    /// 
    /// In your creator block, create the view controller using your custom constructor method. 
    /// Your custom constructor method must accept an ``NSCoder`` parameter and must call the ``inherited init(coder:)`` method at some point during its execution. 
    /// Not doing so is a programmer error.
    /// - Parameter creator: A block that contains your custom creation code for the view controller. Use this block to create the view controller, initialize it with the provided coder object and any custom information you require, and return the result.
    /// - Returns: The initial view controller in the storyboard.
    public func instantiateInitialController<Controller>(creator: ((NSCoder) -> Controller?)? = nil) -> Controller? where Controller : NSViewController {
        print("\(Self.self).\(#function)")
        return nil
    }

    // MARK: - Instantiating Storyboard Controllers

    /// A string that uniquely identifies a view controller or window controller in your storyboard file.
    /// 
    /// Set scene identifiers in your storyboard by assigning a value to the Storyboard ID attribute.
    public typealias SceneIdentifier = String

    /// Instantiates a specified view controller or window controller from a storyboard.
    /// 
    /// Use this method to create a view controller or window controller object that you want to manipulate and present programmatically. 
    /// Your controller object must have an identifier string. In Xcode’s storyboard editor, select your controller, display the identity inspector, and place this string in the Storyboard ID field.
    /// 
    /// This method creates a new instance of the specified controller each time you call it.
    /// - Parameter identifier: The unique identifier for the controller, which you have specified using the Identity inspector in Interface Builder.
    /// - Returns: The instantiated view controller or window controller identified by the identifier parameter, from the storyboard file. If the specified identifier does not exist (or is nil) in the storyboard file, this method raises an exception.
    public func instantiateController(withIdentifier identifier: NSStoryboard.SceneIdentifier) -> Any {
        print("\(Self.self).\(#function)")
        fatalError()
    }
}