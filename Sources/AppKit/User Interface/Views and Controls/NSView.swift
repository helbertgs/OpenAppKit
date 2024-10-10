import Foundation

/// The infrastructure for drawing, printing, and handling events in an app.
@MainActor open class NSView: NSResponder {

    // MARK: - Creating a view object

    /// Initializes and returns a newly allocated NSView object with a specified frame rectangle.
    /// 
    /// Insert the view into your window’s view hieararchy before you can do anything with it. 
    /// This method is the designated initializer for the NSView class.
    /// - Parameter frame: The frame rectangle for the created view object.
    public init(frame: NSRect) {
        fatalError("not implemented yet")
    }

    /// Initializes a view using from data in the specified coder object.
    /// - Parameter coder: The coder object that contains the view’s configuration details.
    public init?(coder: NSCoder) {
        fatalError("not implemented yet")
    }

    /// Restores the view to an initial state so that it can be reused.
    /// 
    /// The default implementation of this method sets the view’s alpha to 1.0 and its hidden state to false. 
    /// Subclasses can override this method and use it to return the view to its initial state. 
    /// Subclasses should call super at some point in their implementation.
    /// 
    /// This method offers a way to reset a view to some initial state so that it can be reused. 
    /// For example, the NSTableView class uses it to prepare views for reuse and thereby avoid the expense of creating new views as they scroll into view. 
    /// If you implement a view-reuse system in your own code, you can call this method from your own code prior to reusing them.
    public func prepareForReuse() {
        fatalError("not implemented yet")
    }

    // MARK: - View Hierarchy
    // MARK: - Getting the Related Objects

    /// The view that is the parent of the current view.
    /// 
    /// The superview is the immediate ancestor of the current view. 
    /// The value of this property is nil when the view is not installed in a view hierarchy. 
    /// To set the value of this property, use the addSubview(_:) method to embed the current view inside another view.
    /// 
    /// When checking the value of this property iteratively or recursively, be sure to compare the superview object to the content view of the window to avoid proceeding out of the view hierarchy.
    public weak var superview: NSView?

    /// The array of views embedded in the current view.
    /// 
    /// This array contains zero or more NSView objects that represent the views embedded in the current view’s content. 
    /// The current view acts as the superview for each subview. 
    /// The order of the subviews may be considered as being back-to-front, but this does not imply invalidation and drawing behavior.
    /// 
    /// When loading a view from a nib or storyboard file, the order of subviews is determined by the nib or storyboard file itself and usually corresponds to the order in which the views were added. 
    /// Similarly, when adding subviews programmatically, the order is based on the order in which you added them.
    /// 
    /// When performing hit-test operations on a view, you should start at the last view in this array and work backwards.
    /// 
    /// Set this property to reorder the view’s existing subviews, add or remove subviews en masse, replace all of the view’s subviews with a new set of subviews, or remove all the view’s subviews. 
    /// When you assign a valid, new array of subviews, the system performs required sorting and sends ``addSubview(_:)`` and ``removeFromSuperview()`` messages as necessary to leave the property with the requested new array.  
    /// Any member of the new array that isn't already a subview of the view is added.  
    /// Any member of the view's existing subviews array that isn't in the new array is removed.  
    /// Any views that are in both subviews and the new array are moved in the subviews array as needed, without being removed and re-added.
    /// 
    /// This property marks the affected view and window areas as needing display.
    public var subviews: [NSView] = []

    /// The view’s window object, if it is installed in a window.
    /// 
    /// The value of this property is nil if the view is not currently installed in a window.
    public weak var window: NSWindow?

    /// The view’s closest opaque ancestor, which might be the view itself.
    public private(set) weak var opaqueAncestor: NSView?

    /// Returns a Boolean value that indicates whether the view is a subview of the specified view.
    /// 
    /// The method returns true if the view is either an immediate or distant subview of view.
    /// - Parameter view: The view to test for subview relationship within the view hierarchy.
    /// - Returns: true if the view is a subview, or distant subview, of the specified view.
    public func isDescendant(of view: NSView) -> Bool {
        fatalError("not implemented yet")
    }

