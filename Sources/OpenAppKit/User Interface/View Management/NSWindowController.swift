import Foundation

/// A controller that manages a window, usually a window stored in a nib file.
@MainActor 
open class NSWindowController : NSResponder {

    // MARK: - Getting Nib and Storyboard Information

    /// The owner of the nib file containing the window managed by the receiver.
    /// 
    /// The owner of the nib file containing the window managed by the receiver is usually self, but it can be the receiver’s document or some other object.
    public private(set) weak var owner: AnyObject?

    /// The storyboard file from which the window controller was loaded.
    /// 
    /// The value of this property is nil if the window controller was not loaded from a storyboard.
    public private(set) var storyboard: NSStoryboard?
    
    /// The name of the nib file that stores the window associated with the receiver.
    /// 
    /// If ``init(windowNibPath:owner:)`` was used to initialize the instance, ``windowNibName`` contains the last path component with the “.nib” extension stripped off. 
    /// If ``init(windowNibName:)`` or ``init(windowNibName:owner:)`` was used, ``NSWindowController`` contains the name without the “.nib” extension.
    public private(set) var windowNibName: NSNib.Name?

    /// The full path of the nib file that stores the window associated with the receiver.
    /// 
    /// If ``init(windowNibPath:owner:)`` was used to initialize the instance, this property contains the path. 
    /// If ``init(windowNibName:)`` or ``init(windowNibName:owner:)`` was used, ``windowNibPath`` locates the nib in the file’s owner’s class’ bundle or in the application’s main bundle and returns the full path (or nil if it cannot be located). 
    /// Subclasses can override this behavior to augment the search behavior, but probably ought to call super first.
    public var windowNibPath: String?

    // MARK: - Initializing Window Controllers

    /// Returns a window controller initialized with a given window.
    /// 
    /// This method is the designated initializer for NSWindowController.
    /// 
    /// This initializer is useful when a window has been loaded but no window controller is assigned. 
    /// The default initialization turns on cascading, sets the shouldCloseDocument property to false, and sets the window frame autosave name to an empty string. 
    /// As a side effect, the created window controller is added as an observer of the willCloseNotifications posted by that window object (which is handled by a private method). 
    /// If you make the window controller a delegate of the window, you can implement NSWindow’s windowShouldClose: delegate method.
    /// - Parameter window: 
    public init(window: NSWindow?) {
        self.window = window
    }

    /// Returns a window controller initialized with a nib file.
    /// 
    /// Sets the owner of the nib file to the receiver. 
    /// The default initialization turns on cascading, sets the ``shouldCloseDocument`` property to ``false``, and sets the autosave name for the window’s frame to an empty string.
    /// - Parameter windowNibName: The name of the nib file (minus the “.nib” extension) that archives the receiver’s window; cannot be nil.
    public convenience init(windowNibName: NSNib.Name) {
        fatalError("not implemented yet")
    }

    /// Returns a window controller initialized with a nib file and a specified owner for that nib file.
    /// 
    /// The default initialization turns on cascading, sets the ``shouldCloseDocument`` property to ``false``, and sets the autosave name for the window’s frame to an empty string.
    /// - Parameters:
    ///   - windowNibName: The name of the nib file (minus the “.nib” extension) that archives the receiver’s window; cannot be nil.
    ///   - owner: The nib file’s owner; cannot be nil.
    public convenience init(windowNibName: NSNib.Name, owner: Any) {
        fatalError("not implemented yet")
    }

    /// Returns a window controller initialized with a nib file at an absolute path and a specified owner.
    /// 
    /// Use this method if your nib file is at a fixed location (which is not inside either the file’s owner’s class’s bundle or in the application’s main bundle). 
    /// The default initialization turns on cascading, sets the ``shouldCloseDocument`` property to ``false``, and sets the autosave name for the window’s frame to an empty string.
    /// - Parameters:
    ///   - windowNibPath: The full path to the nib file that archives the receiver’s window; cannot be nil.
    ///   - owner: The nib file’s owner; cannot be nil.
    public convenience init(windowNibPath: String, owner: Any) {
        fatalError("not implemented yet")
    }

