import Foundation
import OpenCoreGraphics


/// A window that an app displays on the screen.
public class NSWindow: NSResponder {

    // MARK: - Creating a Window

    /// Creates a titled window that contains the specified content view controller.
    /// 
    /// This method creates a basic window object that is titled, closable, resizable, and miniaturizable. By default, the window's title is automatically bound to the title of contentViewController. 
    /// You can control the size of the window by using Auto Layout and applying size constraints to the view or its subviews. 
    /// The initial size of the window is set to the initial size of contentView (that is, the size of contentViewController.view).
    /// - Parameter contentViewController: The view controller that provides the main content view for the window. The window’s contentView property is set to contentViewController.view.
    /// - Returns: A window with the content view controller set to the passed-in view controller object.
    public init(contentViewController: NSViewController) {
        self.contentViewController = contentViewController
        self.contentView = self.contentViewController?.view

        super.init()

        self.contentView?.window = self
        self.graphicsContext = NSGraphicsContext(window: self)
    }

    // MARK: - Managing the Window's Behavior

    /// The window’s delegate.
    /// 
    /// The value of this property is nil if the window doesn’t have a delegate.
    /// A window object’s delegate is inserted in the responder chain after the window itself and is informed of various actions by the window through delegation messages.
    public weak var delegate: (any NSWindowDelegate)?

    // MARK: - Configuring the Window's Content

    /// The graphics context associated with the window for the current thread.
    public private(set) var graphicsContext: NSGraphicsContext?

    /// The main content view controller for the window.
    /// 
    /// The value of this property provides the content view of the window. 
    /// Setting this value removes the existing value of contentView and makes the contentViewController.view the main content view for the window. 
    /// By default, the value of this property is nil.
    public var contentViewController: NSViewController?

    /// The window’s content view, the highest accessible view object in the window’s view hierarchy.
    /// 
    /// The window retains the new content view and owns it thereafter. 
    /// The view object is resized to fit precisely within the content area of the window. 
    /// You can modify the content view’s coordinate system through its bounds rectangle, but you can’t alter its frame rectangle (its size or location) directly.
    /// 
    /// Setting this property releases the old content view. 
    /// If you plan to reuse it, be sure to retain it before changing the property value and to release it as appropriate when adding it to another NSWindow or NSView object.
    public var contentView: NSView?

    // MARK: - Configuring the Window's Appearance

    /// Flags that describe the window’s current style, such as if it’s resizable or in full-screen mode.
    /// Changing the style mask may cause the view hierarchy to be rebuilt.
    public var styleMask: StyleMask = .init(rawValue: 0)

    /// Takes the window into or out of fullscreen mode.
    /// 
    /// If an application supports fullscreen, it should add a menu item to the View menu with toggleFullScreen: as the action, and nil as the target.
    /// - Parameter sender: The object that sent the message.
    public func toggleFullScreen(_ sender: Any?) {
    }

    /// A Boolean value that indicates whether the window is able to receive keyboard and mouse events even when some other window is being run modally.
    /// 
    /// The value of this property is true if the window is able to receive keyboard and mouse events even when some other window is being run modally; otherwise, false. 
    /// By default, the NSWindow value of this property is false. Only subclasses of NSPanel should override this default.
    public let worksWhenModal: Bool = true

    /// The window’s alpha value.
    public var alphaValue: Float = 1.0

    /// The color of the window’s background.
    public var backgroundColor: NSColor = NSColor(red: 1, green: 0, blue: 0)

    /// The window’s color space.
    /// The value of this property is nil if the window does not have a backing store, and is off-screen.
    public var colorSpace: NSColorSpace?

    /// Sets a Boolean value that indicates whether the window’s depth limit can change to match the depth of the screen it’s on.
    /// - Parameter flag: true if the window’s depth can change; otherwise, false.
    public func setDynamicDepthLimit(_ flag: Bool) {
    }

    /// A Boolean value that indicates whether the window can hide when its application becomes hidden.
    /// 
    /// The value of this property is true if the window can hide when its application becomes hidden (during execution of the NSApplicationhide(_:) method); otherwise, false. 
    /// By default, the value of the property is true.
    public var canHide: Bool = true

    /// A Boolean value that indicates whether the window is on the currently active space.
    /// 
    /// The value of this property is true if the window is on the currently active space; otherwise, false. 
    /// For visible windows, this property indicates whether the window is currently visible on the active space. 
    /// For nonvisible windows, it indicates whether ordering the window onscreen would cause it to be on the active space.
    public var isOnActiveSpace: Bool = true

    /// A Boolean value that indicates whether the window is removed from the screen when its application becomes inactive.
    /// 
    /// The value of this property is true if the window is removed from the screen when its application is deactivated; false if it remains onscreen. 
    /// The default value for ``NSWindow`` is false; the default value for NSPanel is true.
    public var hidesOnDeactivate: Bool = false

    /// A value that identifies the window’s behavior in window collections.
    public var collectionBehavior: CollectionBehavior = .primary

    /// A Boolean value that indicates whether the window is opaque.
    /// The value of this property is true when the window is opaque; otherwise, false.
    public var isOpaque: Bool =  true

    /// A Boolean value that indicates whether the window has a shadow.
    /// The value of this property is true when the window has a shadow; otherwise, false. 
    /// If you change the value of this property, the window shadow is invalidated, forcing the window shadow to be recomputed.
    public var hasShadow: Bool = true

    /// Invalidates the window shadow so that it is recomputed based on the current window shape.
    public func invalidateShadow() {
    }

    /// An object that the window inherits its appearance from.
    /// The default value of this property is NSApp. 
    /// The window uses key-value observing to monitor the source’s effectiveAppearance for changes. 
    /// Typically, you use this property for child windows shown from a parent window or specific view.
    public weak var appearanceSource: (any NSAppearanceCustomization)?

    // MARK: - Accessing Window Information

    /// The depth limit of the window.
    public var depthLimit: Depth = .onehundredtwentyeightBitRGB

    /// A Boolean value that indicates whether the window’s depth limit can change to match the depth of the screen it’s on.
    /// 
    /// The value of this property is true when the window has a dynamic depth limit; otherwise, false. 
    /// When the value of hasDynamicDepthLimit is false, the window uses either its preset depth limit or the default depth limit. 
    /// A different, and non-dynamic, depth limit can be set using the depthLimit property.
    public var hasDynamicDepthLimit: Bool = true

    /// The window number of the window’s window device.
    /// 
    /// ach window device in an application is given a unique window number—note that this isn’t the same as the global window number assigned by the window server. 
    /// This number can be used to identify the window device with the order(_:relativeTo:) method and in the AppKit function NSWindowList.
    /// 
    /// If the window doesn’t have a window device, the value of this property is equal to or less than 0.
    public var windowNumber: Int = 0

    /// Returns the window numbers for all visible windows satisfying the specified options.
    /// - Parameter options: The possible options are specified in NSWindow.NumberListOptions.
    /// - Returns: An array of window numbers for all visible windows satisfying the specified options. (Windows on the active space are returned in z-order; that is, front to back.)
    public class func windowNumbers(options: NumberListOptions = []) -> [Int]? {
        []
    }