    /// Returns the closest ancestor shared by the view and another specified view.
    /// - Parameter view: Another view to test for closest shared ancestor with the view.
    /// - Returns: The closest ancestor or nil if there’s no such object. Returns self if aView is identical to the view.
    public func ancestorShared(with view: NSView) -> NSView? {
        fatalError("not implemented yet")
    }

    // MARK: - Adding and Removing Subviews

    /// Adds a view to the view’s subviews so it’s displayed above its siblings.
    /// 
    /// This method also sets the view as the next responder of aView.
    /// The view retains aView. 
    /// If you use ``removeFromSuperview()`` to remove aView from the view hierarchy, aView is released. 
    /// If you want to keep using aView after removing it from the view hierarchy (if, for example, you are swapping through a number of views), you must retain it before invoking ``removeFromSuperview()``.
    /// - Parameter aView: The view to add to the view as a subview.
    public func addSubview(_ aView: NSView) {
        fatalError("not implemented yet")
    }

    /// Inserts a view among the view’s subviews so it’s displayed immediately above or below another view.
    /// 
    /// This method also sets the view as the next responder of aView.
    /// The view retains aView. 
    /// If you use ``removeFromSuperview()`` to remove aView from the view hierarchy, aView is released. 
    /// If you want to keep using aView after removing it from the view hierarchy (if, for example, you are swapping through a number of views), you must retain it before invoking ``removeFromSuperview()``.
    /// - Parameters:
    ///   - aView: The view object to add to the view as a subview.
    ///   - place: An enum constant specifying the position of the aView relative to otherView. Valid values are NSWindowAbove or NSWindowBelow.
    ///   - otherView: The other view aView is to be positioned relative to. If otherView is nil (or isn’t a subview of the view), aView is added above or below all of its new siblings.
    public func addSubview(_ view: NSView, positioned place: NSWindow.OrderingMode, relativeTo otherView: NSView?) {
        fatalError("not implemented yet")
    }

    /// Unlinks the view from its superview and its window, removes it from the responder chain, and invalidates its cursor rectangles.
    /// 
    /// The view is also released; if you plan to reuse it, be sure to retain it before sending this message and to release it as appropriate when adding it as a subview of another NSView.
    /// Calling this method removes any constraints that refer to the view you are removing, or that refer to any view in the subtree of the view you are removing.
    /// Never invoke this method during display.
    public func removeFromSuperview() {
        fatalError("not implemented yet")
    }

    /// Unlinks the view from its superview and its window and removes it from the responder chain, but does not invalidate its cursor rectangles to cause redrawing.
    /// 
    /// The view is also released; if you plan to reuse it, be sure to retain it before sending this message and to release it as appropriate when adding it as a subview of another view.
    /// Unlike its counterpart, removeFromSuperview(), this method can be safely invoked during display.
    public func removeFromSuperviewWithoutNeedingDisplay() {
        fatalError("not implemented yet")
    }

    /// Replaces one of the view’s subviews with another view.
    /// 
    /// This method does nothing if oldView is not a subview of the view.
    /// 
    /// Neither oldView nor newView may be nil, and the behavior is undefined if either of these parameters is nil.
    /// This method causes oldView to be released; if you plan to reuse it, be sure to retain it before sending this message and to release it as appropriate when adding it as a subview of another NSView.
    /// Calling this method also removes any constraints associated with oldView and its subtree.
    /// - Parameters:
    ///   - oldView: The view to be replaced by newView. May not be nil.
    ///   - newView: The view to replace oldView. May not be nil.
    public func replaceSubview(_ oldView: NSView, with newView: NSView) {
        fatalError("not implemented yet")
    }

    // MARK: - Responding to View-Related Notifications

