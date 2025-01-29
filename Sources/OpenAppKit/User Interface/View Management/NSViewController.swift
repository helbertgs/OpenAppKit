import Foundation
import OpenCoreGraphics

@MainActor
open class NSViewController: NSResponder {

    // MARK: -Represented Object

    /// The object whose value is presented in the receiver’s primary view.
    ///
    /// This property retains the object you provide to it; it does not copy it. 
    /// In another words, a view controller has a to-one relationship with its represented object and does not own it as an attribute.
    /// 
    /// The representedObject property is key-value coding and key-value observing compliant. 
    /// When you use the represented object as the file’s owner of a nib file, you can bind controls to the file’s owner using key paths that start with the string representedObject.
    public var representedObject: Any?

    // MARK: - Nib Properties

    /// The nib bundle to be loaded to instantiate the receiver’s primary view.
    public private(set) var nibBundle: Bundle?

    /// The name of the nib file to be loaded to instantiate the receiver’s primary view.
    public private(set) var nibName: NSNib.Name?

    // MARK: - Creating A View Controller

    /// Returns a view controller object initialized to the nib file in the specified bundle.
    /// - Parameters:
    ///   - nibNameOrNil: The name of the nib file, without any leading path information.
    ///   - nibBundleOrNil: The bundle in which to search for the nib file. If you specify nil, this method looks for the nib file in the main bundle
    /// - Returns: The initialized NSViewController object.
    public init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
        self.nibBundle = nibBundleOrNil
        self.nibName = nibNameOrNil