    /// A dictionary containing information about the window’s resolution, such as color, depth, and so on.
    /// 
    /// This information is useful for tuning images and colors to the window’s display capabilities. 
    /// The contents of the dictionary are described in Display Device—Descriptions.
    public var deviceDescription: [NSDeviceDescriptionKey : Any] = [:]

    /// The window’s backing store type.
    /// 
    /// The possible values for this property are described in ``NSWindow.BackingStoreType``. 
    /// You can set the property only to switch a buffered window to retained or vice versa; you can’t change the backing type to or from nonretained after initializing a ``NSWindow`` object (an error is generated if you attempt to do so).
    public var backingType: BackingStoreType = .buffered

    // MARK: - Sizing Windows

    /// The window’s frame rectangle in screen coordinates, including the title bar.
    public var frame: OpenCoreGraphics.CGRect = CGRect()

    /// Positions the bottom-left corner of the window’s frame rectangle at a given point in screen coordinates.
    /// Note that the window server limits window position coordinates to ±16,000.
    /// - Parameter point: The new position of the window’s bottom-left corner in screen coordinates.
    public func setFrameOrigin(_ point: OpenCoreGraphics.CGPoint) {
        self.frame.origin = point
    }

    /// Positions the top-left corner of the window’s frame rectangle at a given point in screen coordinates.
    /// Note that the window server limits window position coordinates to ±16,000; if necessary, adjust aPoint relative to the window’s lower-left corner to account for this limit.
    /// - Parameter point: The new position of the window’s top-left corner in screen coordinates.
    public func setFrameTopLeftPoint(_ point: OpenCoreGraphics.CGPoint) {
    }

    /// Modifies and returns a frame rectangle so that its top edge lies on a specific screen.
    /// 
    /// If the window is resizable and the window’s height is greater than the screen height, the rectangle’s height is adjusted to fit within the screen as well. 
    /// The rectangle’s width and horizontal location are unaffected. 
    /// You shouldn’t need to invoke this method yourself; it’s invoked automatically (and the modified frame is used to locate and set the size of the window) whenever a titled NSWindow object is placed onscreen and whenever its size is changed.
    /// Subclasses can override this method to prevent their instances from being constrained or to constrain them differently.
    /// - Parameters:
    ///   - frameRect: The proposed frame rectangle to adjust.
    ///   - screen: The screen on which the top edge of the window’s frame is to lie.
    /// - Returns: The adjusted frame rectangle.
    public func constrainFrameRect(_ frameRect: OpenCoreGraphics.CGRect, to screen: NSScreen?) -> OpenCoreGraphics.CGRect {
        .init()
    }

    /// Positions the window’s top-left to a given point.
    /// 
    /// The returned point can be passed to a subsequent invocation of cascadeTopLeft(from:) to position the next window so the title bars of both windows are fully visible.
    /// - Parameter topLeftPoint: The new top-left point, in screen coordinates, for the window. When ``NSZeroPoint``, the window is not moved, except as needed to constrain to the visible screen
    /// - Returns: The point shifted from top left of the window in screen coordinates.
    public func cascadeTopLeft(from topLeftPoint: OpenCoreGraphics.CGPoint) -> OpenCoreGraphics.CGPoint {
        .init()
    }

    /// Sets the origin and size of the window’s frame rectangle according to a given frame rectangle, thereby setting its position and size onscreen.
    /// Note that the window server limits window position coordinates to ±16,000 and sizes to 10,000.
    /// - Parameters:
    ///   - frameRect: The frame rectangle for the window, including the title bar.
    ///   - flag: Specifies whether the window redraws the views that need to be displayed. When true the window sends a ``displayIfNeeded()`` message down its view hierarchy, thus redrawing all views.
    public func setFrame(_ frameRect: OpenCoreGraphics.CGRect, display flag: Bool) {
        self.frame = frameRect
        self.viewsNeedDisplay = flag
    }

    /// Sets the origin and size of the window’s frame rectangle, with optional animation, according to a given frame rectangle, thereby setting its position and size onscreen.
    /// - Parameters:
    ///   - frameRect: The frame rectangle for the window, including the title bar.
    ///   - displayFlag: Specifies whether the window redraws the views that need to be displayed. When true the window sends a displayIfNeeded() message down its view hierarchy, thus redrawing all views.
    ///   - animateFlag: Specifies whether the window performs a smooth resize. true to perform the animation, whose duration is specified by animationResizeTime(_:).
    public func setFrame(_ frameRect: OpenCoreGraphics.CGRect, display displayFlag: Bool, animate animateFlag: Bool) { 
        self.frame = frameRect
        self.viewsNeedDisplay = displayFlag
    }

    /// Specifies the duration of a smooth frame-size change.
    /// - Parameter newFrame: The frame rectangle specified in ``setFrame(_:display:animate:)``.
    /// - Returns: The duration of the frame size change.
    public func animationResizeTime(_ newFrame: OpenCoreGraphics.CGRect) -> TimeInterval {
        0.20
    }

    /// The window’s aspect ratio, which constrains the size of its frame rectangle to integral multiples of this ratio when the user resizes it.
    /// 
    /// The size of the window’s frame rectangle is constrained to integral multiples of this ratio when the user resizes it. 
    /// You can set an NSWindow object’s size to any ratio programmatically.
    /// 
    /// An NSWindow object’s aspect ratio and its resize increments are mutually exclusive attributes. 
    /// In fact, setting one attribute cancels the setting of the other. 
    /// For example, to cancel an established aspect ratio setting for an NSWindow object, you can set the ``resizeIncrements`` property with the width and height set to 1.0:
    /// ```myWindow.resizeIncrements = OpenCoreGraphics.CGSize(width: 1.0, height: 1.0);```
    /// The contentAspectRatio property takes precedence over this property.
    public var aspectRatio: OpenCoreGraphics.CGSize = CGSize(width: 1.0, height: 1.0)

    /// The minimum size to which the window’s frame (including its title bar) can be sized.
    /// 
    /// The minimum size constraint is enforced for resizing by the user as well as for the ``setFrame``... methods other than ``setFrame(_:display:)`` and ``setFrame(_:display:animate:)``.
    /// The NSWindow method takes precedence over this property.
    public var minSize: OpenCoreGraphics.CGSize = CGSize()

    /// The maximum size to which the window’s frame (including its title bar) can be sized.
    /// 
    /// The maximum size constraint is enforced for resizing by the user as well as for the setFrame... methods other than ``setFrame(_:display:)`` and ``setFrame(_:display:animate:)``. 
    /// Note that the window server limits window sizes to 10,000.
    /// 
    /// The default maximum size of a window is CGSize(width: .inifity, height: .inifity).
    /// When the maximum size of a window has been set, there is no way to reset it other than by specifying this default maximum size.
    /// 
    /// The contentMaxSize property takes precedence over this property.
    public var maxSize: OpenCoreGraphics.CGSize = CGSize(width: .infinity, height: .infinity)