    /// Overridden by subclasses to perform additional actions when subviews are added to the view.
    /// 
    /// This method is invoked by addSubview(_:).
    /// - Parameter subview: The view that was added as a subview.
    open func didAddSubview(_ subview: NSView) {
        fatalError("not implemented yet")
    }

    /// Informs the view that its superview has changed (possibly to nil).
    /// 
    /// The default implementation does nothing; 
    /// Subclasses can override this method to perform whatever actions are necessary.
    open func viewDidMoveToSuperview() {
        fatalError("not implemented yet")
    }

    /// Informs the view that it has been added to a new view hierarchy.
    /// 
    /// The default implementation does nothing; 
    /// Subclasses can override this method to perform whatever actions are necessary.
    /// 
    /// If the view’s ``window`` property is nil, that result signifies that the view was removed from its window and does not currently reside in any window.
    open func viewDidMoveToWindow() {
        fatalError("not implemented yet")
    }

    /// Informs the view that its superview is about to change to the specified superview (which may be nil).
    /// 
    /// Subclasses can override this method to perform whatever actions are necessary.
    /// - Parameter newSuperview: A view object that will be the new superview of the view.
    open func viewWillMove(toSuperview newSuperview: NSView?) {
        fatalError("not implemented yet")
    }

    /// Informs the view that it’s being added to the view hierarchy of the specified window object (which may be nil).
    /// 
    /// AppKit calls this method when the window of a view changes. 
    /// It also calls it in cases where a view stays in the same window but its position in its view hierarchy changes. 
    /// The view that moved also calls this method on all of its subviews, giving each of them a chance to respond to the change.
    /// 
    /// Subclasses can override this method to perform whatever actions are necessary. 
    /// For example, when a window is deallocated, you can use this method to remove notification observers and bindings associated with the view.
    /// 
    /// When a window is deallocated, AppKit calls this method for each view in the window, passing nil for the newWindow parameter. 
    /// AppKit does not necessarily call this method when closing a window, though. 
    /// Closing a window usually just hides the window. 
    /// Closed windows are deallocated only if their ``isReleasedWhenClosed`` method returns true.
    /// - Parameter newWindow: The window object that will be at the root of the view's new view hierarchy. If the view is being removed from a window and there is no new window, this parameter is nil.
    open func viewWillMove(toWindow newWindow: NSWindow?) {
        fatalError("not implemented yet")
    }

    /// Overridden by subclasses to perform additional actions before subviews are removed from the view.
    /// 
    /// This method is invoked when subview receives a ``removeFromSuperview()`` message or subview is removed from the view due to it being added to another view with ``addSubview(_:)``.
    /// - Parameter subview: The subview that will be removed.
    open func willRemoveSubview(_ subview: NSView) {
        fatalError("not implemented yet")
    }

    // MARK: - Identifying Views by Tag

    /// Returns the view’s nearest descendant (including itself) with a specific tag, or nil if no subview has that tag.
    /// - Parameter tag: An integer identifier associated with a view object.
    public func viewWithTag(_ tag: Int) -> NSView? {
        fatalError("not implemented yet")
    }

    /// The view’s tag, which is an integer that you use to identify the view within your app.
    /// 
    /// The default value of this property is –1. 
    /// Subclasses can override this property to provide individual tags for views, possibly redefining the property as readwrite so that you can modify it more easily.
    open private(set) var tag: Int = -1

    // MARK: - View Coordinates
    // MARK: - Modifying the Frame Rectangle

