import CoreAnimation
import CoreImage
import CoreGraphics
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

    // MARK: - Converting Coordinate Values

    /// Returns a backing store pixel-aligned rectangle in local view coordinates.
    /// 
    /// Uses the ``NSIntegralRectWithOptions(_:_:)`` function and the given input rectangle and options to produce a backing store pixel-aligned rectangle in the view’s interior coordinates.
    /// - Parameters:
    ///   - rect: The rectangle in the view’s interior coordinate system.
    ///   - options: The alignment options. See AlignmentOptions for possible values. (Note that although the alignment options specify integral values, the rectangle returned by this method is pixel-aligned.)
    /// - Returns: A rectangle in the view’s interior coordinate system that is aligned to the backing store pixels using the specified options.
    public func backingAlignedRect(_ rect: NSRect, options: AlignmentOptions = []) -> NSRect {
        fatalError("not implemented yet")
    }

    /// Converts a point from its pixel aligned backing store coordinate system to the view’s interior coordinate system.
    /// - Parameter point: The point in the pixel backing store aligned coordinate system.
    /// - Returns: A point in the view’s interior coordinate system.
    public func convertFromBacking(_ point: NSPoint) -> NSPoint {
        fatalError("not implemented yet")
    }

    /// Converts a point from the view’s interior coordinate system to its pixel aligned backing store coordinate system.
    /// - Parameter point: The point in the view’s interior coordinate system.
    /// - Returns: A point in its pixel aligned backing store coordinate system.
    public func convertToBacking(_ point: NSPoint) -> NSPoint {
        fatalError("not implemented yet")
    }

    /// Convert the point from the layer’s interior coordinate system to the view’s interior coordinate system.
    /// 
    /// The layer’s space is virtual, and doesn’t take into account the layer’s ``contentsScale`` setting.
    /// - Parameter point: The point in the layer’s interior coordinate system.
    /// - Returns: The point in the view’s interior coordinate system.
    public func convertFromLayer(_ point: NSPoint) -> NSPoint {
        fatalError("not implemented yet")
    }

    /// Convert the size from the view’s interior coordinate system to the layer’s interior coordinate system.
    /// 
    /// The layer’s space is virtual, and doesn’t take into account the layer’s ``contentsScale`` setting.
    /// - Parameter point: A point in the view’s interior coordinate system.
    /// - Returns: A point in the view’s layer interior coordinate system.
    public func convertToLayer(_ point: NSPoint) -> NSPoint {
        fatalError("not implemented yet")
    }

    /// Converts a rectangle from its pixel aligned backing store coordinate system to the view’s interior coordinate system.
    /// - Parameter rect: The rectangle in the pixel backing store coordinate system.
    /// - Returns: A rectangle in the view’s interior coordinate system.
    public func convertFromBacking(_ rect: NSRect) -> NSRect {
        fatalError("not implemented yet")
    }

    /// Converts a rectangle from the view’s interior coordinate system to its pixel aligned backing store coordinate system.
    /// - Parameter rect: A rectangle in the view’s interior coordinate system.
    /// - Returns: A rectangle in its pixel aligned backing store coordinate system.
    public func convertToBacking(_ rect: NSRect) -> NSRect {
        fatalError("not implemented yet")
    }

    /// Convert the rectangle from the layer’s interior coordinate system to the view’s interior coordinate system.
    /// 
    /// The layer’s space is virtual, and doesn’t take into account the layer’s ``contentsScale`` setting.
    /// - Parameter rect: A rectangle in the layer’s interior coordinate system.
    /// - Returns: A rectangle in the view’s interior coordinate system.
    public func convertFromLayer(_ rect: NSRect) -> NSRect {
        fatalError("not implemented yet")
    }

    /// Convert the size from the view’s interior coordinate system to the layer’s interior coordinate system.
    /// 
    /// The layer’s space is virtual, and doesn’t take into account the layer’s ``contentsScale`` setting.
    /// - Parameter rect: A rectangle in the view’s interior coordinate system.
    /// - Returns: A rectangle in the layer's interior coordinate system.
    public func convertToLayer(_ rect: NSRect) -> NSRect {
        fatalError("not implemented yet")
    }

    /// Converts a size from its pixel aligned backing store coordinate system to the view’s interior coordinate system.
    /// - Parameter size: The size in the pixel aligned coordinate system.
    /// - Returns: The size in the view’s interior coordinate system.
    public func convertFromBacking(_ size: NSSize) -> NSSize {
        fatalError("not implemented yet")
    }

    /// Converts a size from the view’s interior coordinate system to its pixel aligned backing store coordinate system.
    /// - Parameter size: The size in the view’s interior coordinate system.
    /// - Returns: The size in the pixel aligned coordinate system.
    public func convertToBacking(_ size: NSSize) -> NSSize {
        fatalError("not implemented yet")
    }

    /// Convert the size from the layer’s interior coordinate system to the view’s interior coordinate system.
    /// 
    /// The layer’s space is virtual, and doesn’t take into account the layer’s ``contentsScale`` setting.
    /// The returned NSSize values are always forced to have positive a width and height.
    /// - Parameter size: A size in the layer’s interior coordinate system.
    /// - Returns: A size in the view’s interior coordinate system.
    public func convertFromLayer(_ size: NSSize) -> NSSize {
        fatalError("not implemented yet")
    }

    /// Convert the size from the view’s interior coordinate system to the layer’s interior coordinate system.
    /// 
    /// The layer’s space is virtual, and doesn’t take into account the layer’s ``contentsScale`` setting.
    /// The returned NSSize values are always forced to have positive a width and height.
    /// - Parameter size: A size in the view’s interior coordinate system.
    /// - Returns: A size in the layer's interior coordinate system.
    public func convertToLayer(_ size: NSSize) -> NSSize {
        fatalError("not implemented yet")
    }

    /// Converts a point from the coordinate system of a given view to that of the view.
    /// - Parameters:
    ///   - point: A point specifying a location in the coordinate system of view.
    ///   - view: The view with point in its coordinate system. Both view and the view must belong to the same ``NSWindow`` object, and that window must not be nil. If view is nil, this method converts from window coordinates instead.
    /// - Returns: The point converted to the coordinate system of the view.
    public func convert(_ point: NSPoint, from view: NSView?) -> NSPoint {
        fatalError("not implemented yet")
    }

    /// Converts a point from the view’s coordinate system to that of a given view.
    /// - Parameters:
    ///   - point: A point specifying a location in the coordinate system of the view.
    ///   - view: The view into whose coordinate system point is to be converted. Both view and the view must belong to the same ``NSWindow`` object, and that window must not be nil. If view is nil, this method converts to window coordinates instead.
    /// - Returns: The point converted to the coordinate system of view.
    public func convert(_ point: NSPoint, to view: NSView?) -> NSPoint {
        fatalError("not implemented yet")
    }

    /// Converts a size from another view’s coordinate system to that of the view.
    /// 
    /// The returned ``NSSize`` values are always forced to have positive a width and height.
    /// You can also use this method to get a view’s current magnification or zoom level, if it’s been changed from the default scale. 
    /// Specifically, if you convert a known size from the window’s base coordinate space to that of view, the result is the current zoom level.
    /// - Parameters:
    ///   - size: The size (width and height) in view’s coordinate system.
    ///   - view: The view with size in its coordinate system. Both view and the view must belong to the same ``NSWindow`` object, and that window must not be nil. If view is nil, this method converts from window coordinates instead.
    /// - Returns: The converted size, as an ``NSSize`` structure.
    public func convert(_ size: NSSize, from view: NSView?) -> NSSize {
        fatalError("not implemented yet")
    }

    /// Converts a size from the view’s coordinate system to that of another view.
    /// 
    /// The returned ``NSSize`` values are always forced to have positive a width and height.
    /// - Parameters:
    ///   - size: The size (width and height) in the view’s coordinate system.
    ///   - view: The view that’s the target of the conversion operation. Both view and the view must belong to the same ``NSWindow`` object, and that window must not be nil. If view is nil, this method converts to window coordinates instead.
    /// - Returns: The converted size, as an ``NSSize`` structure.
    public func convert(_ size: NSSize, to view: NSView?) -> NSSize {
        fatalError("not implemented yet")
    }

    /// Converts a rectangle from the coordinate system of another view to that of the view.
    /// - Parameters:
    ///   - rect: The rectangle in the view coordinate system.
    ///   - view: The view with rect in its coordinate system. Both view and the view must belong to the same ``NSWindow`` object, and that window must not be nil. If view is nil, this method converts from window coordinates instead.
    /// - Returns: The converted rectangle.
    public func convert(_ rect: NSRect, from view: NSView?) -> NSRect {
        fatalError("not implemented yet")
    }

    /// Converts a rectangle from the view’s coordinate system to that of another view.
    /// - Parameters:
    ///   - rect: A rectangle in the view’s coordinate system.
    ///   - view: The view that’s the target of the conversion operation. Both view and the view must belong to the same ``NSWindow`` object, and that window must not be nil. If view is nil, this method converts the rectangle to window coordinates instead.
    /// - Returns: The converted rectangle.
    public func convert(_ rect: NSRect, to view: NSView?) -> NSRect {
        fatalError("not implemented yet")
    }

    /// Converts the corners of a specified rectangle to lie on the center of device pixels, which is useful in compensating for rendering overscanning when the coordinate system has been scaled.
    /// 
    /// This method converts the given rectangle to device coordinates, adjusts the rectangle to lie in the center of the pixels, and converts the resulting rectangle back to the view’s coordinate system. 
    /// Note that this method does not take into account any transformations performed using the NSAffineTransform class or Quartz 2D routines.
    /// - Parameter rect: The rectangle whose corners are to be converted.
    /// - Returns: The adjusted rectangle.
    public func centerScanRect(_ rect: NSRect) -> NSRect {
        fatalError("not implemented yet")
    }

    // MARK: - Appereance
    // MARK: - Showing and Hiding the View

    /// A Boolean value indicating whether the view is hidden.
    /// 
    /// This property reflects the state of the current view only, as set in Interface Builder or through the most recent change to this property. 
    /// The property does not account for the state of the view’s ancestors in the view hierarchy. 
    /// Thus, if the view has a hidden ancestor, the value of this property may still be false even though the view itself is not visible. 
    /// To determine whether a view is effectively hidden, for whatever reason, get the value of the ``isHiddenOrHasHiddenAncestor`` property instead.
    /// 
    /// A hidden view disappears from its window and does not receive input events. 
    /// It remains in its superview’s list of subviews, however, and participates in autoresizing as usual. 
    /// AppKit also disables any cursor rectangle, tool-tip rectangle, or tracking rectangle associated with a hidden view. 
    /// Hiding a view with subviews has the effect of hiding those subviews and any view descendants they might have. 
    /// This effect is implicit and does not alter the hidden state of the view’s descendants as reported by this property.
    /// 
    /// Hiding the view that is the window’s current first responder causes the view’s next valid key view (nextValidKeyView) to become the new first responder. 
    /// A hidden view remains in the nextKeyView chain of views it was previously part of, but is ignored during keyboard navigation.
    public var isHidden: Bool = false

    /// A Boolean value indicating whether the view is hidden from sight because it, or one of its ancestors, is marked as hidden.
    /// 
    /// The value of this property is true if the value of the ``isHidden`` property is true for the current view or any of its ancestors in the view hierarchy. 
    /// This property does not account for other reasons why a view might be considered hidden, such as being positioned outside its superview’s bounds, not having a window, or residing in a window that is offscreen or overlapped by another window.
    public var isHiddenOrHasHiddenAncestor: Bool = false

    /// Invoked when the view is hidden, either directly, or in response to an ancestor being hidden.
    /// 
    /// The view receives this message when its ``isHiddenOrHasHiddenAncestor`` property changes from false to true.
    ///  This happens when the view or an ancestor is marked as hidden, or when the view or an ancestor is inserted into a new view hierarchy.
    open func viewDidHide() {
        fatalError("not implemented yet")
    }

    /// Invoked when the view is unhidden, either directly, or in response to an ancestor being unhidden
    /// 
    /// The view receives this message when its ``isHiddenOrHasHiddenAncestor`` state goes from true to false.  
    /// This can happen when the view or an ancestor is marked as not hidden, or when the view or an ancestor is removed from its containing view hierarchy.
    open func viewDidUnhide() {
        fatalError("not implemented yet")
    }

    // MARK: - Responding to Appearance Changes

    /// Informs the view that its effective appearance changed.
    open func viewDidChangeEffectiveAppearance() {
        fatalError("not implemented yet")
    }

    /// Responds when the view’s backing store properties change.
    /// 
    /// The view gets this message when the backing store scale or color space changes. 
    /// Provide an implementation if you need to swap assets or make other adjustments when a view’s backing store properties change.
    open func viewDidChangeBackingProperties() {
        fatalError("not implemented yet")
    }

    // MARK: - Getting the Vibrancy Setting
    
    /// A Boolean value indicating whether the view ensures it is vibrant on top of other content.
    /// 
    /// AppKit checks this property when the view is incorporated into a view hierarchy that uses vibrancy. 
    /// If the property is true, the view takes appropriate measures to ensure its content is vibrant on top of any underlying material. 
    /// The default value of this property is false. However, some of AppKit’s view subclasses change the value of this property based on the artwork they draw.
    public private(set) var allowsVibrancy: Bool = false

    // MARK: - Drawing the Focus Ring

    /// The type of focus ring drawn around the view.
    /// 
    /// Use this property to specify the type of focus ring to draw. For a list of possible values, see ``NSFocusRingType``.
    /// To disable drawing of a view’s focus ring, set the value of this property to ``NSFocusRingType.none``. 
    /// You should only disable the default drawing of a view’s focus ring when you want the view to draw its own focus ring. 
    /// For example, you might disable focus ring drawing when the view uses its background color to indicate focus or when the view does not have sufficient space to display a focus ring.
    /// 
    /// Changing the value in this property does not cause the view to draw the actual focus ring. 
    /// You are responsible for drawing the focus ring in your view’s ``draw(_:)`` method whenever your view is made the first responder.
    /// 
    /// To ensure the correct redrawing of focus rings, note that AppKit may automatically draw parts of a window in addition to those that are marked as needing display.
    /// For example, AppKit may redraw parts of the first responder view in an app's key window, if that view's focusRingType property is set to a value other than NSFocusRingType.none. 
    /// If your view can become first responder, but doesn't draw a focus ring, set focusRingType to ``NSFocusRingType.none`` to prevent AppKit from unnecessarily redrawing the view’s focus ring.
    public var focusRingType: NSFocusRingType = .none

    /// The focus ring mask bounds, specified in the view’s coordinate space.
    /// 
    /// The rectangle in this property is specified relative to the view’s interior (bounds) coordinate space. 
    /// The mask bounds allows the focus ring’s overall size and position to be determined before it is drawn. 
    /// Override this property if your view requires the display of a focus ring. The default value of this property is NSZeroRect.
    public var focusRingMaskBounds: NSRect = .zero

    /// Draws the focus ring mask for the view.
    /// 
    /// This method provides the shape of the focus ring mask by drawing the focus ring mask. 
    /// An implementation of this method should draw in the view’s interior (bounds) coordinate space, that the focus ring style has been set (it will be set it to ``NSFocusRingPlacement.only`` to capture the focus ring itself), and that the fill and stroke colors have been set to an arbitrary fully opaque color.
    /// Subclasses that find the default behavior insufficient should only draw the focus ring shape.
    /// The ``NSView`` implementation of this method simply fills self.bounds.
    public func drawFocusRingMask() {
        fatalError("not implemented yet")
    }

    /// Invoked to notify the view that the focus ring mask requires updating.
    /// 
    /// It is important to note that it is only necessary for developers to invoke this method when some internal state change of their application, that AppKit can’t determine, affects the shape of the focus ring mask.
    /// It is assumed that if the view is marked as needing display, or is resized, its focus ring shape is likely to have changed, and there is no need for clients to explicitly send this message in such cases, they are handled automatically.
    /// If, however, a view is showing a focus ring around some part of its content (an NSImage, perhaps), and that content changes, the client must provide notification by invoking this method so that focusRingMaskBounds and drawFocusRingMask() will be invoked to redraw the focus ring.
    public func noteFocusRingMaskChanged() {
        fatalError("not implemented yet")
    }

    /// Invalidates the area around the focus ring.
    /// - Parameter rect: The rectangle of the control or cell defining the area around the focus ring. rect will be expanded to include the focus ring for invalidation.
    public func setKeyboardFocusRingNeedsDisplay(_ rect: NSRect) {
        fatalError("not implemented yet")
    }

    /// Returns the default focus ring type.
    /// 
    /// If the value in the focusRingType property is ``NSFocusRingType.default``, the view can call this class method to find out what type of focus ring is the default. 
    /// The view is free to ignore the default setting.
    public static var defaultFocusRingType: NSFocusRingType = .default

    // MARK: - Core Animation Support
    // MARK: - Managing the View’s Layer

    /// A Boolean value indicating whether the view uses a layer as its backing store.
    /// 
    /// Setting the value of this property to true turns the view into a layer-backed view—that is, the view uses a CALayer object to manage its rendered content. 
    /// Creating a layer-backed view implicitly causes the entire view hierarchy under that view to become layer-backed. 
    /// Thus, the view and all of its subviews (including subviews of subviews) become layer-backed. The default value of this property is false.
    /// 
    /// In a layer-backed view, any drawing done by the view is cached to the underlying layer object. 
    /// This cached content can then be manipulated in ways that are more performant than redrawing the view contents explicitly. 
    /// AppKit automatically creates the underlying layer object (using the ``makeBackingLayer()`` method) and handles the caching of the view’s content. 
    /// If the wantsUpdateLayer method returns false, you should not interact with the underlying layer object directly. 
    /// Instead, use the methods of this class to make any changes to the view and its layer. 
    /// If wantsUpdateLayer returns true, it is acceptable (and appropriate) to modify the layer in the view’s ``updateLayer()`` method.
    /// 
    /// For layer-backed views, you can flatten the layer hierarchy by setting the ``canDrawSubviewsIntoLayer`` property to true. 
    /// To prevent a subview from having its contents flattened into this view’s layer, explicitly set the value of the subview’s wantsLayer property to true.
    /// 
    /// In addition to creating a layer-backed view, you can create a layer-hosting view by assigning a layer directly to the view’s layer property. 
    /// In a layer-hosting view, you are responsible for managing the view’s layer. 
    /// To create a layer-hosting view, you must set the layer property first and then set this property to true. 
    /// The order in which you set the values of these properties is crucial.
    /// 
    /// In a layer-hosting view, do not rely on the view for drawing. Similarly, do not add subviews to a layer-hosting view. 
    /// The root layer—that is, the layer you set using the layer property—becomes the root layer of the layer tree. 
    /// Any manipulations of that layer tree must be done using the Core Animation interfaces. 
    /// You still use the view for handling mouse and keyboard events, but drawing must be handled by Core Animation.
    public var wantsLayer: Bool = true

    /// A Boolean value indicating which drawing path the view takes when updating its contents.
    /// 
    /// A view can update its contents using one of two techniques. 
    /// It can draw those contents using its ``draw(_:)`` method or it can modify its underlying layer object directly. 
    /// During the view update cycle, each dirty view calls this method on itself to determine which technique to use. 
    /// The default implementation of this method returns false, which causes the view to use its ``draw(_:)`` method.
    /// 
    /// If your view is layer-backed and updates itself by modifying its layer, override this property and change the return value to true. 
    /// Modifying the layer is significantly faster than redrawing the layer contents using ``draw(_:)``. 
    /// If you override this property to be true, you must also override the ``updateLayer()`` method of your view and use it to make the changes to your layer. 
    /// Do not modify your layer in your implementation of this property. 
    /// Your implementation should return true or false quickly and not perform other tasks.
    /// 
    /// If the ``canDrawSubviewsIntoLayer`` property is set to true, the view ignores the value returned by this method. 
    /// Instead, the view always uses its ``draw(_:)`` method to draw its content.
    public private(set) var wantsUpdateLayer: Bool = false

    /// The Core Animation layer that the view uses as its backing store.
    /// 
    /// Use this property to set or get the layer associated with the view, if any. 
    /// When set, the layer serves as the backing store for the view’s contents.
    public var layer: CALayer?

    /// Creates the view’s backing layer.
    /// - Returns: The layer to use as the view’s backing layer.
    open func makeBackingLayer() -> CALayer {
        fatalError("not implemented yet")
    }

    /// The current layer contents placement policy.
    /// 
    /// The content placement determines how the backing layer’s existing cached content image will be mapped into the layer as the layer is resized. 
    /// It is analogous to, and underpinned by, the ``contentsGravity`` property of the ``CALayer`` class. 
    /// The default value of this property is ``NSView.LayerContentsPlacement.scaleAxesIndependently``. 
    /// For a list of supported values, see ``NSView.LayerContentsPlacement.``
    /// 
    /// For additional information about the performance impacts of this property, see the ``layerContentsRedrawPolicy`` property.
    public var layerContentsPlacement: NSView.LayerContentsPlacement = .scaleAxesIndependently

    /// The contents redraw policy for the view’s layer.
    /// 
    /// The ``layerContentsRedrawPolicy`` and ``layerContentsPlacement`` settings can have significant impacts on performance. 
    /// If you do not need to redraw your view during each frame update cycle, or if you are willing to accept an approximation of the view’s intermediate appearance during potentially brief animations in exchange for an animation performance and smoothness benefit, you can change the value of this property to one of the modes that does not require constant redrawing. 
    /// When you do so, you must also specify the desired layer content placement for the view. 
    /// The content placement determines how the backing layer’s existing cached content image will be mapped into the layer as the layer is resized. 
    /// It is analogous to, and underpinned by, the contentsGravity property of the CALayer class.
    /// 
    /// For a view that has no associated layer, or that has been assigned a developer-provided layer (a layer-hosting view) using the layer property, the default contents redraw policy is ``NSView.LayerContentsRedrawPolicy.never`` and the ``layerContentsPlacement`` property is set to ``NSView.LayerContentsPlacement.scaleAxesIndependently``. 
    /// These policies tell AppKit not to replace the layer’s content and to provide the same content placement as the resize option.For a layer-backed view—that is, a view for which AppKit created the layer—AppKit sets the contents redraw policy to ``NSView.LayerContentsRedrawPolicy.duringViewResize`` by default. 
    /// This policy forces the view’s content to be continually redrawn into the view’s backing layer during animated resizing of the view, which produces correct but not optimal performance results.
    public var layerContentsRedrawPolicy: NSView.LayerContentsRedrawPolicy = .never

    /// A Boolean value indicating whether the view incorporates content from its subviews into its own layer.
    /// 
    /// When the value of this property is true, any subviews that have an implicitly created layer—that is, layers for which you did not explicitly set the wantsLayer property to true—draw their contents into the current view’s layer. 
    /// In other words, the subviews do not get a layer of their own. Instead, they draw their content into the parent view’s layer. 
    /// All views involved in the operation draw their content using their ``draw(_:)`` method. 
    /// They do not use the ``updateLayer()`` method to update their layer contents, even if the ``wantsUpdateLayer`` property is set to true.
    /// 
    /// Use this property to flatten the layer hierarchy for a layer-backed view and its subviews. 
    /// Flattening a layer hierarchy reduces the number of layers (and may reduce the amount of memory) used by your view hierarchy. 
    /// Reducing the number of layers can be more efficient in situations where there is significant overlap among the subviews or where the content of the view and subviews does not change significantly. 
    /// For example, flattening a hierarchy reduces the amount of time spent compositing your views together. 
    /// Do not flatten a view hierarchy if you plan to animate one or more subviews in that hierarchy.
    /// 
    /// When changing the value of this property, the current view must have a layer object. 
    /// The default value of this property is false.
    public var canDrawSubviewsIntoLayer: Bool = false

    /// A Boolean value indicating whether the view’s layer uses Core Image filters and needs in-process rendering.
    /// 
    /// If your view uses a custom layer and you assigned Core Image to that layer directly, you must set this property to true to let AppKit know of that fact. 
    /// In macOS 10.9 and later, AppKit prefers to render layer trees out-of-process but cannot do so if any layers have Core Image filters attached to them. 
    /// Specifying true for property lets AppKit know that it must move rendering of the layer hierarchy back into your app’s process. 
    /// If the value of this property is false, adding a filter to the view’s layer triggers an exception.
    /// 
    /// You do not need to modify this property if you assigned the filters using the ``backgroundFilters``, ``compositingFilter``, or ``contentFilters`` properties of the view. 
    /// Those methods automatically let AppKit know that it needs to render the layer hierarchy in-process. 
    /// Set it only if you set the filters on the layer directly.
    public var layerUsesCoreImageFilters: Bool = false

    // MARK: - Managing Layer-Related Properties

    /// The opacity of the view.
    /// 
    /// This property contains the opacity value from the view’s layer. 
    /// The acceptable range of values for this property are between 0.0 (transparent) and 1.0 (opaque). 
    /// The default value of this property is 1.0.
    public var alphaValue: Float = 1

    /// The rotation angle of the view around the center of its layer.
    /// 
    /// This property contains the angle of rotation of the view’s frame around its center. 
    /// If you changed the underlying layer’s ``anchorPoint`` property, the result of setting this property is undefined.
    public var frameCenterRotation: Float = 0

    /// An array of Core Image filters to apply to the view’s background.
    /// 
    /// This property contains an array of ``CIFilter`` objects. 
    /// This array represents the background filters stored in the ``backgroundFilters`` property of the view’s layer. 
    /// If the view does not have a layer, setting the value of this property has no effect.
    /// 
    /// The default value of this property is an empty array.
    public var backgroundFilters: [CIFilter] = []

    /// The Core Image filter used to composite the view’s contents with its background.
    /// 
    /// This property contains the compositing filter stored in the ``compositingFilter`` property of the view’s layer. 
    /// If the view does not have a layer, setting the value of this property has no effect.
    /// 
    /// The default value of this property is nil, which causes content to be rendered without any special compositing effects.
    public var compositingFilter: CIFilter?

    /// An array of Core Image filters to apply to the contents of the view and its sublayers.
    /// 
    /// This property contains an array of ``CIFilter`` objects. 
    /// This array represents the filters stored in the ``filters`` property of the view’s layer. 
    /// If the view does not have a layer, setting the value of this property has no effect.
    /// 
    /// The default value of this property is an empty array.
    public var contentFilters: [CIFilter] = []

    /// The shadow displayed underneath the view.
    /// 
    /// The default value of this property is normally nil. 
    /// When you configure any of the shadow-related properties on the view’s layer, such as the ``shadowColor``, ``shadowOffset``, ``shadowOpacity`` or ``shadowRadius`` properties, this property contains the ``NSShadow`` object that encapsulates that information. 
    /// Assigning a new shadow object to this property sets the corresponding shadow-related properties on the view’s layer.
    /// 
    /// If the view does not have a layer, setting the value of this property has no effect.
    public var shadow: NSShadow?

    // MARK: - Layout
    // MARK: - Managing the view’s content
    // MARK: - Respecting the View’s Safe Area

    /// A rectangle in the view’s coordinate system that contains the unobscured portion of the view.
    /// 
    /// The safe area of a view reflects the area not covered by navigation bars, tab bars, toolbars, and other ancestor views that might obscure the current view. 
    /// Draw content inside this rectangle to ensure it isn’t covered by other content.
    public var safeAreaRect: NSRect = .zero

    /// The distances from the edges of your view that define the safe area.
    /// 
    /// A view’s safe area reflects the portion of the view not covered by the window’s title bar or any ancestor views. 
    /// This property reflects the superview’s safe area plus any additional insets you specify in the additionalSafeAreaInsets property. 
    /// If the view is not currently installed in a view hierarchy, or is not yet visible onscreen, the insets in this property are 0.
    public var safeAreaInsets: NSEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)

    /// Custom insets that you specify to modify your view’s safe area.
    /// 
    /// Use this property to adjust the safe area insets of your view by the specified amount. 
    /// The safe area defines the portion of your view’s visible area that is guaranteed to be unobscured by the bars or other ancestor-provided views.
    /// 
    /// You might use this property if your view contains content that obscures its subviews. 
    /// For example, a view that draws a custom tool palette might extend the safe area to prevent subviews from displaying their content underneath the palette.
    public var additionalSafeAreaInsets: NSEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)

    /// The layout guide you use to position content inside your view’s safe area.
    /// 
    /// The layout guide in this property reflects the view’s frame minus its safe area insets. 
    /// Use this guide to configure layout rules relative to this safe area.
    public var safeAreaLayoutGuide: NSLayoutGuide
}