    /// A Boolean value that indicates whether the window is in a zoomed state.
    /// 
    /// The value of this property is true if the window is in a zoomed state; otherwise, false.
    /// The zoomed state of the window is determined using the following steps:
    /// 1. If the delegate or the window class implements ``windowWillUseStandardFrame(_:defaultFrame:)``, it is invoked to obtain the zoomed frame of the window. 
    /// The value of isZoomed is then determined by whether or not the current window frame is equal to the zoomed frame.
    /// 2. If the neither the delegate nor the window class implements ``windowWillUseStandardFrame(_:defaultFrame:)``, a default frame that nearly fits the screen is chosen. 
    /// If the delegate or window class implements ``windowWillUseStandardFrame(_:defaultFrame:)``, it is invoked to validate the proposed zoomed frame. 
    /// After the zoomed frame is validated, the value of isZoomed is determined by whether or not the current window frame is equal to the zoomed frame.
    public var isZoomed: Bool = false

    /// This action method simulates the user clicking the zoom box by momentarily highlighting the button and then zooming the window.
    /// If the window doesn’t have a zoom box or can’t be zoomed for some reason, the computer beeps.
    /// - Parameter sender: The object sending the message.
    public func performZoom(_ sender: Any?) {
    }

    /// Toggles the size and location of the window between its standard state (which the application provides as the best size to display the window’s data) and its user state (a new size and location the user may have set by moving or resizing the window).
    /// 
    /// For more information on the standard and user states, see windowWillUseStandardFrame(_:defaultFrame:).
    /// Typically, the system invokes the ``zoom(_:)`` method after a user clicks the window’s zoom box, and ``performZoom(_:)`` may also invoke ``zoom(_:)`` programmatically. It performs the following steps:
    /// 1. Invokes the windowWillUseStandardFrame(_:defaultFrame:) method, if the delegate or the window class implements it, to obtain a “best fit” frame for the window. 
    /// If neither the delegate nor the window class implements the method, zoom(_:) uses a default frame. The default frame nearly fills the current screen that contains the largest part of the window’s current frame.
    /// 2. Adjusts the resulting frame, if necessary, to fit on the current screen.
    /// 3. Compares the resulting frame to the current frame to determine whether the window’s standard frame is currently displayed. If the current frame is within a few pixels of the standard frame in size and location, the system considers it a match.
    /// 4. Determines a new frame. If the window is currently in the standard state, the new frame represents the user state, saved during a previous zoom. 
    /// If the window is currently in the user state, the new frame represents the standard state, computed in step 1 above. 
    /// If there’s no saved user state because there has been no previous zoom, the size and location of the window don’t change.
    /// 5. Determines whether the window currently allows zooming. By default, zooming is allowed. 
    /// If the window’s delegate implements the ``windowShouldZoom(_:toFrame:)`` method, ``zoom(_:)`` invokes that method. 
    /// If the delegate doesn’t implement the method but the window does, ``zoom(_:)`` invokes the window’s version. ``windowShouldZoom(_:toFrame:)`` returns false if zooming isn’t currently allowed.
    /// 6. If the window currently allows zooming, sets the new frame.
    /// - Parameter sender: The object sending the message.
    public func zoom(_ sender: Any?) {
    }

    /// The flags field of the event record for the mouse-down event that initiated the resizing session.
    /// 
    /// The value of this property is a mask indicating which of the modifier keys was held down when the mouse-down event occurred. 
    /// The flags are listed in ``NSEvent`` class's ``modifierFlags`` method description. The property is valid only while the window is being resized.
    /// You can use this property to constrain the direction or amount of resizing. 
    /// Because of its limited validity, this property should only be accessed from within an implementation of the delegate method ``windowWillResize(_:to:)``.
    public var resizeFlags: NSEvent.ModifierFlags = .none

    /// The window’s resizing increments.
    /// 
    /// This property restricts the user’s ability to resize the window so the width and height change by multiples of width and height increments. 
    /// As the user resizes the window, its size changes by multiples of increments.width and increments.height, which should be whole numbers, 1.0 or greater. 
    /// Whatever the current resizing increments, you can set an NSWindow object’s size to any height and width programmatically.
    /// Resize increments and aspect ratio are mutually exclusive attributes. For more information, see ``aspectRatio``.
    /// The ``contentResizeIncrements`` property takes precedence over this property.
    public var resizeIncrements: OpenCoreGraphics.CGSize = .init()

    /// A Boolean value that indicates whether the window tries to optimize user-initiated resize operations by preserving the content of views that have not changed.
    /// 
    /// The value of this property is true if the window tries to optimize live resize operations by preserving the content of views that have not moved; otherwise, false. 
    /// By default, live-resize optimization is turned on.
    /// When live-resize optimization is active, the window redraws only those views that moved (or do not support this optimization) during a live resize operation. 
    /// You might consider disabling this optimization for the window if none of the window’s contained views can take advantage of it. 
    /// Disabling the optimization for the window prevents it from checking each view to see if the optimization is supported.
    /// See ``preservesContentDuringLiveResize`` in ``NSView`` for additional information on how to support this optimization.
    public var preservesContentDuringLiveResize: Bool = true

    /// A Boolean value that indicates whether the window is being resized by the user.
    /// The value of this property is true if the window is being live resized; otherwise, false.
    public var inLiveResize: Bool = false

    // MARK: - Sizing Content

    /// The window’s content aspect ratio.
    /// 
    /// By default, the content aspect ratio (that is, height in relation to width) is (0, 0). 
    /// If you set the aspect ratio of a window’s content view, the dimensions of its content rectangle are constrained to integral multiples of that ratio when users resize it. 
    /// You can set a window’s content view to any size programmatically, regardless of its aspect ratio. The value of this property takes precedence over aspectRatio.
    public var contentAspectRatio: OpenCoreGraphics.CGSize = .init()

    /// The minimum size of the window’s content view in the window’s base coordinate system.
    /// 
    /// The minimum size constraint is enforced for resizing by the user as well as for the ``setContentSize(_:)`` method and the setFrame... methods other than ``setFrame(_:display:)`` and ``setFrame(_:display:animate:)``.
    /// This method takes precedence over the minSize property.
    public var contentMinSize: OpenCoreGraphics.CGSize = .init()

    /// Sets the size of the window’s content view to a given size, which is expressed in the window’s base coordinate system.
    /// This size in turn alters the size of the NSWindow object itself. Note that the window server limits window sizes to 10,000; if necessary, be sure to limit aSize relative to the frame rectangle.
    /// - Parameter size: The new size of the window’s content view in the window’s base coordinate system.
    public func setContentSize(_ size: OpenCoreGraphics.CGSize) {
        self.contentView?.frame.size = size
    }

    /// The maximum size of the window’s content view in the window’s base coordinate system.
    /// 
    /// The maximum size constraint is enforced for resizing by the user as well as for the ``setContentSize(_:)`` method and the setFrame... methods other than ``setFrame(_:display:)`` and ``setFrame(_:display:animate:)``. 
    /// This method takes precedence over the maxSize property.
    public var contentMaxSize: OpenCoreGraphics.CGSize = .init()

    /// The window’s content-view resizing increments.
    /// 
    /// The value of this property restricts the user’s ability to resize the window so the width and height of its content view change by multiples of width and height increments. 
    /// As the user resizes the window, the size of its content view changes by integral multiples of ``contentResizeIncrements.width`` and ``contentResizeIncrements.height``. 
    /// However, you can set a window’s size to any width and height programmatically. 
    /// This property takes precedence over ``resizeIncrements``.
    public var contentResizeIncrements: OpenCoreGraphics.CGSize = .init()