    /// The view’s frame rectangle, which defines its position and size in its superview’s coordinate system.
    /// 
    /// Changing the value of this property repositions and resizes the view within the coordinate system of its superview. 
    /// Changing the frame does not mark the view as needing to be displayed. 
    /// Set the ``needsDisplay`` property to true when you want the view to be redisplayed.
    /// 
    /// If your view does not use a custom bounds rectangle, this method also sets the view’s bounds to match the size of the new frame. 
    /// You can specify a custom bounds rectangle by changing the bounds property or by calling the ``setBoundsOrigin(_:)`` or ``setBoundsSize(_:)`` method explicitly. 
    /// Once set, the view creates an internal transform to convert from frame coordinates to bounds coordinates. 
    /// As long as the width-to-height ratio of the two coordinate systems remains the same, your content appears normal. 
    /// If the ratios differ, your content may appear skewed.
    /// 
    /// The frame rectangle may be rotated relative to its superview’s coordinate system. 
    /// For more information, see the ``frameRotation`` property.
    /// 
    /// Changing the value of this property results in the posting of an ``frameDidChangeNotification`` to the default notification center if the view is configured to do so.
    public var frame: NSRect = .zero

    /// Sets the origin of the view’s frame rectangle to the specified point, effectively repositioning it within its superview.
    /// 
    /// Changing the frame does not mark the view as needing to be displayed. 
    /// Set the ``needsDisplay`` property to true when you want the view to be redisplayed.
    /// 
    /// Changing the frame origin results in the posting of an ``frameDidChangeNotification`` to the default notification center if the view is configured to do so.
    /// - Parameter newOrigin: The point that is the new origin of the view's frame.
    public func setFrameOrigin(_ newOrigin: NSPoint) {
        fatalError("not implemented yet")
    }

    /// Sets the size of the view’s frame rectangle to the specified dimensions, resizing it within its superview without affecting its coordinate system.
    /// 
    /// Changing the frame does not mark the view as needing to be displayed. 
    /// Set the ``needsDisplay`` property to true when you want the view to be redisplayed.
    /// 
    /// Changing the frame size results in the posting of an ``frameDidChangeNotification`` to the default notification center if the view is configured to do so.
    /// 
    /// In macOS 10.4 and later, you can override this method to support content preservation during live resizing. 
    /// In your overridden implementation, include some conditional code to be executed only during a live resize operation. 
    /// Your code must invalidate any portions of your view that need to be redrawn.
    /// - Parameter newSize: An NSSize structure specifying the new height and width of the frame rectangle.
    public func setFrameSize(_ newSize: NSSize) {
        fatalError("not implemented yet")
    }

    /// The angle of rotation, measured in degrees, applied to the view’s frame rectangle relative to its superview’s coordinate system.
    /// 
    /// Positive values indicate counterclockwise rotation. 
    /// Negative values indicate clockwise rotation. 
    /// Rotation is performed around the origin of the frame rectangle. 
    /// Changing the value of this property does not mark the view as needing to be displayed. 
    /// Set the ``needsDisplay`` property to true when you want the view to be redisplayed.
    /// 
    /// Changing the frame rotation value results in the posting of an ``frameDidChangeNotification`` to the default notification center if the view is configured to do so.
    public var frameRotation: Float = 0

    /// Posted whenever the view’s frame rectangle changes to a new value, but only when the view’s ``postsFrameChangedNotifications`` property is true.
    /// 
    /// The notification object is the NSView object whose frame rectangle has changed. 
    /// This notification does not contain a userInfo dictionary.
    /// The following methods can result in notification posting:
    /// - ``frame``
    /// - ``setFrameOrigin(_:)``
    /// - ``frameRotation``
    /// - ``setFrameSize(_:)``
    public static let frameDidChangeNotification = NSNotification.Name("NSViewFrameDidChangeNotification")

    /// A Boolean value indicating whether the view posts notifications when its frame rectangle changes.
    /// 
    /// When the value of this property is true and the view’s frame rectangle changes to a new value, the view posts a frameDidChangeNotification to the default notification center. 
    /// The notification is not posted when you set the frame rectangle to the value it already has. 
    /// The default value of this property is true.
    /// 
    /// If the value of this property is currently false and and the frame has changed, changing the value to true causes the view to post a ``frameDidChangeNotification`` notification immediately. 
    /// This happens even when there has been no net change in the view's frame rectangle.
    /// 
    /// The following methods and properties can trigger a frame change notification:
    /// - ``frame``
    /// - ``setFrameOrigin(_:)``
    /// - ``setFrameSize(_:)``
    /// - ``frameRotation``
    public var postsFrameChangedNotifications: Bool = true