extension NSView {
    /// These constants specify the location of the layer content when the content is not rerendered in response to view resizing. 
    /// For more information, see the ``layerContentsPlacement`` property.
    @MainActor public enum LayerContentsPlacement: Sendable {
        /// The content is resized to fit the entire bounds rectangle.
        case scaleAxesIndependently

        /// The content is resized to fit the bounds rectangle, preserving the aspect of the content. If the content does not completely fill the bounds rectangle, the content is centered in the partial axis.
        case scaleProportionallyToFit

        /// The content is resized to completely fill the bounds rectangle, while still preserving the aspect of the content. The content is centered in the axis it exceeds.
        case scaleProportionallyToFill

        /// The content is horizontally and vertically centered in the bounds rectangle.
        case center

        /// The content is horizontally centered at the top-edge of the bounds rectangle.
        case top

        /// The content is positioned in the top-right corner of the bounds rectangle.
        case topRight

        /// The content is vertically centered at the right-edge of the bounds rectangle.
        case right

        /// The content is positioned in the bottom-right corner of the bounds rectangle.
        case bottomRight

        /// The content is horizontally centered at the bottom-edge of the bounds rectangle.
        case bottom

        /// The content is positioned in the bottom-left corner of the bounds rectangle.
        case bottomLeft

        /// The content is vertically centered at the left-edge of the bounds rectangle.
        case left