    /// A value used by Auto Layout constraints to automatically bind to the value of ``contentLayoutRect``.
    public var contentLayoutGuide: Any?

    /// The area inside the window that is for non-obscured content, in window coordinates.
    /// 
    /// Typically, the area represented by this property is the same as the frame of the contentView. 
    /// However, for windows with NSFullSizeContentViewWindowMask set, there needs to be a way to determine the portion that is not under the toolbar. 
    /// The ``contentLayoutRect`` property contains the portion of the layout that is not obscured under the toolbar. 
    /// This property is KVO compliant.
    public var contentLayoutRect: OpenCoreGraphics.CGRect = .init()

    /// A maximum size that is used to determine if a window can fit when it is in full screen in a tile.
    /// 
    /// By default, the system uses Auto Layout to determine the maximum size, so applications that don’t change window content upon entering full screen should not need to set the value of maxFullScreenContentSize. 
    /// (If Auto Layout is not used, the system queries ``contentMinSize`` and ``contentMaxSize``.) 
    /// If an application does significant rework of the user interface in full screen, then it may be necessary to set the value of ``maxFullScreenContentSize``. 
    /// You can use this property even if the window does not support full screen, but can be implicitly opted into supporting a full screen tile based on resizing behavior and window properties (for more information, see the ``collectionBehavior`` property).
    public var maxFullScreenContentSize: OpenCoreGraphics.CGSize = .init()

    /// A minimum size that is used to determine if a window can fit when it is in full screen in a tile.
    /// 
    /// By default, the system uses Auto Layout to determine the minimum size, so applications that don’t change window content upon entering full screen should not need to set the value of minFullScreenContentSize. 
    /// (If Auto Layout is not used, the system queries ``contentMinSize`` and ``contentMaxSize``.) 
    /// If an application does significant rework of the user interface in full screen, then it may be necessary to set the value of ``minFullScreenContentSize``. 
    /// You can use this property even if the window does not support full screen, but can be implicitly opted into supporting a full screen tile based on resizing behavior and window properties (for more information, see the collectionBehavior property).
    public var minFullScreenContentSize: OpenCoreGraphics.CGSize = .init()

    // MARK: - Managing Window Layers

    /// Removes the window from the screen list, which hides the window.
    /// 
    /// If the window is the key or main window, the window object immediately behind it is made key or main in its place. 
    /// Calling ``orderOut(_:)`` causes the window to be removed from the screen, but does not cause it to be released. 
    /// See the ``close()`` method for information on when a window is released. Calling ``orderOut(_:)`` on a child window causes the window to be removed from its parent window before being removed.
    /// The default animation based on the window type will be used when the window is ordered out unless it has been modified by the ``animationBehavior`` property.
    /// - Parameter sender: The window to remove.
    public func orderOut(_ sender: Any?) {
        print("\(Self.self).\(#function)")
    }

    /// Moves the window to the back of its level in the screen list, without changing either the key window or the main window.
    /// - Parameter sender: Message originator.
    public func orderBack(_ sender: Any?) {
        print("\(Self.self).\(#function)")
    }

    /// Moves the window to the front of its level in the screen list, without changing either the key window or the main window.
    /// 
    /// The default animation based on the window type will be used when the window is ordered front unless it has been modified by the animationBehavior property.
    /// - Parameter sender: The message’s sender.
    public func orderFront(_ sender: Any?) {
        print("\(Self.self).\(#function)")
        if !NSApplication.shared.windows.contains(where: { $0 === self }) {
            NSApplication.shared.windows.append(self)
        }
    }

    /// Moves the window to the front of its level, even if its application isn’t active, without changing either the key window or the main window.
    /// 
    /// Normally an NSWindow object can’t be moved in front of the key window unless it and the key window are in the same application. 
    /// You should rarely need to invoke this method; it’s designed to be used when applications are cooperating in such a way that an active application (with the key window) is using another application to display data.
    public func orderFrontRegardless() {
        print("\(Self.self).\(#function)")
    }

    /// Repositions the window’s window device in the window server’s screen list.
    public func order(_ place: NSWindow.OrderingMode, relativeTo otherWin: Int) {
        print("\(Self.self).\(#function)")
    }

    /// The window level of the window.
    /// 
    /// See Window Levels for a list of possible values.
    /// Each level in the list groups windows within it in front of those in all preceding groups. 
    /// Floating windows, for example, appear in front of all normal-level windows.
    public var level: NSWindow.Level = .normal

    // MARK: - Managing Window Visibility and Occlusion State
    
    /// A Boolean value that indicates whether the window is visible onscreen (even when it’s obscured by other windows).
    /// The value of this property is true when the window is onscreen (even if it’s obscured by other windows); otherwise, false.
    public var isVisible: Bool = false

    /// The occlusion state of the window.
    /// When the value of this property is ``visible``, at least part of the window is visible; otherwise, the window is fully occluded.
    public var occlusionState: NSWindow.OcclusionState = .init(rawValue: 0)

    // MARK: - Managing Key Status

    /// A Boolean value that indicates whether the window is the key window for the application.
    /// The value of this property is true if the window is the key window for the application; otherwise, false.
    public var isKeyWindow: Bool {
        NSApplication
            .shared
            .keyWindow === self
    }

    ///A Boolean value that indicates whether the window can become the key window.
    /// 
    /// The value of this property is true if the window can become the key window, otherwise, false.
    /// Attempts to make the window the key window are abandoned if the value of this property is false. 
    /// The value of this property is true if the window has a title bar or a resize bar, or false otherwise.
    public var canBecomeKey: Bool = true

    /// Makes the window the key window.
    public func makeKey() {
        print("\(Self.self).\(#function)")

        if canBecomeKey {
            if let oldWindow = NSApplication.shared.keyWindow {
                oldWindow.resignKey()
            }

            NSApplication.shared.keyWindow = self
        }
    }

    /// Moves the window to the front of the screen list, within its level, and makes it the key window; that is, it shows the window.
    /// - Parameter sender: The message’s sender.
    public func makeKeyAndOrderFront(_ sender: Any?) {
        print("\(Self.self).\(#function)")

        makeKey()
        orderFront(sender)
    }

    /// Informs the window that it has become the key window.
    /// 
    /// This method reestablishes the window’s first responder, sends the becomeKeyWindow message to that object if it responds, and posts ``didBecomeKeyNotification`` to the default notification center. 
    /// Never invoke this method directly.
    open func becomeKey() {
        print("\(Self.self).\(#function)")

        NotificationCenter.default.post(name: .init("NSWindowDidBecomeKeyNotification"), object: self)
        delegate?.windowDidBecomeKey(self)
    }

    /// Resigns the window’s key window status.
    /// 
    /// This method sends ``resignKey()`` to the window’s first responder, sends ``windowDidResignKey(_:)`` to the window’s delegate, and posts ``didResignKeyNotification`` to the default notification center.
    /// Never invoke this method directly.
    open func resignKey() {
        print("\(Self.self).\(#function)")

        NotificationCenter.default.post(name: .init("NSWindowDidResignKeyNotification"), object: self)
        delegate?.windowDidResignKey(self)
    }