    // MARK: - Modifying the Bounds Rectangle

    /// The view’s bounds rectangle, which expresses its location and size in its own coordinate system.
    /// 
    /// By default, this property contains a rectangle whose origin is (0, 0) and whose size matches the size of the view’s frame rectangle (measured in points). 
    /// In macOS 10.5 and later, if the view is being rendered into an OpenGL graphics context (using an ``NSOpenGLContext`` object), the default bounds origin is still (0, 0) but the default bounds size is measured in pixels instead of points. 
    /// Thus, for user space scale factors other than 1.0, the default size of the bounds rectangle may be bigger or smaller than the default size of the frame rectangle when drawing with OpenGL.
    /// 
    /// If you explicitly change the origin or size of the bounds rectangle, this property saves the rectangle you set. 
    /// If you add a rotation factor to the view, however, that factor is also reflected in the returned bounds rectangle. 
    /// You can determine if a rotation factor is in effect by getting the value of the ``boundsRotation`` property.
    /// 
    /// Changing the bounds does not mark the view as needing to be displayed. 
    /// Set the ``needsDisplay`` property to true when you want the view to be redisplayed. 
    /// After changing the bounds rectangle, the view creates an internal transform, a tool for manipulating coordinates, (or appends these changes to an existing internal transform) to convert from frame coordinates to bounds coordinates in your view. 
    /// As long as the width-to-height ratio of the two coordinate systems remains the same, your content appears normal. 
    /// If the ratios differ, your content may appear skewed.
    /// 
    /// Changing the value of this property results in the posting of an ``boundsDidChangeNotification`` to the default notification center if the view is configured to do so.
    public  var bounds: NSRect = .zero

    /// Sets the origin of the view’s bounds rectangle to a specified point.
    /// 
    /// In setting the new bounds origin, this method effectively shifts the view's coordinate system so newOrigin lies at the origin of the view’s frame rectangle. 
    /// It neither redisplays the view nor marks it as needing display. 
    /// Set the ``needsDisplay`` property to true when you want the view to be redisplayed.
    /// 
    /// This method posts an ``boundsDidChangeNotification`` to the default notification center if the view is configured to do so.
    /// After calling this method, NSView creates an internal transform (or appends these changes to an existing internal transform) to convert from frame coordinates to bounds coordinates in your view. 
    /// As long as the width-to-height ratio of the two coordinate systems remains the same, your content appears normal. 
    /// If the ratios differ, your content may appear skewed.
    /// - Parameter newOrigin: A point specifying the new bounds origin of the view.
    public func setBoundsOrigin(_ newOrigin: NSPoint) {
        fatalError("not implemented yet")
    }

    /// Sets the size of the view’s bounds rectangle to specified dimensions, inversely scaling its coordinate system relative to its frame rectangle.
    /// 
    /// For example, a view object with a frame size of (100.0, 100.0) and a bounds size of (200.0, 100.0) draws half as wide along the x axis. 
    /// This method neither redisplays the view nor marks it as needing display. 
    /// Set the ``needsDisplay`` property to true when you want the view to be redisplayed.
    /// 
    /// This method posts an ``boundsDidChangeNotification`` to the default notification center if the view is configured to do so.
    /// After calling this method, NSView creates an internal transform (or appends these changes to an existing internal transform) to convert from frame coordinates to bounds coordinates in your view. 
    /// As long as the width-to-height ratio of the two coordinate systems remains the same, your content appears normal. 
    /// If the ratios differ, your content may appear skewed.
    /// - Parameter newSize: An NSSize structure specifying the new width and height of the view's bounds rectangle.
    public func setBoundsSize(_ newSize: NSSize) {
        fatalError("not implemented yet")
    }