    // MARK: - Loading and Displaying the Window

    /// The window owned by the receiver.
    /// 
    /// Accessing this property loads the nib file if there is one and it has not yet been loaded. 
    /// If the window was loaded, the following methods are called in order: ``windowWillLoad()``, ``loadWindow()``, and ``windowDidLoad()``. 
    /// If the window controller has a document, the document’s corresponding methods ``windowControllerWillLoadNib(_:)`` and ``windowControllerDidLoadNib(_:)`` are also called (if implemented). 
    /// To affect nib loading or do something before or after it happens, you should always override these methods.
    /// 
    /// Setting this property releases the window controller’s old window along with any associated top-level objects in its nib file, and establishes ownership of the specified new window. 
    /// Typically, you should not use this property to set the window. 
    /// Instead, create a new window controller for the new window and then release the old window controller.
    public var window: NSWindow?

    /// A Boolean value that indicates whether the nib file containing the receiver’s window has been loaded.
    /// 
    /// The value of this property is true if the nib file containing the receiver’s window has been loaded, false otherwise.
    public private(set) var isWindowLoaded: Bool = false

    /// Sent before the window owned by the receiver is loaded.
    /// 
    /// The default implementation does nothing.
    open func windowWillLoad() {
        print("\(Self.self).\(#function)")
    }

    /// Loads the receiver’s window from the nib file.
    /// 
    /// You should never directly invoke this method. 
    /// Instead, access the window property so the ``windowDidLoad()`` and ``windowWillLoad()`` methods are invoked. 
    /// Subclasses can override this method if the way it finds and loads the window is not adequate. 
    /// It uses the Bundle class’s ``init(for:)`` method to get the bundle, using the class of the nib file owner as argument. 
    /// It then locates the nib file within the bundle and, if successful, loads it; if unsuccessful, it tries to find the nib file in the main bundle.
    open func loadWindow() {
        print("\(Self.self).\(#function)")
    }

    /// Sent after the window owned by the receiver has been loaded.
    /// 
    /// The default implementation does nothing.
    open func windowDidLoad() {
        print("\(Self.self).\(#function)")
    }

    /// Displays the window associated with the receiver.
    /// 
    /// If the window is an ``NSPanel`` object and has its ``becomesKeyOnlyIfNeeded`` flag set to true, the window is displayed in front of all other windows but is not made key; otherwise it is displayed in front and is made key. 
    /// This method is useful for menu actions.
    /// - Parameter sender: The control sending the message; can be nil.
    open func showWindow(_ sender: Any?) {
       print("\(Self.self).\(#function)")
    }

    // MARK: - Closing the Window

    /// A Boolean value that indicates whether the receiver necessarily closes the associated document when the window it manages is closed.
    /// 
    /// The value of this property is ``true`` if the receiver necessarily closes the associated document when the window it manages is closed, ``false`` otherwise. 
    /// The default value is false.
    public var shouldCloseDocument: Bool = false

    /// Closes the window if it was loaded.
    /// 
    /// Because this method closes the window without asking the user for confirmation, you usually do not invoke it when the Close menu command is chosen. 
    /// Instead invoke NSWindow’s ``performClose(_:)`` on the receiver’s window.
    open func close() {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Accessing Window Attributes and Content

    /// The view controller for the window’s content view.
    /// 
    /// The value of this property tracks the window’s contentView property.
    public var contentViewController: NSViewController?

    /// Dismisses the window controller.
    /// 
    /// This method does nothing if the receiver is not currently presented.
    /// - Parameter sender: The sender of the message.
    open func dismissController(_ sender: Any?) {
        print("\(Self.self).\(#function)") 
    }
}