    // MARK: - Managing Main Status

    /// A Boolean value that indicates whether the window is the application’s main window.
    /// The value of this property is true when the window is the main window for the application; otherwise, false.
    public var isMainWindow: Bool {
        NSApplication
            .shared
            .mainWindow === self
    }

    /// A Boolean value that indicates whether the window can become the application’s main window.
    /// 
    /// The value of this property is true when the window can become the main window; otherwise, false.
    /// Attempts to make the window the main window are abandoned if the value of this property is false. 
    /// The value of the property is true if the window is visible, is not an NSPanel object, and has a title bar or a resize mechanism. 
    /// Otherwise, the value is false.
    public var canBecomeMain: Bool = true

    /// Makes the window the main window.
    public func makeMain() {
        print("\(Self.self).\(#function)")

        if canBecomeMain {
            if let oldWindow = NSApplication.shared.mainWindow {
                oldWindow.resignMain()
            }

            NSApplication.shared.mainWindow = self
        }
    }

    /// Informs the window that it has become the main window.
    /// This method posts an ``didBecomeMainNotification`` to the default notification center.
    /// Never invoke this method directly.
    open func becomeMain() {
        print("\(Self.self).\(#function)")

        NotificationCenter.default.post(name: .init("NSWindowDidBecomeMainNotification"), object: self)
        delegate?.windowDidBecomeMain(self)
    }

    /// Resigns the window’s main window status.
    /// This method sends ``windowDidResignMain(_:)`` to the window’s delegate and posts ``didResignMainNotification`` to the default notification center.
    open func resignMain() {
        print("\(Self.self).\(#function)")

        NotificationCenter.default.post(name: .init("NSWindowDidResignMainNotification"), object: self)
        delegate?.windowDidResignMain(self)
    }

    // MARK: - Managing Attached Windows

    /// An array of the window’s attached child windows.
    public var childWindows: [NSWindow]?

    /// Adds a given window as a child window of the window.
    /// 
    /// After the childWin is added as a child of the window, it is maintained in relative position indicated by place for subsequent ordering operations involving either window. 
    /// While this attachment is active, moving childWin will not cause the window to move (as in sliding a drawer in or out), but moving the window will cause childWin to move.
    /// Note that you should not create cycles between parent and child windows. 
    /// For example, you should not add window B as child of window A, then add window A as a child of window B.
    /// - Parameters:
    ///   - childWin: The child window to order.
    ///   - place: ``NSWindow.OrderingMode.above``: childWin is ordered immediately in front of the window. ``NSWindow.OrderingMode.below``: childWin is ordered immediately behind the window.
    public func addChildWindow(_ childWin: NSWindow, ordered place: NSWindow.OrderingMode) {
        print("\(Self.self).\(#function)")
        childWindows?.append(childWin)
    }

    /// Detaches a given child window from the window.
    /// - Parameter childWin: The child window to detach.
    public func removeChildWindow(_ childWin: NSWindow) {
        print("\(Self.self).\(#function)")
        childWindows?
            .removeAll { window in
                window === childWin
            }
    }

    /// The parent window to which the window is attached as a child.
    /// 
    /// This property should be set from a subclass when it is overridden by a subclass’s implementation. It should not be set otherwise.
    /// Note that calling orderOut(_:) on a child window causes the window to be removed from its parent window before it is itself removed.
    public weak var parent: NSWindow?

    // MARK: - Handling Events

    /// The event currently being processed by the application.
    /// The value of this property is given by calling by invoking the ``NSApplication`` method ``currentEvent``.
    public var currentEvent: NSEvent?

    /// Returns the next event matching a given mask.
    /// 
    /// This method calls the ``nextEvent(matching:until:inMode:dequeue:)`` method, where the matching mask parameter is the specified mask, the until parameter is ``distantFuture``, the ``inMode`` parameter is ``eventTracking``, and the dequeue parameter is true.
    /// - Parameter mask: The mask that the event to return must match. Events with non-matching masks are left in the queue. See ``discardEvents(matching:before:)`` in ``NSApplication`` for the list of mask values.
    /// - Returns: The next event whose mask matches mask; nil when no matching event was found.
    public func nextEvent(matching mask: NSEvent.EventTypeMask) -> NSEvent? {
        print("\(Self.self).\(#function)")
        return nil
    }

    /// Forwards the message to the global application object.
    /// - Parameters:
    ///   - mask: The mask that the event to return must match.
    ///   - expiration: The date until which to wait for events.
    ///   - mode: The run loop mode to use while waiting for events
    ///   - deqFlag: true to remove the returned event from the event queue; false to leave the returned event in the queue.
    /// - Returns: The next event whose mask matches the specified mask; otherwise, nil.
    public func nextEvent(matching mask: NSEvent.EventTypeMask, until expiration: Date?, inMode mode: RunLoop.Mode, dequeue deqFlag: Bool) -> NSEvent? {
        print("\(Self.self).\(#function)")
        return nil
    }

    /// Forwards the message to the global application object.
    /// - Parameters:
    ///   - mask: The mask of the events to discard.
    ///   - lastEvent: The event up to which queued events are discarded from the queue.
    public func discardEvents(matching mask: NSEvent.EventTypeMask, before lastEvent: NSEvent?) {
        print("\(Self.self).\(#function)")
    }

    /// Forwards the message to the global application object.
    /// - Parameters:
    ///   - event: The event to add to the window’s event queue.
    ///   - flag: true to place the event in the front of the queue; false to place it in the back.
    public func postEvent(_ event: NSEvent, atStart flag: Bool) {
        print("\(Self.self).\(#function)")
    }

    /// This action method dispatches mouse and keyboard events the global application object sends to the window.
    /// 
    /// Never invoke this method directly. A right mouse-down event in a window of an inactive application isn’t delivered to the corresponding ``NSWindow`` object. 
    /// Instead, a ``sendEvent(_:)`` message with a window number of 0 delivers it to the ``NSApplication`` object.
    /// - Parameter event: The mouse or keyboard event to process.
    public func sendEvent(_ event: NSEvent) {
        print("\(Self.self).\(#function)")
    }

    /// Dispatches action messages with a given argument.
    /// 
    /// The window tries to perform the method action using its inherited ``NSResponder`` method ``tryToPerform(_:with:)``. 
    /// If the window doesn’t perform action, the delegate is given the opportunity to perform it using its inherited NSObject method ``perform(_:with:)``.
    /// - Parameters:
    ///   - action: The selector to attempt to execute.
    ///   - object: The message’s argument.
    /// - Returns: true when the window or its delegate perform action with object; otherwise, false.
    public func tryToPerform(_ action: Selector, with object: Any?) -> Bool {
        print("\(Self.self).\(#function)")
        return false
    }

    // MARK: - Managing Responders

    /// The view that’s made first responder (also called the key view) the first time the window is placed onscreen.
    public weak var initialFirstResponder: NSView?

    /// The window’s first responder.
    /// 
    /// The first responder is usually the first object in a responder chain to receive an event or action message. 
    /// In most cases, the first responder is a view object that the user selects or activates with the mouse or keyboard.
    /// You can use the ``firstResponder`` property in custom subclasses of responder classes (``NSWindow``, ``NSApplication``, ``NSView``, and subclasses) to determine if an instance of the subclass is currently the first responder. 
    /// You can also use it to help locate a text field that currently has first-responder status. For more on this subject, see Event Handling Basics. 
    /// This property is key-value observing compliant.
    public weak var firstResponder: NSResponder?