    /// The angle of rotation, measured in degrees, applied to the view’s bounds rectangle relative to its frame rectangle.
    /// 
    /// Positive values indicate counterclockwise rotation. 
    /// Negative values indicate clockwise rotation. 
    /// Rotation is performed around the coordinate system origin, (0.0, 0.0), which need not coincide with that of the frame rectangle or the bounds rectangle. 
    /// Changing the value of this property neither redisplays the view nor marks it as needing display. 
    /// Set the ``needsDisplay`` property to true when you want the view to be redisplayed.
    /// 
    /// Bounds rotation affects the orientation of the drawing within the view object’s frame rectangle, but not the orientation of the frame rectangle itself. 
    /// Also, for a rotated bounds rectangle to enclose all the visible areas of its view object—that is, to guarantee coverage over the frame rectangle—it must also contain some areas that aren’t visible. 
    /// This can cause unnecessary drawing to be requested, which may affect performance. 
    /// It may be better in many cases to rotate the coordinate system in the ``draw(_:)`` method rather than use this method.
    /// 
    /// After changing the value of this property, the view creates an internal transform (or appends these changes to an existing internal transform) to convert from frame coordinates to bounds coordinates in your view. 
    /// As long as the width-to-height ratio of the two coordinate systems remains the same, your content appears normal. 
    /// If the ratios differ, your content may appear skewed.
    /// 
    /// Changing the value of this property results in the posting of an ``boundsDidChangeNotification`` to the default notification center if the view is configured to do so.
    public var boundsRotation: CGFloat = 0

    /// Posted whenever the NSView’s bounds rectangle changes to a new value independently of the frame rectangle, but only when the view’s ``postsBoundsChangedNotifications`` property is true.
    /// 
    /// The notification object is the NSView object whose bounds rectangle has changed. 
    /// This notification does not contain a userInfo dictionary.
    /// The following methods can result in notification posting:
    /// - ``bounds``
    /// - ``setBoundsOrigin(_:)``
    /// - ``boundsRotation``
    /// - ``setBoundsSize(_:)``
    /// - ``translateOrigin(to:)``
    /// - ``scaleUnitSquare(to:)``
    /// - ``rotate(byDegrees:)``
    /// 
    /// Note that the bounds rectangle resizes automatically to track the frame rectangle. 
    /// However, changes to the frame rectangle do not result in this bounds-changed notification.
    public static let boundsDidChangeNotification = NSNotification.Name("NSViewBoundsDidChangeNotification")

    /// A Boolean value indicating whether the view posts notifications when its bounds rectangle changes.
    /// 
    /// When the value of this property is true and the view’s bounds rectangle changes to a new value, the view posts a ``boundsDidChangeNotification`` to the default notification center. 
    /// The notification is not posted when you set the bounds rectangle to the value it already has. 
    /// The default value of this property is true.
    /// 
    /// If the value of this property is currently false and the bounds have changed, changing the value to true causes the view to post a ``boundsDidChangeNotification`` notification immediately. 
    /// This happens even when there has been no net change in the view's bounds rectangle.
    /// The following methods can result in notification posting:
    /// - ``bounds``
    /// - ``setBoundsOrigin(_:)``
    /// - ``boundsRotation``
    /// - ``setBoundsSize(_:)``
    /// - ``translateOrigin(to:)``
    /// - ``scaleUnitSquare(to:)``
    /// - ``rotate(byDegrees:)``
    public var postsBoundsChangedNotifications: Bool = true

    // MARK: - Examining Coordinate System Modifications

    /// A Boolean value indicating whether the view uses a flipped coordinate system.
    /// 
    /// The default value of this property is false, which results in a non-flipped coordinate system. 
    /// In a non-flipped coordinate system, the origin is in the lower-left corner of the view and positive y-values extend upward. 
    /// In a flipped coordinate system, the origin is in the upper-left corner of the view and y-values extend downward. 
    /// X-values always extend to the right.
    /// 
    /// If you want your view to use a flipped coordinate system, override this property and return true.
    public var isFlipped: Bool = false