        /// The content is positioned in the top-left corner of the bounds rectangle.
        case topLeft  
    }
}

extension NSView {
    /// Constants that specify how layer resizing is handled when a view is layer-backed or layer-hosting. 
    /// For more information, see the ``layerContentsRedrawPolicy`` property.
    @MainActor public enum LayerContentsRedrawPolicy: Sendable {
        /// Leave the layer's contents alone. Never mark the layer as needing display, or draw the view's contents to the layer. This is how developer created layers (layer-hosting views) are treated.
        case never

        /// Any of the setNeedsDisplay methods sent to the view will cause the view redraw the affected layer parts by invoking the view's draw(_:), but neither the layer or the view are marked as needing display when the view's size changes.
        case onSetNeedsDisplay

        /// Resize the view’s backing-layer and redraw the view to the layer when the view's size changes. If the resize is animated, AppKit will drive the resize animation itself and will do this resize and redraw at each step of the animation. Affected parts of the layer will also be redrawn when the view is marked as needing display. This mode is a superset of NSView.LayerContentsRedrawPolicy.onSetNeedsDisplay. This is the way that layer-backed views are currently treated.
        case duringViewResize

        /// Resize the layer and redraw the view to the layer when the view's size changes. This will be done just once at the beginning of a resize animation, not at each frame of the animation. Affected parts of the layer will also be redrawn when the view is marked as needing display. This mode is a superset of NSView.LayerContentsRedrawPolicy.onSetNeedsDisplay.
        case beforeViewResize

        /// Redraw the layer contents at the new size and crossfade from the old contents to the new contents. Use this in conjunction with the NSView.LayerContentsPlacement constants to get a nice crossfade animation for complex layer-backed views that cannot update correctly at each step of the animation.
        case crossfade        
    }
}