    /// Attempts to make a given responder the first responder for the window.
    /// 
    /// If responder isn’t already the first responder, this method first sends a ``resignFirstResponder()`` message to the object that is the first responder. 
    /// If that object refuses to resign, it remains the first responder, and this method immediately returns false. 
    /// If the current first responder resigns, this method sends a becomeFirstResponder() message to responder. 
    /// If responder does not accept first responder status, the ``NSWindow`` object becomes first responder; in this case, the method returns true even if responder refuses first responder status.
    /// 
    /// If responder is nil, this method still sends ``resignFirstResponder()`` to the current first responder. 
    /// If the current first responder refuses to resign, it remains the first responder and this method immediately returns false. 
    /// If the current first responder returns true from ``resignFirstResponder()``, the window is made its own first responder and this method returns true.
    /// 
    /// The Application Kit framework uses this method to alter the first responder in response to mouse-down events; you can also use it to explicitly set the first responder from within your program. 
    /// The responder object is typically an ``NSView`` object in the window’s view hierarchy. 
    /// If this method is called explicitly, first send acceptsFirstResponder to responder, and do not call ``makeFirstResponder(_:)`` if acceptsFirstResponder returns false.
    /// 
    /// Use initialFirstResponder to the set the first responder to be used when the window is brought onscreen for the first time.
    /// - Parameter responder: The responder to set as the window’s first responder. nil makes the window its first responder.
    /// - Returns: true when the operation is successful; otherwise, false.
    public func makeFirstResponder(_ responder: NSResponder?) -> Bool {
        print("\(Self.self).\(#function)")
        return true
    }

    // MARK: - Drawing Windows

    /// Passes a display message down the window’s view hierarchy, thus redrawing all views within the window.
    /// 
    /// You rarely need to invoke this method. 
    /// ``NSWindow`` objects normally record which of their views need displaying and display them automatically on each pass through the event loop.
    /// 
    /// This method includes the frame view that draws the border, title bar, and other peripheral elements.
    public func display() {
        print("\(Self.self).\(#function)")
    }

    /// Passes a display message down the window’s view hierarchy, thus redrawing all views that need displaying.
    /// 
    /// This method includes the frame view that draws the border, title bar, and other peripheral elements. 
    /// It’s useful when you want to modify some number of views and then display only the ones that you modified.
    /// 
    /// You rarely need to invoke this method. 
    /// NSWindow objects normally record which of their views need displaying and display them automatically on each pass through the event loop.
    public func displayIfNeeded() {
        if viewsNeedDisplay {
            print("\(Self.self).\(#function)")

            display()
            viewsNeedDisplay = false
        }
    }

    /// A Boolean value that indicates whether any of the window’s views need to be displayed.
    /// The value of this property is true when any of the window’s views need to be displayed; otherwise, false. 
    /// You should rarely need to set this property; the ``NSView`` method needsDisplay and similar methods set it automatically.
    public var viewsNeedDisplay: Bool = true

    /// A Boolean value that indicates whether the window allows multithreaded view drawing.
    /// The value of this property is true if the window allows multithreaded view drawing; otherwise, false. 
    /// The default value is true.
    public var allowsConcurrentViewDrawing: Bool = true

    // MARK: - Updating Windows

    /// Updates the window.
    /// 
    /// The NSWindow implementation of this method does nothing more than post an ``didUpdateNotification`` notification to the default notification center. 
    /// A subclass can override this method to perform specialized operations, but it should send an update message to super just before returning. 
    /// For example, the ``NSMenu`` class implements this method to disable and enable menu commands.
    /// 
    /// An ``NSWindow`` object is automatically sent an update message on every pass through the event loop and before it’s displayed onscreen. 
    /// You can manually cause an update message to be sent to all visible NSWindow objects through the ``NSApplication`` ``updateWindows()`` method.
    public func update() {
        graphicsContext?.render()
    }

    // MARK: - Managing Titles
    
    /// The string that appears in the title bar of the window or the path to the represented file.
    /// If the title has been set using setTitleWithRepresentedFilename(_:), this property contains the file’s path. 
    /// Setting this property also sets the title of the window’s miniaturized window.
    public var title: String = ""
    
    /// A secondary line of text that appears in the title bar of the window.
    /// When this property is an empty string, the system removes the subtitle from the window layout.
    public var subtitle: String = ""
    
    /// A value that indicates the visibility of the window’s title and title bar buttons.
    /// By default, the value of this property is NSWindow.TitleVisibility.visible.
    public var titleVisibility: TitleVisibility = .visible

    // MARK: - Accessing Screen Information

    /// The screen the window is on.
    /// The value of this property is the screen where most of the window is on; it is nil when the window is offscreen.
    public private(set) var screen: NSScreen?

    /// The deepest screen the window is on (it may be split over several screens).
    /// The value of this property is nil when the window is offscreen.
    public private(set) var deepestScreen: NSScreen? 

    /// A Boolean value that indicates whether the window context should be updated when the screen profile changes or when the window moves to a different screen.
    /// 
    /// The value of this property is true when the window context should be updated when the ColorSync profile of the current screen changes or when a majority of the window is moved to a different screen whose profile is different than the previous screen; otherwise, false. 
    /// The default value is false.
    /// 
    /// After the window context is updated, the window is told to display itself. 
    /// If you need to update offscreen caches for the window, you should register to receive the ``didChangeScreenProfileNotification`` notification.
    public var displaysWhenScreenProfileChanges: Bool = false

    // MARK: - Moving Windows

    /// A Boolean value that indicates whether the window is movable by clicking and dragging anywhere in its background.
    /// 
    /// The value of this property is true when the window is movable by clicking and dragging anywhere in its background; otherwise, false.
    /// A window with a style mask of ``NSTexturedBackgroundWindowMask`` is movable by background by default. Sheets and drawers cannot be movable by window background.
    public var isMovableByWindowBackground: Bool = true
    
    /// A Boolean value that indicates whether the window can be dragged by clicking in its title bar or background.
    /// The value of this property is true if the window can be moved by the user; otherwise, false.
    /// 
    /// When a window’s isMovable property is false, the value of the ``isMovableByWindowBackground`` property is ignored. When the value of ``isMovable`` is false, the window can only be dragged between spaces in F8 mode, and its relative screen position is always preserved. 
    /// Note that a resizable window may still be resized, and the window frame may be changed programmatically. 
    /// A nonmovable window will not be moved or resized by the system in response to a display reconfiguration. 
    /// Applications may choose to enable application-controlled window dragging after disabling user-initiating dragging by handling the ``mouseDown(with:)``/``mouseDragged(with:)``/``mouseUp(with:)`` sequence in ``sendEvent(_:)`` in an ``NSWindow`` subclass.
    public var isMovable: Bool = true
    