    /// A Boolean value indicating whether the view or any of its ancestors has ever had a rotation factor applied to its frame or bounds.
    /// 
    /// The value of this property is true if the view or any of its ancestors has had its ``frameRotation`` or ``boundsRotation`` properties modified at any time. 
    /// The value is still true if the rotation factor is changed to a nonzero value and then back to 0.
    /// 
    /// Use this information to optimize drawing and coordinate calculation. 
    /// Do not use it to reflect the exact state of the view’s coordinate system.
    public var isRotatedFromBase: Bool = false

    /// A Boolean value indicating whether the view or any of its ancestors has ever had a rotation factor applied to its frame or bounds, or has been scaled from the window’s base coordinate system.
    /// 
    /// The value of this property is true if the view or any of its ancestors has had its ``frameRotation`` or ``boundsRotation`` properties modified at any time. 
    /// The value is still true if the rotation factor is changed to a nonzero value and then back to 0.
    /// 
    /// Use this information to optimize drawing and coordinate calculation. 
    /// Do not use it to reflect the exact state of the view’s coordinate system.
    public var isRotatedOrScaledFromBase: Bool = false

    // MARK: - Modifying the Coordinate System

    /// Translates the view’s coordinate system so that its origin moves to a new location.
    /// 
    /// In the process, the origin of the view’s bounds rectangle is shifted by (–translation.x, –translation.y). 
    /// This method neither redisplays the view nor marks it as needing display. 
    /// You must do this yourself by calling the ``display()`` method or setting the ``needsDisplay`` property.
    /// 
    /// Note the difference between this method and setting the bounds origin. 
    /// Translation effectively moves the image inside the bounds rectangle, while setting the bounds origin effectively moves the rectangle over the image. 
    /// The two are in a sense inverse, although translation is cumulative, and setting the bounds origin is absolute.
    /// 
    /// This method posts an ``boundsDidChangeNotification`` to the default notification center if the view is configured to do so.
    /// - Parameter translation: A point that specifies the new origin.
    public func translateOrigin(to translation: NSPoint) {
        fatalError("not implemented yet")
    }

    /// Scales the view’s coordinate system so that the unit square scales to the specified dimensions.
    /// 
    /// For example, a newUnitSize of (0.5, 1.0) causes the view’s horizontal coordinates to be halved, in turn doubling the width of its bounds rectangle. 
    /// Note that scaling is performed from the origin of the coordinate system, (0.0, 0.0), not the origin of the bounds rectangle; as a result, both the origin and size of the bounds rectangle are changed. 
    /// The frame rectangle remains unchanged.
    /// 
    /// This method does not redisplay the view or mark it as needing display. 
    /// You must do this yourself by calling the ``display()`` method or setting the ``needsDisplay`` property.
    /// 
    /// This method posts an ``boundsDidChangeNotification`` to the default notification center if the view is configured to do so.
    /// - Parameter newUnitSize: An NSSize structure specifying the new unit size.
    public func scaleUnitSquare(to newUnitSize: NSSize) {
        fatalError("not implemented yet")
    }

    /// Rotates the view’s bounds rectangle by a specified degree value around the origin of the coordinate system, (0.0, 0.0).
    /// 
    /// See the ``boundsRotation`` method description for more information. 
    /// This method neither redisplays the view nor marks it as needing display. 
    /// You must do this yourself by calling the ``display()`` method or setting the ``needsDisplay`` property.
    /// 
    /// This method posts an ``boundsDidChangeNotification`` to the default notification center if the view is configured to do so.
    /// - Parameter angle: A float value specifying the angle of rotation, in degrees.
    public func rotate(byDegrees angle: CGFloat) {
        fatalError("not implemented yet")
    }
}