        super.init()
    }

    /// Instantiates a view from a nib file and sets the value of the view property.
    ///
    /// This method connects an instantiated view from a nib file to the view property of the view controller. 
    /// This method is called by the system, and is exposed in this class so you can override it to add behavior immediately before or after nib loading.
    /// 
    /// Do not call this method. If you require this method to be called, access the view property.
    /// Do not invoke this method from other objects unless you take care to avoid redundant invocations. 
    /// The default implementation of the loadView() method handles redundant invocations correctly, but a view controller subclass might not. 
    /// To be safe, other objects should instead access a view controller’s view property.
    /// 
    /// The loadView() method first obtains the values of the view controller’s nibName and nibBundle properties. 
    /// It then employs the NSNib class to instantiate the specified nib file via the instantiate(withOwner:topLevelObjects:) method, providing the view controller object as the owner parameter.
    open func loadView() {
        print("\(Self.self).\(#function)")
        if view == nil {
            self.view = .init(frame: .zero)
        }
        isViewLoaded = true
        viewDidLoad()
    }

    // MARK: - View Properties

    /// The view controller’s primary view.
    /// 
    /// If this property’s value is not already set when you access it, the view controller invokes the ``loadView()`` method. 
    /// That method, in turn, sets the view from the nib file identified by the view controller’s ``nibName`` and ``nibBundle`` properties.
    /// 
    /// If you want to set a view controller’s view directly, set this property’s value immediately after creating the view controller.
    public var view: NSView!

    /// The localized title of the receiver’s primary view.
    /// 
    /// You can employ the title property as needed for your app’s user interface, such as to enable a user to choose among multiple named views in a menu or other affordance. 
    /// The ``NSViewController`` class does not use this property for its own purposes.
    /// 
    /// The title property is key-value coding and key-value observing compliant.   
    public var title: String?

    // MARK: - Responding to View Events

    /// A Boolean value indicating whether the view controller’s view is loaded into memory.
    public private(set) var isViewLoaded: Bool = false  

    /// Called after the view controller’s view has been loaded into memory.
    /// 
    /// You can override this method to perform tasks to immediately follow the setting of the view property.
    /// 
    /// Typically, your override would perform one-time instantiation and initialization of the contents of the view controller’s view. 
    /// If you override this method, call this method on super at some point in your implementation in case a superclass also overrides this method.
    /// 
    /// For a view controller originating in a nib file, this method is called immediately after the view property is set. 
    /// For a view controller created programmatically, this method is called immediately after the loadView() method completes.
    /// 
    /// The default implementation of this method does nothing.
    open func viewDidLoad() {
        print("\(Self.self).\(#function)")
    }

    /// Called after the view controller’s view has been loaded into memory is about to be added to the view hierarchy in the window.
    /// 
    /// You can override this method to perform tasks prior to a view controller’s view getting added to view hierarchy, such as setting the view’s highlight color. 
    /// This method is called when:
    /// - The view is about to be added to the view hierarchy of the view controller
    /// - The view controller’s window is about to become visible, such as coming to the front or becoming unhidden
    /// 
    /// If you override this method, call this method on super at some point in your implementation in case a superclass also overrides this method.
    /// The default implementation of this method does nothing.
    open func viewWillAppear() {
        print("\(Self.self).\(#function)")
    }

    /// Called when the view controller’s view is fully transitioned onto the screen.
    /// 
    /// This method is called after the completion of any drawing and animations involved in the initial appearance of the view. 
    /// You can override this method to perform tasks appropriate for that time, such as work that should not interfere with the presentation animation, or starting an animation that you want to begin after the view appears.
    /// 
    /// If you override this method, call this method on super at some point in your implementation in case a superclass also overrides this method.
    /// The default implementation of this method does nothing.
    open func viewDidAppear() {
        print("\(Self.self).\(#function)")
    }

    /// Called when the view controller’s view is about to be removed from the view hierarchy in the window.
    /// 
    /// You can override this method to perform tasks that are to precede the disappearance of the view controller’s view, such as stopping a continuous animation that you started in response to the viewDidAppear() method call. 
    /// This method is called when:
    /// - The view is about to be removed from the view hierarchy of the window
    /// - The view is about to be hidden or obscured, such as in the case of a view controller whose parent is a tab view controller and the user switched to another tab
    /// - The window is being closed
    /// 
    /// If you override this method, call this method on super at some point in your implementation in case a superclass also overrides this method.
    /// The default implementation of this method does nothing.
    open func viewWillDisappear() {
        print("\(Self.self).\(#function)")
    }

    /// Called after the view controller’s view is removed from the view hierarchy in a window.
    /// 
    /// You can override this method to perform tasks associated with removing the view controller’s view from the window’s view hierarchy, such as releasing resources not needed when the view is not visible or no longer part of the window.
    /// 
    /// If you override this method, call this method on super at some point in your implementation in case a superclass also overrides this method.
    /// The default implementation of this method does nothing.
    open func viewDidDisappear() {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Managing View Layout

    /// The desired size of the view controller’s view, in screen units.
    /// 
    /// Set this property to express the desired size for a view controller’s view. 
    /// A parent view controller can consult the value of this property when performing layout.
    open var preferredContentSize: OpenCoreGraphics.CGSize = .init()

    /// Called during Auto Layout constraint updating to enable the view controller to mediate the process.
    /// 
    /// This method gets called, for example, when the user interacts with a view in a way that causes the layout to change. 
    /// When called, the default implementation of this method in turn calls the ``updateConstraints()`` method on the view controller’s view.
    /// 
    /// You can override this method to update custom view constraints, as an alternative to subclassing the view controller’s view and overriding its ``updateConstraints()`` method.
    /// 
    /// If you override this method, you must call this method on super at some point in your implementation or call the ``updateConstraints()`` method on the view controller’s view.
    public func updateViewConstraints() {
        print("\(Self.self).\(#function)")
    }

    /// Called just before the ``layout()`` method of the view controller’s view is called.
    /// 
    /// You can override this method to perform tasks to precede the layout of the view controller’s view, such as adjusting Auto Layout constraints. 
    /// If you override this method, call this method on super at some point in your implementation in case a superclass also overrides this method.
    /// 
    /// The default implementation of this method does nothing.
    open func viewWillLayout() {
        print("\(Self.self).\(#function)")
    }

    /// Called immediately after the ``layout()`` method of the view controller’s view is called.
    /// 
    /// You can override this method to perform tasks to follow the completion of layout of the view controller’s view. 
    /// If you override this method, call this method on super at some point in your implementation in case a superclass also overrides this method.
    /// 
    /// The default implementation of this method does nothing.
    open func viewDidLayout() {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Managing Child View Controllers in a Custom Container

    /// An array of view controllers that are hierarchical children of the view controller.
    /// 
    /// You can add or remove child view controllers by using this property. 
    /// When you do, the ``addChild(_:)`` or ``removeFromParent()`` method gets called accordingly.
    public var children: [NSViewController] = []

    /// A convenience method for adding a child view controller at the end of the ``children`` array.
    /// - Parameter childViewController: The view controller to be added to the end of the ``children`` array.
    public func addChild(_ childViewController: NSViewController) {
        print("\(Self.self).\(#function)")
        children.append(childViewController)
    }

    /// Inserts a specified child view controller into the ``children`` array at a specified position.
    /// 
    /// You should instead use the ``addChild(_:)`` method unless you want to perform work on child view controllers as you add them. 
    /// In that case, override this method to perform that work.
    /// 
    /// If a child view controller has a different parent when you call this method, the child is first be removed from its existing parent by calling the child’s ``removeFromParent()`` method.
    /// - Parameters:
    ///   - childViewController: The child view controller to add to the ``children`` array.
    ///   - index: The index in the ``children`` array at which to insert the child view controller. This value must not be greater than the count of elements in the array.
    public func insertChild(_ childViewController: NSViewController, at index: Int) {
        print("\(Self.self).\(#function)")
        children.insert(childViewController, at: index)
    }

    /// Removes a specified child controller from the view controller.
    /// 
    /// Override this method if you want to perform work during the removal of a child view controller. 
    /// If you do override this method, in your implementation call this method on super.
    /// 
    /// If you just want to remove a child view controller, instead use the ``removeFromParent()`` method
    /// - Parameter index: The index in the children array for the child view controller you want to remove.
    public func removeChild(at index: Int) {
        print("\(Self.self).\(#function)")
        children.remove(at: index)
    }

    /// Removes the called view controller from its parent view controller.
    /// 
    /// Use this method to remove a child view controller from its parent view controller, unless you want to perform work during the removal. 
    /// In that case, instead override the ``removeChild(at:)`` method to perform that work and call that method.
    /// 
    /// This is a convenience method that calls the ``removeChild(at:)`` method, automatically supplying the appropriate index value as an argument.
    public func removeFromParent() {
        print("\(Self.self).\(#function)")
        parent?.children.removeAll { $0 === self }
    }

    /// Called when there is a change in value of the ``preferredContentSize`` property of a child view controller or a presented view controller.
    /// 
    /// Override this method if you want to adjust layout when a child view controller or presented view controller changes its preferred content size.
    /// - Parameter viewController: The view controller whose ``preferredContentSize`` property value changed.
    public func preferredContentSizeDidChange(for viewController: NSViewController) {
        print("\(Self.self).\(#function)")
    }

    /// Performs a transition between two sibling child view controllers of the view controller.
    /// 
    /// Use this method to transition between sibling child view controllers owned by a parent view controller (which is the receiver of this method).
    /// 
    /// This method adds the view in the toViewController view controller to the superview of the view in the fromViewController view controller. 
    /// Likewise, this method removes the fromViewController view from the parent view controller’s view hierarchy at the appropriate time. 
    /// It is important to allow this method to add and remove these views.
    /// 
    /// ``` The receiver of this method must be the parent view controller of the fromViewController and toViewController view controllers, or else this method raises an exception. ```
    /// 
    /// To create a parent/child relationship between view controllers, use the ``addChild(_:)`` method or the ``insertChild(_:at:)`` method.
    /// - Parameters:
    ///   - fromViewController: A child view controller whose view is visible in the view controller’s view hierarchy.
    ///   - toViewController: A child view controller whose view is not in the view controller’s view hierarchy.
    ///   - options: A bitmask of options that specify how you want to perform the transition animation. For the options, see the ``NSViewController.TransitionOptions`` enumeration.
    ///   - completion: A block called immediately after the transition animation completes.
    public func transition(from fromViewController: NSViewController, to toViewController: NSViewController, options: [NSViewController.TransitionOptions] = [], completionHandler completion: (() -> Void)? = nil) {
        print("\(Self.self).\(#function)")
    }

    /// Performs a transition between two sibling child view controllers of the view controller.
    /// 
    /// Use this method to transition between sibling child view controllers owned by a parent view controller (which is the receiver of this method).
    /// 
    /// This method adds the view in the toViewController view controller to the superview of the view in the fromViewController view controller. 
    /// Likewise, this method removes the fromViewController view from the parent view controller’s view hierarchy at the appropriate time. 
    /// It is important to allow this method to add and remove these views.
    /// 
    /// ``` The receiver of this method must be the parent view controller of the fromViewController and toViewController view controllers, or else this method raises an exception. ```
    /// 
    /// To create a parent/child relationship between view controllers, use the ``addChild(_:)`` method or the ``insertChild(_:at:)`` method.
    /// - Parameters:
    ///   - fromViewController: A child view controller whose view is visible in the view controller’s view hierarchy.
    ///   - toViewController: A child view controller whose view is not in the view controller’s view hierarchy.
    ///   - options: A bitmask of options that specify how you want to perform the transition animation. For the options, see the ``NSViewController.TransitionOptions`` enumeration.
    public func transition(from fromViewController: NSViewController, to toViewController: NSViewController, options: [NSViewController.TransitionOptions] = []) async {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Getting Related View Controllers

    /// The immediate ancestor view controller of the view controller.
    /// 
    /// The value of this property is nil if the view controller has no parent view controller, such as if the view controller is a window’s content view controller.
    public weak var parent: NSViewController?

    /// The view controllers, if any, that are currently presented by the view controller.
    /// 
    /// There is a one-to-many relationship between the view controller whose ``presentedViewControllers`` property you are accessing, and the view controllers it is currently presenting.
    public var presentedViewControllers: [NSViewController]?

    /// The view controller that presented the view controller or that presented its farthest ancestor view controller.
    /// 
    /// The presenting view controller is the one that is ultimately responsible for presenting the view controller whose ``presentingViewController`` property you are accessing.
    public weak var presentingViewController: NSViewController?

}