    /// Sets the window’s location to the center of the screen.
    /// 
    /// The window is placed exactly in the center horizontally and somewhat above center vertically. 
    /// Such a placement carries a certain visual immediacy and importance. 
    /// This method doesn’t put the window onscreen, however; use ``makeKeyAndOrderFront(_:)`` to do that.
    /// 
    /// You typically use this method to place a window—most likely an alert dialog—where the user can’t miss it. 
    /// This method is invoked automatically when a panel is placed on the screen by the ``runModal(for:)`` method of the ``NSApplication`` class.
    public func center() {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Closing Windows
    
    /// Simulates the user clicking the close button by momentarily highlighting the button and then closing the window.
    /// 
    /// If the window’s delegate or the window itself implements ``windowShouldClose(_:)``, the window sends that message with the window as the argument. 
    /// The window sends only one such message; if both the delegate and the window implement the method, the delegate receives the message. 
    /// If the ``windowShouldClose(_:)`` method returns false, the window doesn’t close. 
    /// If neither the window nor the delegate implement ``windowShouldClose(_:)``, or it returns true, this method invokes ``close()`` to close the window.
    /// 
    /// If the window doesn’t have a close button or can’t close (for example, if the delegate replies false to a ``windowShouldClose(_:)`` message), the system emits the alert sound.
    /// - Parameter sender: The message’s sender.
    public func performClose(_ sender: Any?) {
        print("\(Self.self).\(#function)")
        self.close()
    }

    /// Removes the window from the screen.
    /// 
    /// If the window is set to be released when closed, a release message is sent to the object after the current event is completed. 
    /// For an NSWindow object, the default is to be released on closing, while for an NSPanel object, the default is not to be released. 
    /// You can use the ``isReleasedWhenClosed`` property to change the default behavior.
    /// 
    /// A window doesn’t have to be visible to receive the close message. 
    /// For example, when the application terminates, it sends the close message to all windows in its window list, even those that are not currently visible.
    /// 
    /// The close method posts a ``willCloseNotification`` notification to the default notification center.
    /// The close method differs in two important ways from the ``performClose(_:)`` method:
    /// - It does not attempt to send a ``windowShouldClose(_:)`` message to the window or its delegate.
    /// - It does not simulate the user clicking the close button by momentarily highlighting the button.
    /// Use ``performClose(_:)`` if you need these features.
    public func close() {
        print("\(Self.self).\(#function)")
//        glfwDestroyWindow(_context)

        NSApplication.shared.terminate(self)
    }

    /// A Boolean value that indicates whether the window is released when it receives the close message.
    /// 
    /// The value of this property is true if the window is automatically released after being closed; false if it’s simply removed from the screen.
    /// 
    /// The default for ``NSWindow`` is true; the default for ``NSPanel`` is false. 
    /// Release when closed, however, is ignored for windows owned by window controllers. 
    /// Another strategy for releasing an ``NSWindow`` object is to have its delegate autorelease it on receiving a ``windowShouldClose(_:)`` message.
    public var isReleasedWhenClosed: Bool = true

    // MARK: - Minimizing Windows

    /// A Boolean value that indicates whether the window is minimized.
    /// 
    /// The value of this property is true if the window is minimized; otherwise, false. 
    /// A minimized window is removed from the screen and replaced by a image, icon, or button that represents it, called the counterpart.
    public internal(set) var isMiniaturized: Bool = false

    /// Simulates the user clicking the minimize button by momentarily highlighting the button, then minimizing the window.
    /// 
    /// If the window doesn’t have a minimize button or can’t be minimized for some reason, the system emits the alert sound.
    /// - Parameter sender: The message’s sender.
    public func performMiniaturize(_ sender: Any?) {
        print("\(Self.self).\(#function)")
        self.miniaturize(sender)
    }

    ///  Removes the window from the screen list and displays the minimized window in the Dock.
    /// - Parameter sender: The message’s sender.
    public func miniaturize(_ sender: Any?) {
        print("\(Self.self).\(#function)")
        graphicsContext?.minimizeWindow()
    }

    /// De-minimizes the window.
    /// 
    /// Invoke this method to programmatically deminimize a minimized window in the Dock.
    /// - Parameter sender: The message’s sender.
    public func deminiaturize(_ sender: Any?) {
        print("\(Self.self).\(#function)")
        graphicsContext?.maximizeWindow()
    }

    /// The custom miniaturized window image of the window.
    /// 
    /// The miniaturized window image is the image displayed in the Dock when the window is minimized. 
    /// If you did not assign a custom image to the window, the value of this property is nil.
    /// 
    /// When the user minimizes the window, the Dock displays miniwindowImage in the corresponding Dock tile, scaling it as needed to fit in the tile. 
    /// If you do not specify a custom image using this property, the Dock creates one for you automatically.
    /// 
    /// You can also set this property as needed to change the minimized window image. 
    /// Typically, you would specify a custom image immediately prior to a window being minimized—when the system posts ``willMiniaturizeNotification``. 
    /// You can set this property while the window is minimized to update the current image in the Dock. 
    /// However, you should not use this property to create complex animations in the Dock.
    public var miniwindowImage: NSImage?

    /// The title displayed in the window’s minimized window.
    /// 
    /// A minimized window’s title usually reflects that of its full-size counterpart, abbreviated to fit if necessary. 
    /// Although this property allows you to set the minimized window’s title explicitly, changing the full-size ``NSWindow`` object’s title (through title or ``setTitleWithRepresentedFilename(_:)``) automatically changes the minimized window’s title as well.
    public var miniwindowTitle: String!

    // MARK: - Triggering Constraint-Based Layout
    
    /// Updates the constraints based on changes to views in the window since the last layout.
    /// 
    /// When a new layout pass is triggered for a window, the system invokes this method to ensure that any constraints for views in the window are updated with information from the current view hierarchy and its constraints. 
    /// This method is called automatically by the system, but may be invoked manually if you need to examine the most up to date constraints.
    /// 
    /// Subclasses should not override this method.
    public func updateConstraintsIfNeeded() {
        print("\(Self.self).\(#function)")
    }

    /// Updates the layout of views in the window based on the current views and constraints.
    /// 
    /// Before displaying a window that uses constraints-based layout the system invokes this method to ensure that the layout of all views is up to date. 
    /// This method updates the layout if needed, first invoking ``updateConstraintsIfNeeded()`` to ensure that all constraints are up to date. 
    /// This method is called automatically by the system, but may be invoked manually if you need to examine the most up to date layout.
    /// 
    /// Subclasses should not override this method.
    public func layoutIfNeeded() {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Getting Information About Scripting Attributes

    /// A Boolean value that indicates if the window has a close box.
    public var hasCloseBox: Bool = false

    /// A Boolean value that indicates if the window has a title bar.
    public var hasTitleBar: Bool = false

    /// A Boolean value that indicates whether the window is a modal panel.
    /// This property is key-value coding compliant.
    public var isModalPanel: Bool = false

    /// A Boolean value that indicates whether the window is a floating panel.
    /// This property is key-value coding compliant.
    public var isFloatingPanel: Bool = false

    /// A Boolean value that indicates whether the window allows zooming.
    /// This property is key-value coding compliant.
    public var isZoomable: Bool = false

    /// A Boolean value that indicates if the user can resize the window.
    /// This property is key-value coding compliant.
    public var isResizable: Bool {
//        get { glfwGetWindowAttrib(_context, GLFW_RESIZABLE) == GLFW_TRUE ? true : false }
//        set { glfwSetWindowAttrib(_context, GLFW_RESIZABLE, newValue == true ? GLFW_TRUE : GLFW_FALSE) }
        true
    }

    /// A Boolean value that indicates whether the window can minimize.
    /// This property is key-value coding compliant.
    public var isMiniaturizable: Bool = false

    /// The zero-based position of the window, based on its order from front to back among all visible application windows.
    /// If you set this property to an index that’s out of range, the system sets the position to the nearest value that’s in range.
    public var orderedIndex: Int = 1

}

extension NSWindow {
    /// Constants that specify the style of a window, and that you can combine with the C bitwise OR operator.
    public struct StyleMask: OptionSet, Sendable {

        // MARK: - Constants

        /// The window displays a title bar.
        public static let titled = StyleMask(rawValue: 1)

        /// The window displays a close button.
        public static let closable = StyleMask(rawValue: 2)
        
        /// The window displays a minimize button.
        public static let miniaturizable = StyleMask(rawValue: 4)
        
        /// The window can be resized by the user.
        public static let resizable = StyleMask(rawValue: 8)

        // MARK: - Accessing the Raw Value
        
        /// The corresponding value of the raw type.
        public var rawValue: Int

        // MARK: - Style Mask Creation

        /// Creates a style mask using the given raw value.
        /// - Parameter rawValue: The raw unsigned integer value of the style mask.
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}

extension NSWindow {
    /// Constants that specify how the window device buffers the drawing done in a window.
    public enum BackingStoreType: Equatable, Hashable, Sendable {
    
        // MARK: - Constants

        /// The window uses a buffer, but draws directly to the screen where possible and to the buffer for obscured portions.
        case retained
        
        /// The window draws directly to the screen without using any buffer.
        case nonretained
        
        /// The window renders all drawing into a display buffer and then flushes it to the screen.
        case buffered
    }
}

extension NSWindow {
    /// Window collection behaviors related to Stage Manager.
    public struct CollectionBehavior: OptionSet, Sendable {

        // MARK: - Stage Manager and full screen

        /// The behavior marking this window as primary for both Stage Manager and full screen.
        public static let primary = CollectionBehavior(rawValue: 1)

        /// The behavior marking this window as auxiliary for both Stage Manager and full screen.
        public static let auxiliary = CollectionBehavior(rawValue: 1)

        // MARK: - Accessing the Raw Value
        
        /// The corresponding value of the raw type.
        public let rawValue: Int

        // MARK: - Window Collection Behaviors Creation

        /// Creates a window collection behavior using the given raw value.
        /// - Parameter rawValue: A raw unsigned integer for window collection behavior.
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}

extension NSWindow {
    /// A type that represents the depth, or amount of memory, for a single pixel in a window or screen.
    public enum Depth {
        // MARK: - Constants

        /// 128 bits RGB depth limit.
        case onehundredtwentyeightBitRGB
        
        /// 64 bits RGB depth limit.
        case sixtyfourBitRGB
        
        /// 24 bits RGB depth limit.
        case twentyfourBitRGB
    }
}

extension NSWindow {
    /// Options to use when retrieving window numbers from the system.
    /// If you pass 0 instead, then the list the method returns contains window numbers for visible windows on the active space belonging to the calling application.
    public struct NumberListOptions: OptionSet, Sendable {

        // MARK: - Constants.

        public static let allApplications = NumberListOptions(rawValue: 1)
        public static let allSpaces =  NumberListOptions(rawValue: 2)
        
        // MARK: - Accessing the Raw Value
        
        /// The corresponding value of the raw type.
        public let rawValue: Int

        // MARK: - Creating Number List Options

        /// Creates a window number list options using the given raw value.
        /// - Parameter rawValue: The raw unsigned integer value for the window number list options.
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}

extension NSWindow {
    /// These constants are the keys for device description dictionaries.
    public enum NSDeviceDescriptionKey: String, Hashable, Sendable {
        
        /// The corresponding value is an NSNumber object containing an integer that gives the bit depth of the window’s raster image (2-bit, 8-bit, and so forth).
        case bitsPerSample
        
        /// The corresponding value is an NSString object giving the name of the window’s color space.
        case colorSpaceName
        
        /// If there is a corresponding value, this indicates that the display device is a printer.
        case isPrinter
        
        /// If there is a corresponding value, this indicates that the display device is a screen.
        case isScreen
        
        /// The corresponding value is an NSValue object containing a value of type OpenCoreGraphics.CGSize that describes the window’s raster resolution in dots per inch (dpi).
        case resolution
        
        /// The corresponding value is an NSValue object containing a value of type OpenCoreGraphics.CGSize that gives the size of the window’s frame rectangle.
        case size
    }
}

extension NSWindow {
    /// Constants that let you specify how a window is ordered relative to another window.
    public enum OrderingMode: Sendable {
        
        // MARK: - Constants
        
        /// Moves the window above the indicated window.
        case above
        
        /// Moves the window below the indicated window.
        case below
        
        /// Moves the window off the screen.
        case out
    }
}

extension NSWindow {
    /// The standard window levels
    /// 
    /// The stacking of levels takes precedence over the stacking of windows within each level. 
    /// That is, even the bottom window in a level will obscure the top window of the next level down. 
    /// Levels are listed in order from lowest to highest.
    public struct Level: Hashable, RawRepresentable, Sendable {

        // MARK: - Constants

        /// Useful for floating palettes.
        public static let floating = Level(rawValue: 1)

        /// Reserved for the application’s main menu.
        public static let mainMenu = Level(rawValue: 2)

        /// The level for a modal panel.
        public static let modalPanel = Level(rawValue: 4)

        /// The default level for NSWindow objects.
        public static let normal = Level(rawValue: 8)

        /// The level for a pop-up menu.
        public static let popUpMenu = Level(rawValue: 16)

        /// The level for a screen saver.
        public static let screenSaver = Level(rawValue: 32)

        /// The level for a status window.
        public static let statusBar = Level(rawValue: 64)

        // MARK: - Accessing the Raw Value
        
        /// The corresponding value of the raw type.
        public let rawValue: Int

        // MARK: - Creating a Window Level

        /// Creates a window level using the given raw value.
        /// - Parameter rawValue: The raw integer value of the window level.
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}

extension NSWindow {
    /// Specifies whether the window is occluded.
    public struct OcclusionState: OptionSet, Sendable {

        // MARK: - Constants

        /// If set, at least part of the window is visible; if not set, the entire window is occluded. 
        /// A window that has a nonrectangular shape can be entirely occluded onscreen, but if its bounding box falls into a visible region, the window is considered to be visible. 
        /// Note that a completely transparent window may also be considered visible.
        public static let visible = OcclusionState(rawValue: 1)

        // MARK: - Accessing the Raw Value
        
        /// The corresponding value of the raw type.
        public let rawValue: Int

        // MARK: - Occlusion State Creation

        /// Creates an occlusion state using the given raw value.
        /// - Parameter rawValue: The raw unsigned integer value of the occlusion state.
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}

extension NSWindow {
    /// Specifies the appearance of the window’s title bar area.
    public enum TitleVisibility: Sendable {
        case visible
        case hidden
    }
}