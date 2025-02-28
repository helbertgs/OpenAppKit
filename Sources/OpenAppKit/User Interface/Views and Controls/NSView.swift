import OpenCoreAnimation
import OpenCoreImage
import OpenCoreGraphics
import Foundation

/// The infrastructure for drawing, printing, and handling events in an app.
@MainActor open class NSView: NSResponder {

    // MARK: - Creating a view object

    /// Initializes and returns a newly allocated NSView object with a specified frame rectangle.
    /// 
    /// Insert the view into your window’s view hieararchy before you can do anything with it. 
    /// This method is the designated initializer for the NSView class.
    /// - Parameter frame: The frame rectangle for the created view object.
    public init(frame: OpenCoreGraphics.CGRect) {
        self.frame = frame
        super.init()

        if wantsLayer {
            layer = makeBackingLayer()
            layer?.delegate = self

            layer?.backgroundColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
            layer?.borderWidth = 2
            layer?.borderColor = CGColor(red: 0, green: 1, blue: 0, alpha: 1)
        }
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
        print("\(Self.self).\(#function)")

        aView.removeFromSuperview()
        viewWillMove(toSuperview: self)

        aView.nextResponder = self
        subviews.append(aView)
        didAddSubview(aView)
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
        print("\(Self.self).\(#function)")
        
        willRemoveSubview(self)
        nextResponder = nil
        superview?.subviews.removeAll { $0 === self }
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
        print("\(Self.self).\(#function)")
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
        print("\(Self.self).\(#function)")
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
        print("\(Self.self).\(#function)")
    }

    // MARK: - Identifying Views by Tag

    /// Returns the view’s nearest descendant (including itself) with a specific tag, or nil if no subview has that tag.
    /// - Parameter tag: An integer identifier associated with a view object.
    public func viewWithTag(_ tag: Int) -> NSView? {
        print("\(Self.self).\(#function)")

        guard self.tag == tag else { 
            return subviews.first { $0.tag == tag }
        }

        return self
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
    public var frame: OpenCoreGraphics.CGRect {
        didSet {
            if postsFrameChangedNotifications {
                NotificationCenter.default.post(name: Self.frameDidChangeNotification, object: self)
            }
        }
    }

    /// Sets the origin of the view’s frame rectangle to the specified point, effectively repositioning it within its superview.
    /// 
    /// Changing the frame does not mark the view as needing to be displayed. 
    /// Set the ``needsDisplay`` property to true when you want the view to be redisplayed.
    /// 
    /// Changing the frame origin results in the posting of an ``frameDidChangeNotification`` to the default notification center if the view is configured to do so.
    /// - Parameter newOrigin: The point that is the new origin of the view's frame.
    public func setFrameOrigin(_ newOrigin: OpenCoreGraphics.CGPoint) {
        self.frame.origin = newOrigin
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
    /// - Parameter newSize: An OpenCoreGraphics.CGSize structure specifying the new height and width of the frame rectangle.
    public func setFrameSize(_ newSize: OpenCoreGraphics.CGSize) {
        self.frame.size = newSize
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
    public  var bounds: OpenCoreGraphics.CGRect = .zero {
        didSet {
            if postsBoundsChangedNotifications {
                NotificationCenter.default.post(name: Self.boundsDidChangeNotification, object: self)
            }
        }
    }

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
    public func setBoundsOrigin(_ newOrigin: OpenCoreGraphics.CGPoint) {
        self.bounds.origin = newOrigin
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
    /// - Parameter newSize: An OpenCoreGraphics.CGSize structure specifying the new width and height of the view's bounds rectangle.
    public func setBoundsSize(_ newSize: OpenCoreGraphics.CGSize) {
        self.bounds.size = newSize
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
    public func translateOrigin(to translation: OpenCoreGraphics.CGPoint) {
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
    /// - Parameter newUnitSize: An OpenCoreGraphics.CGSize structure specifying the new unit size.
    public func scaleUnitSquare(to newUnitSize: OpenCoreGraphics.CGSize) {
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
    public func backingAlignedRect(_ rect: OpenCoreGraphics.CGRect, options: AlignmentOptions = []) -> OpenCoreGraphics.CGRect {
        fatalError("not implemented yet")
    }

    /// Converts a point from its pixel aligned backing store coordinate system to the view’s interior coordinate system.
    /// - Parameter point: The point in the pixel backing store aligned coordinate system.
    /// - Returns: A point in the view’s interior coordinate system.
    public func convertFromBacking(_ point: OpenCoreGraphics.CGPoint) -> OpenCoreGraphics.CGPoint {
        fatalError("not implemented yet")
    }

    /// Converts a point from the view’s interior coordinate system to its pixel aligned backing store coordinate system.
    /// - Parameter point: The point in the view’s interior coordinate system.
    /// - Returns: A point in its pixel aligned backing store coordinate system.
    public func convertToBacking(_ point: OpenCoreGraphics.CGPoint) -> OpenCoreGraphics.CGPoint {
        fatalError("not implemented yet")
    }

    /// Convert the point from the layer’s interior coordinate system to the view’s interior coordinate system.
    /// 
    /// The layer’s space is virtual, and doesn’t take into account the layer’s ``contentsScale`` setting.
    /// - Parameter point: The point in the layer’s interior coordinate system.
    /// - Returns: The point in the view’s interior coordinate system.
    public func convertFromLayer(_ point: OpenCoreGraphics.CGPoint) -> OpenCoreGraphics.CGPoint {
        fatalError("not implemented yet")
    }

    /// Convert the size from the view’s interior coordinate system to the layer’s interior coordinate system.
    /// 
    /// The layer’s space is virtual, and doesn’t take into account the layer’s ``contentsScale`` setting.
    /// - Parameter point: A point in the view’s interior coordinate system.
    /// - Returns: A point in the view’s layer interior coordinate system.
    public func convertToLayer(_ point: OpenCoreGraphics.CGPoint) -> OpenCoreGraphics.CGPoint {
        fatalError("not implemented yet")
    }

    /// Converts a rectangle from its pixel aligned backing store coordinate system to the view’s interior coordinate system.
    /// - Parameter rect: The rectangle in the pixel backing store coordinate system.
    /// - Returns: A rectangle in the view’s interior coordinate system.
    public func convertFromBacking(_ rect: OpenCoreGraphics.CGRect) -> OpenCoreGraphics.CGRect {
        fatalError("not implemented yet")
    }

    /// Converts a rectangle from the view’s interior coordinate system to its pixel aligned backing store coordinate system.
    /// - Parameter rect: A rectangle in the view’s interior coordinate system.
    /// - Returns: A rectangle in its pixel aligned backing store coordinate system.
    public func convertToBacking(_ rect: OpenCoreGraphics.CGRect) -> OpenCoreGraphics.CGRect {
        fatalError("not implemented yet")
    }

    /// Convert the rectangle from the layer’s interior coordinate system to the view’s interior coordinate system.
    /// 
    /// The layer’s space is virtual, and doesn’t take into account the layer’s ``contentsScale`` setting.
    /// - Parameter rect: A rectangle in the layer’s interior coordinate system.
    /// - Returns: A rectangle in the view’s interior coordinate system.
    public func convertFromLayer(_ rect: OpenCoreGraphics.CGRect) -> OpenCoreGraphics.CGRect {
        fatalError("not implemented yet")
    }

    /// Convert the size from the view’s interior coordinate system to the layer’s interior coordinate system.
    /// 
    /// The layer’s space is virtual, and doesn’t take into account the layer’s ``contentsScale`` setting.
    /// - Parameter rect: A rectangle in the view’s interior coordinate system.
    /// - Returns: A rectangle in the layer's interior coordinate system.
    public func convertToLayer(_ rect: OpenCoreGraphics.CGRect) -> OpenCoreGraphics.CGRect {
        fatalError("not implemented yet")
    }

    /// Converts a size from its pixel aligned backing store coordinate system to the view’s interior coordinate system.
    /// - Parameter size: The size in the pixel aligned coordinate system.
    /// - Returns: The size in the view’s interior coordinate system.
    public func convertFromBacking(_ size: OpenCoreGraphics.CGSize) -> OpenCoreGraphics.CGSize {
        fatalError("not implemented yet")
    }

    /// Converts a size from the view’s interior coordinate system to its pixel aligned backing store coordinate system.
    /// - Parameter size: The size in the view’s interior coordinate system.
    /// - Returns: The size in the pixel aligned coordinate system.
    public func convertToBacking(_ size: OpenCoreGraphics.CGSize) -> OpenCoreGraphics.CGSize {
        fatalError("not implemented yet")
    }

    /// Convert the size from the layer’s interior coordinate system to the view’s interior coordinate system.
    /// 
    /// The layer’s space is virtual, and doesn’t take into account the layer’s ``contentsScale`` setting.
    /// The returned OpenCoreGraphics.CGSize values are always forced to have positive a width and height.
    /// - Parameter size: A size in the layer’s interior coordinate system.
    /// - Returns: A size in the view’s interior coordinate system.
    public func convertFromLayer(_ size: OpenCoreGraphics.CGSize) -> OpenCoreGraphics.CGSize {
        fatalError("not implemented yet")
    }

    /// Convert the size from the view’s interior coordinate system to the layer’s interior coordinate system.
    /// 
    /// The layer’s space is virtual, and doesn’t take into account the layer’s ``contentsScale`` setting.
    /// The returned OpenCoreGraphics.CGSize values are always forced to have positive a width and height.
    /// - Parameter size: A size in the view’s interior coordinate system.
    /// - Returns: A size in the layer's interior coordinate system.
    public func convertToLayer(_ size: OpenCoreGraphics.CGSize) -> OpenCoreGraphics.CGSize {
        fatalError("not implemented yet")
    }

    /// Converts a point from the coordinate system of a given view to that of the view.
    /// - Parameters:
    ///   - point: A point specifying a location in the coordinate system of view.
    ///   - view: The view with point in its coordinate system. Both view and the view must belong to the same ``NSWindow`` object, and that window must not be nil. If view is nil, this method converts from window coordinates instead.
    /// - Returns: The point converted to the coordinate system of the view.
    public func convert(_ point: OpenCoreGraphics.CGPoint, from view: NSView?) -> OpenCoreGraphics.CGPoint {
        fatalError("not implemented yet")
    }

    /// Converts a point from the view’s coordinate system to that of a given view.
    /// - Parameters:
    ///   - point: A point specifying a location in the coordinate system of the view.
    ///   - view: The view into whose coordinate system point is to be converted. Both view and the view must belong to the same ``NSWindow`` object, and that window must not be nil. If view is nil, this method converts to window coordinates instead.
    /// - Returns: The point converted to the coordinate system of view.
    public func convert(_ point: OpenCoreGraphics.CGPoint, to view: NSView?) -> OpenCoreGraphics.CGPoint {
        fatalError("not implemented yet")
    }

    /// Converts a size from another view’s coordinate system to that of the view.
    /// 
    /// The returned ``OpenCoreGraphics.CGSize`` values are always forced to have positive a width and height.
    /// You can also use this method to get a view’s current magnification or zoom level, if it’s been changed from the default scale. 
    /// Specifically, if you convert a known size from the window’s base coordinate space to that of view, the result is the current zoom level.
    /// - Parameters:
    ///   - size: The size (width and height) in view’s coordinate system.
    ///   - view: The view with size in its coordinate system. Both view and the view must belong to the same ``NSWindow`` object, and that window must not be nil. If view is nil, this method converts from window coordinates instead.
    /// - Returns: The converted size, as an ``OpenCoreGraphics.CGSize`` structure.
    public func convert(_ size: OpenCoreGraphics.CGSize, from view: NSView?) -> OpenCoreGraphics.CGSize {
        fatalError("not implemented yet")
    }

    /// Converts a size from the view’s coordinate system to that of another view.
    /// 
    /// The returned ``OpenCoreGraphics.CGSize`` values are always forced to have positive a width and height.
    /// - Parameters:
    ///   - size: The size (width and height) in the view’s coordinate system.
    ///   - view: The view that’s the target of the conversion operation. Both view and the view must belong to the same ``NSWindow`` object, and that window must not be nil. If view is nil, this method converts to window coordinates instead.
    /// - Returns: The converted size, as an ``OpenCoreGraphics.CGSize`` structure.
    public func convert(_ size: OpenCoreGraphics.CGSize, to view: NSView?) -> OpenCoreGraphics.CGSize {
        fatalError("not implemented yet")
    }

    /// Converts a rectangle from the coordinate system of another view to that of the view.
    /// - Parameters:
    ///   - rect: The rectangle in the view coordinate system.
    ///   - view: The view with rect in its coordinate system. Both view and the view must belong to the same ``NSWindow`` object, and that window must not be nil. If view is nil, this method converts from window coordinates instead.
    /// - Returns: The converted rectangle.
    public func convert(_ rect: OpenCoreGraphics.CGRect, from view: NSView?) -> OpenCoreGraphics.CGRect {
        fatalError("not implemented yet")
    }

    /// Converts a rectangle from the view’s coordinate system to that of another view.
    /// - Parameters:
    ///   - rect: A rectangle in the view’s coordinate system.
    ///   - view: The view that’s the target of the conversion operation. Both view and the view must belong to the same ``NSWindow`` object, and that window must not be nil. If view is nil, this method converts the rectangle to window coordinates instead.
    /// - Returns: The converted rectangle.
    public func convert(_ rect: OpenCoreGraphics.CGRect, to view: NSView?) -> OpenCoreGraphics.CGRect {
        fatalError("not implemented yet")
    }

    /// Converts the corners of a specified rectangle to lie on the center of device pixels, which is useful in compensating for rendering overscanning when the coordinate system has been scaled.
    /// 
    /// This method converts the given rectangle to device coordinates, adjusts the rectangle to lie in the center of the pixels, and converts the resulting rectangle back to the view’s coordinate system. 
    /// Note that this method does not take into account any transformations performed using the NSAffineTransform class or Quartz 2D routines.
    /// - Parameter rect: The rectangle whose corners are to be converted.
    /// - Returns: The adjusted rectangle.
    public func centerScanRect(_ rect: OpenCoreGraphics.CGRect) -> OpenCoreGraphics.CGRect {
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
    public var isHidden: Bool = false {
        didSet {
            oldValue == true ? viewDidHide() : viewDidUnhide()
        }
    }

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
        print("\(Self.self).\(#function)")
    }

    /// Invoked when the view is unhidden, either directly, or in response to an ancestor being unhidden
    /// 
    /// The view receives this message when its ``isHiddenOrHasHiddenAncestor`` state goes from true to false.  
    /// This can happen when the view or an ancestor is marked as not hidden, or when the view or an ancestor is removed from its containing view hierarchy.
    open func viewDidUnhide() {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Responding to Appearance Changes

    /// Informs the view that its effective appearance changed.
    open func viewDidChangeEffectiveAppearance() {
        print("\(Self.self).\(#function)")
    }

    /// Responds when the view’s backing store properties change.
    /// 
    /// The view gets this message when the backing store scale or color space changes. 
    /// Provide an implementation if you need to swap assets or make other adjustments when a view’s backing store properties change.
    open func viewDidChangeBackingProperties() {
        print("\(Self.self).\(#function)")
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
    public var focusRingMaskBounds: OpenCoreGraphics.CGRect = .zero

    /// Draws the focus ring mask for the view.
    /// 
    /// This method provides the shape of the focus ring mask by drawing the focus ring mask. 
    /// An implementation of this method should draw in the view’s interior (bounds) coordinate space, that the focus ring style has been set (it will be set it to ``NSFocusRingPlacement.only`` to capture the focus ring itself), and that the fill and stroke colors have been set to an arbitrary fully opaque color.
    /// Subclasses that find the default behavior insufficient should only draw the focus ring shape.
    /// The ``NSView`` implementation of this method simply fills self.bounds.
    public func drawFocusRingMask() {
        print("\(Self.self).\(#function)")
    }

    /// Invoked to notify the view that the focus ring mask requires updating.
    /// 
    /// It is important to note that it is only necessary for developers to invoke this method when some internal state change of their application, that AppKit can’t determine, affects the shape of the focus ring mask.
    /// It is assumed that if the view is marked as needing display, or is resized, its focus ring shape is likely to have changed, and there is no need for clients to explicitly send this message in such cases, they are handled automatically.
    /// If, however, a view is showing a focus ring around some part of its content (an NSImage, perhaps), and that content changes, the client must provide notification by invoking this method so that focusRingMaskBounds and drawFocusRingMask() will be invoked to redraw the focus ring.
    public func noteFocusRingMaskChanged() {
        print("\(Self.self).\(#function)")
    }

    /// Invalidates the area around the focus ring.
    /// - Parameter rect: The rectangle of the control or cell defining the area around the focus ring. rect will be expanded to include the focus ring for invalidation.
    public func setKeyboardFocusRingNeedsDisplay(_ rect: OpenCoreGraphics.CGRect) {
        print("\(Self.self).\(#function)")
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
    /// Thus, the view and all of its subviews (including subviews of subviews) become layer-backed. 
    /// The default value of this property is false.
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
    public private(set) var wantsUpdateLayer: Bool = true

    /// The Core Animation layer that the view uses as its backing store.
    /// 
    /// Use this property to set or get the layer associated with the view, if any. 
    /// When set, the layer serves as the backing store for the view’s contents.
    public var layer: CALayer?

    /// Creates the view’s backing layer.
    /// - Returns: The layer to use as the view’s backing layer.
    open func makeBackingLayer() -> CALayer {
        print("\(Self.self).\(#function)")
        let layer = CALayer()
        layer.contents = NSImage(size: frame.size)
        layer.delegate = self

        return layer
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
    public var safeAreaRect: OpenCoreGraphics.CGRect = .zero

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
    public var safeAreaLayoutGuide: NSLayoutGuide = .init()
    
    // MARK: - Managing the Content Layout Direction

    /// The layout direction for content in the view.
    /// 
    /// Different languages support different directions for laying out content. 
    /// While many languages support left-to-right layout, some support right-to-left layout. 
    /// This property contains the preferred layout direction employed by the view. 
    /// It is the responsibility of the view to respect this value and lay out its content appropriately.
    /// 
    /// In macOS 10.9 and later, if no layout direction is set explicitly, this property contains the value reported by the app’s userInterfaceLayoutDirection property. 
    /// In prior versions of macOS, it returns the value NSUserInterfaceLayoutDirection.leftToRight by default. 
    /// Certain AppKit subclasses, such as NSOutlineView, respect the value returned by this method and adjust their layout accordingly.
    public var userInterfaceLayoutDirection: NSUserInterfaceLayoutDirection = .leftToRight

    // MARK: - Opting In to Auto Layout

    /// Returns a Boolean value indicating whether the view depends on the constraint-based layout system.
    /// 
    /// ``true`` if the view must be in a window using constraint-based layout to function properly, ``false`` otherwise.
    /// Custom views should override this to return true if they can not layout correctly using autoresizing.
    public static var requiresConstraintBasedLayout: Bool = false

    /// A Boolean value indicating whether the view’s autoresizing mask is translated into constraints for the constraint-based layout system.
    /// 
    /// When this property is set to true, the view’s superview looks at the view’s autoresizing mask, produces constraints that implement it, and adds those constraints to itself (the superview). 
    /// If your view has flexible constraints that require dynamic adjustment, set this property to false and apply the constraints yourself.
    public var translatesAutoresizingMaskIntoConstraints: Bool = false

    // MARK: - Creating Constraints Using Layout Anchors

    /// A layout anchor representing the bottom edge of the view’s frame.
    /// 
    /// Use this anchor to create constraints with the view’s bottom edge. 
    /// You can only combine this anchor with other NSLayoutYAxisAnchor anchors. For more information, see NSLayoutAnchor.
    public var bottomAnchor: NSLayoutYAxisAnchor {
        fatalError("Not implemented yet")
    }

    /// A layout anchor representing the horizontal center of the view’s frame.
    /// 
    /// Use this anchor to create constraints with the view’s horizontal center. 
    /// You can only combine this anchor with other NSLayoutXAxisAnchor anchors. For more information, see NSLayoutAnchor.
    public var centerXAnchor: NSLayoutXAxisAnchor {
        fatalError("Not implemented yet")
    }

    /// A layout anchor representing the vertical center of the view’s frame.
    /// 
    /// Use this anchor to create constraints with the view’s vertical center. 
    /// You can only combine this anchor with other NSLayoutYAxisAnchor anchors. For more information, see NSLayoutAnchor.
    public var centerYAnchor: NSLayoutYAxisAnchor {
        fatalError("Not implemented yet")
    }

    /// A layout anchor representing the baseline for the topmost line of text in the view.
    /// 
    /// For views with multiple lines of text, this anchor represents the baseline of the top row of text. 
    /// Use this anchor to create constraints with this baseline. 
    /// You can only combine this anchor with other NSLayoutYAxisAnchor anchors. For more information, see NSLayoutAnchor.
    public var firstBaselineAnchor: NSLayoutYAxisAnchor {
        fatalError("Not implemented yet")
    }

    /// A layout anchor representing the height of the view’s frame.
    /// 
    /// Use this anchor to create constraints with the view’s height. 
    /// You can only combine this anchor with other NSLayoutDimension anchors. For more information, see NSLayoutAnchor.
    public var heightAnchor: NSLayoutDimension {
        fatalError("Not implemented yet")
    }

    /// A layout anchor representing the baseline for the bottommost line of text in the view.
    /// 
    /// For views with multiple lines of text, this anchor represents the baseline of the bottom row of text. 
    /// Use this anchor to create constraints with this baseline. 
    /// You can only combine this anchor with other NSLayoutYAxisAnchor anchors. For more information, see NSLayoutAnchor.
    public var lastBaselineAnchor: NSLayoutYAxisAnchor {
        fatalError("Not implemented yet")
    }

    /// A layout anchor representing the leading edge of the view’s frame.
    /// 
    /// Use this anchor to create constraints with the view’s leading edge. 
    /// You can only combine this anchor with a subset of the NSLayoutXAxisAnchor anchors. 
    /// You can combine a leadingAnchor with another leadingAnchor, a trailingAnchor, or a centerXAnchor. For more information, see NSLayoutAnchor.
    public var leadingAnchor: NSLayoutXAxisAnchor {
        fatalError("Not implemented yet")
    }

    /// A layout anchor representing the left edge of the view’s frame.
    /// 
    /// Use this anchor to create constraints with the view’s left edge. 
    /// You can only combine this anchor with a subset of the NSLayoutXAxisAnchor anchors. 
    /// You can combine a leftAnchor with another leftAnchor, a rightAnchor, or a centerXAnchor. For more information, see NSLayoutAnchor.
    public var leftAnchor: NSLayoutXAxisAnchor {
        fatalError("Not implemented yet")
    }

    /// A layout anchor representing the right edge of the view’s frame.
    /// 
    /// Use this anchor to create constraints with the view’s right edge. 
    /// You can only combine this anchor with a subset of the NSLayoutXAxisAnchor anchors. 
    /// You can combine a rightAnchor with another rightAnchor, a leftAnchor, or a centerXAnchor. For more information, see NSLayoutAnchor.
    public var rightAnchor: NSLayoutXAxisAnchor {
        fatalError("Not implemented yet")
    }

    /// A layout anchor representing the top edge of the view’s frame.
    /// 
    /// Use this anchor to create constraints with the view’s top edge. 
    /// You can only combine this anchor with other NSLayoutYAxisAnchor anchors. For more information, see NSLayoutAnchor.
    public var topAnchor: NSLayoutYAxisAnchor {
        fatalError("Not implemented yet")
    }

    /// A layout anchor representing the trailing edge of the view’s frame.
    /// 
    /// Use this anchor to create constraints with the view’s trailing edge. 
    /// You can only combine this anchor with a subset of the NSLayoutXAxisAnchor anchors. 
    /// You can combine a trailingAnchor with another trailingAnchor, a leadingAnchor, or a centerXAnchor. For more information, see NSLayoutAnchor.
    public var trailingAnchor: NSLayoutXAxisAnchor {
        fatalError("Not implemented yet")
    }

    /// A layout anchor representing the width of the view’s frame.
    /// 
    /// Use this anchor to create constraints with the view’s width. 
    /// You can only combine this anchor with other NSLayoutDimension anchors. For more information, see NSLayoutAnchor.
    public var widthAnchor: NSLayoutDimension {
        fatalError("Not implemented yet")
    }

    // MARK: - Managing the View’s Constraints
    
    /// Returns the constraints held by the view.
    public private(set) var constraints: [NSLayoutConstraint] = []

    /// Adds a constraint on the layout of the receiving view or its subviews.
    ///
    /// The constraint must involve only views that are within scope of the receiving view.
    /// Specifically, any views involved must be either the receiving view itself, or a subview of the receiving view.
    /// Constraints that are added to a view are said to be held by that view.
    /// The coordinate system used when evaluating the constraint is the coordinate system of the view that holds the constraint.
    /// - Parameter constraint: The constraint to be added to the view. The constraint may only reference the view itself or its subviews.
    public func addConstraint(_ constraint: NSLayoutConstraint) {
        constraints.append(constraint)
    }
    
    /// Adds multiple constraints on the layout of the receiving view or its subviews.
    ///
    /// All constraints must involve only views that are within scope of the receiving view.
    /// Specifically, any views involved must be either the receiving view itself, or a subview of the receiving view.
    /// Constraints that are added to a view are said to be held by that view.
    /// The coordinate system used when evaluating each constraint is the coordinate system of the view that holds the constraint.
    /// - Parameter constraints: An array of constraints to be added to the view. All constraints may only reference the view itself or its subviews.
    public func addConstraints(_ constraints: [NSLayoutConstraint]) {
        constraints.forEach { 
            addConstraint($0) 
        }
    }
    
    /// Removes the specified constraint from the view.
    /// - Parameter constraint: The constraint to remove. Removing a constraint not held by the view has no effect.
    public func removeConstraint(_ constraint: NSLayoutConstraint) {
        constraints.removeAll { $0 == constraint }
    }
    
    /// Removes the specified constraints from the view.
    /// - Parameter constraints: The constraints to remove.
    public func removeConstraints(_ constraints: [NSLayoutConstraint]) {
        constraints.forEach { 
            removeConstraint($0) 
        }
    }

    // MARK: - Measuring in Auto Layout

    /// The minimum size of the view that satisfies the constraints it holds.
    ///
    /// OpenAppKit sets this property to the best size available for the view, considering all of the constraints it and its subviews hold and satisfying a preference to make the view as small as possible.
    /// The size values in this property are never negative.
    public var fittingSize: OpenCoreGraphics.CGSize = .zero

    /// The natural size for the receiving view, considering only properties of the view itself.
    ///
    /// The default width and height values of this property are set to noIntrinsicMetric.
    /// For a custom view, you can override this property and use it to communicate what size you would like your view to be based on its content.
    /// You might do this in cases where the layout system cannot determine the size of the view based solely on its current constraints.
    /// For example, a text field might override this method and return an intrinsic size based on the text it contains.
    /// The intrinsic size you supply must be independent of the content frame, because there’s no way to dynamically communicate a changed width to the layout system based on a changed height.
    /// If your custom view has no intrinsic size for a given dimension, you can set the corresponding dimension to the noIntrinsicMetric.
    public var intrinsicContentSize: OpenCoreGraphics.CGSize = .zero
    
    /// Invalidates the view’s intrinsic content size.
    ///
    /// Call this when something changes in your custom view that invalidates its intrinsic content size.
    /// This allows the constraint-based layout system to take the new intrinsic content size into account in its next layout pass.
    public func invalidateIntrinsicContentSize() {
        fatalError("Not implemented yet")
    }
    
    /// Returns the priority with which a view resists being made smaller than its intrinsic size.
    ///
    /// The constraint-based layout system uses these priorities when determining the best layout for views that are encountering constraints that would require them to be smaller than their intrinsic size.
    ///  Subclasses should not override this method. Instead, custom views should set default values for their content on creation, typically to ``defaultLow`` or ``defaultHigh``.
    /// - Parameter orientation: The orientation of the dimension of the view that might be reduced.
    /// - Returns: The priority with which the view should resist being compressed from its intrinsic size in the specified orientation.
    public func contentCompressionResistancePriority(for orientation: NSLayoutConstraint.Orientation) -> NSLayoutConstraint.Priority {
        fatalError("Not implemented yet")
    }
    
    /// Sets the priority with which a view resists being made smaller than its intrinsic size.
    ///
    /// Custom views should set default values for both orientations on creation, based on their content, typically to defaultLow or defaultHigh.
    /// When creating user interfaces, the layout designer can modify these priorities for specific views when the overall layout design requires different tradeoffs than the natural priorities of the views being used in the interface.
    /// Subclasses should not override this method.
    /// - Parameters:
    ///   - priority: The new priority.
    ///   - orientation: The orientation for which the compression resistance priority should be set.
    public func setContentCompressionResistancePriority(_ priority: NSLayoutConstraint.Priority, for orientation: NSLayoutConstraint.Orientation) {
        fatalError("Not implemented yet")
    }
    
    /// Returns the priority with which a view resists being made larger than its intrinsic size.
    ///
    /// The constraint-based layout system uses these priorities when determining the best layout for views that are encountering constraints that would require them to be larger than their intrinsic size.
    /// Subclasses should not override this method. Instead, custom views should set default values for their content on creation, typically to ``defaultLow`` or ``defaultHigh``.
    /// - Parameter orientation: The orientation of the dimension of the view that might be enlarged.
    /// - Returns: The priority with which the view should resist being enlarged from its intrinsic size in the specified orientation.
    public func contentHuggingPriority(for orientation: NSLayoutConstraint.Orientation) -> NSLayoutConstraint.Priority {
        fatalError("Not implemented yet")
    }
    
    /// Sets the priority with which a view resists being made larger than its intrinsic size.
    ///
    /// Custom views should set default values for both orientations on creation, based on their content, typically to ``defaultLow`` or ``defaultHigh``.
    /// When creating user interfaces, the layout designer can modify these priorities for specific views when the overall layout design requires different tradeoffs than the natural priorities of the views being used in the interface.
    /// Subclasses should not override this method.
    /// - Parameters:
    ///   - priority: The new priority.
    ///   - orientation: The orientation for which the content hugging priority should be set.
    public func setContentHuggingPriority(_ priority: NSLayoutConstraint.Priority, for orientation: NSLayoutConstraint.Orientation) {
        fatalError("Not implemented yet")
    }

    /// A value that tells the layout system to ignore the intrinsic size value for a given dimension.
    ///
    /// Specify this value if a view doesn’t have an intrinsic height or width.
    /// For example, a horizontal slider has an intrinsic height but might have no intrinsic width.
    public static let noIntrinsicMetric: Float = 0

    // MARK: - Managing Layout Guides
    
    /// The array of layout guide objects owned by this view.
    public private(set) var layoutGuides: [NSLayoutGuide] = []
    
    /// A layout guide that provides the recommended amount of padding for content inside of a view.
    ///
    /// To ensure you pad your view’s content by the correct amount, constrain against the anchors of the layout margins guide on all sides.
    /// The system automatically updates the guide when a view becomes the content view.
    ///
    /// For views that aren’t the content view, the layout margins guide is equivalent to the system’s standard spacing from the safe area.
    public var layoutMarginsGuide: NSLayoutGuide = .init()

    /// Adds the provided layout guide to the view.
    ///
    /// This method adds the provided layout guide to the end of the view’s layoutGuides array.
    /// It also assigns the view to the guide’s owningView property. Each guide can have only one owning view.
    /// After the guide has been added to a view, it can participate in Auto Layout constraints with that view’s hierarchy.
    /// - Parameter guide: The layout guide to be added.
    public func addLayoutGuide(_ guide: NSLayoutGuide) {
        layoutGuides.append(guide)
    }
    
    /// Removes the provided layout guide from the view.
    ///
    /// This method removes the provided layout guide from the view’s ``layoutGuides`` array.
    /// It also sets the guide’s ``owningView`` property to nil.
    /// Finally, it removes any constraints to the layout guide.
    ///
    /// Layout guides cannot participate in Auto Layout constraints unless they are added by a view in the view hierarchy.
    /// - Parameter guide: The layout guide to be removed.
    public func removeLayoutGuide(_ guide: NSLayoutGuide) {
        layoutGuides.removeAll { $0 == guide }
    }

    // MARK: - Aligning Views with Auto Layout

    /// The insets (in points) from the view’s frame that define its content rectangle.
    ///
    /// The default value is an ``NSEdgeInsets`` structure with the value 0 for each component.
    /// Custom views that draw ornamentation around their content can override this property and return insets that align with the edges of the content, excluding the ornamentation.
    /// This allows the constraint-based layout system to align views based on their content, rather than just their frame.
    ///
    /// Custom views whose content location can’t be expressed by a simple set of insets should override ``alignmentRect(forFrame:)`` and ``frame(forAlignmentRect:)`` to describe their custom transform between alignment rectangle and frame.
    public private(set) var alignmentRectInsets: NSEdgeInsets = .init()

    /// The distance (in points) between the bottom of the view’s alignment rectangle and its baseline.
    ///
    /// The default value of this property is 0.
    /// For views that contain text or other content whose layout benefits from having a custom baseline, you can override this property and provide the correct distance between the bottom of the view’s alignment rectangle and that baseline.
    public private(set) var baselineOffsetFromBottom: Float = 0

    /// The distance (in points) between the top of the view’s alignment rectangle and its topmost baseline.
    ///
    /// The default value of this property is 0.
    /// For views that contain text or other content whose layout benefits from having a custom baseline, you can override this property and provide the correct distance between the top of the view’s alignment rectangle and the baseline of the top row of text.
    public private(set) var firstBaselineOffsetFromTop: Float = 0

    /// The distance (in points) between the bottom of the view’s alignment rectangle and its bottommost baseline.
    ///
    /// The default value of this property is 0.
    /// For views that contain text or other content whose layout benefits from having a custom baseline, you can override this property and provide the correct distance between the bottom of the view’s alignment rectangle and the baseline of the bottom row of text.
    public private(set) var lastBaselineOffsetFromBottom: CGFloat = 0

    /// Returns the view’s alignment rectangle for a given frame.
    ///
    /// The constraint-based layout system uses alignment rectangles to align views, rather than their frame.
    /// This allows custom views to be aligned based on the location of their content while still having a frame that encompasses any ornamentation they need to draw around their content, such as shadows or reflections.
    ///
    /// The default implementation returns the view’s frame modified by the insets specified by the view’s ``alignmentRectInsets`` method.
    /// Most custom views can override ``alignmentRectInsets`` to specify the location of their content within their frame.
    /// Custom views that require arbitrary transformations can override ``alignmentRect(forFrame:) ``and ``frame(forAlignmentRect:)`` to describe the location of their content.
    /// These two methods must always be inverses of each other.
    /// - Parameter frame: The frame whose corresponding alignment rectangle is desired.
    /// - Returns: The alignment rectangle for the specified frame.
    public func alignmentRect(forFrame frame: OpenCoreGraphics.CGRect) -> OpenCoreGraphics.CGRect {
        print("\(Self.self).\(#function)")
        return .zero
    }
    
    /// Returns the view’s frame for a given alignment rectangle.
    ///
    /// The constraint-based layout system uses alignment rectangles to align views, rather than their frame.
    /// This allows custom views to be aligned based on the location of their content while still having a frame that encompasses any ornamentation they need to draw around their content, such as shadows or reflections.
    ///
    /// The default implementation returns ``alignmentRect`` modified by the insets specified by the view’s ``alignmentRectInsets`` method.
    /// Most custom views can override ``alignmentRectInsets`` to specify the location of their content within their frame.
    /// Custom views that require arbitrary transformations can override ``alignmentRect(forFrame:)`` and ``frame(forAlignmentRect:)`` to describe the location of their content.
    /// These two methods must always be inverses of each other.
    /// - Parameter alignmentRect: The alignment rectangle whose corresponding frame is desired.
    /// - Returns: The frame for the specified alignment rectangle
    public func frame(forAlignmentRect alignmentRect: OpenCoreGraphics.CGRect) -> OpenCoreGraphics.CGRect {
        print("\(Self.self).\(#function)")
        return .zero
    }

    // MARK: - Triggering Auto Layout

    /// A Boolean value indicating whether the view needs a layout pass before it can be drawn.
    ///
    /// true if the view needs a layout pass, false otherwise.
    ///
    /// You only ever need to change the value of this property if your view implements the ``layout()`` method because it has custom layout that is not expressible in the constraint-based layout system.
    /// Setting this property to true lets the system know that the view’s layout needs to be updated before it is drawn.
    /// The system checks the value of this property prior to applying constraint-based layout rules for the view.
    public var needsLayout: Bool = false
    
    /// Perform layout in concert with the constraint-based layout system.
    ///
    /// Override this method if your custom view needs to perform custom layout not expressible using the constraint-based layout system.
    /// In this case you are responsible for setting needsLayout to true when something that impacts your custom layout changes.
    ///
    /// You may not invalidate any constraints as part of your layout phase, nor invalidate the layout of your superview or views outside of your view hierarchy.
    /// You also may not invoke a drawing pass as part of layout.
    ///
    /// You must call ``super.layout()`` as part of your implementation.
    public func layout() {
        print("\(Self.self).\(#function)")
    }
    
    /// Updates the layout of the receiving view and its subviews based on the current views and constraints.
    ///
    /// Before displaying a view that uses constraints-based layout the system invokes this method to ensure that the layout of the view and its subviews is up to date.
    /// This method updates the layout if needed, first invoking ``updateConstraintsForSubtreeIfNeeded()`` to ensure that all constraints are up to date.
    /// This method is called automatically by the system, but may be invoked manually if you need to examine the most up to date layout.
    ///
    /// Subclasses should not override this method.
    public func layoutSubtreeIfNeeded() {
        print("\(Self.self).\(#function)")
        if needsLayout {
            layout()
        }
    }
    
    /// A Boolean value indicating whether the view’s constraints need to be updated.
    ///
    /// When a property of your view changes in a way that would impact constraints, set the value of this property to ``true`` to indicate that the constraints need to be updated at some point in the future.
    /// The next time the layout process happens, the constraint-based layout system uses the value of this property to determine whether it needs to call ``updateConstraints()`` on the view. Use this as an optimization tool to batch constraint changes.
    /// Updating constraints all at once just before they are needed ensures that you don’t needlessly recalculate constraints when multiple changes are made to your view in between layout passes.
    public var needsUpdateConstraints: Bool = false
    
    /// Update constraints for the view.
    ///
    /// Override this method to optimize changes to your constraints.
    ///
    /// It is almost always cleaner and easier to update a constraint immediately after the affecting change has occurred.
    /// For example, if you want to change a constraint in response to a button press, make that change directly in the button’s action method.
    /// You should only override this method when changing constraints in place is too slow, or when a view is producing a number of redundant changes.
    ///
    /// To schedule a change, set the view’s ``needsUpdateConstraints`` property to ``true``.
    /// The system then calls your implementation of ``updateConstraints()`` before the layout occurs.
    /// This lets you verify that all necessary constraints for your content are in place at a time when your custom view’s properties are not changing.
    ///
    /// Your implementation must be as efficient as possible.
    /// Do not deactivate all your constraints, then reactivate the ones you need.
    /// Instead, your app must have some way of tracking your constraints, and validating them during each update pass.
    /// Only change items that need to be changed.
    /// During each update pass, you must ensure that you have the appropriate constraints for the app’s current state.
    ///
    /// Do not set the ``needsUpdateConstraints`` property inside your implementation.
    /// Setting ``needsUpdateConstraints`` to true schedules another update pass, creating a feedback loop.
    ///
    /// Call ``super.updateConstraints()`` as the final step in your implementation.
    public func updateConstraints() {
        print("\(Self.self).\(#function)")
    }
    
    /// Updates the constraints for the receiving view and its subviews.
    ///
    /// Whenever a new layout pass is triggered for a view, the system invokes this method to ensure that any constraints for the view and its subviews are updated with information from the current view hierarchy and its constraints.
    /// This method is called automatically by the system, but may be invoked manually if you need to examine the most up to date constraints.
    ///
    /// Subclasses should not override this method.
    public func updateConstraintsForSubtreeIfNeeded() {
        print("\(Self.self).\(#function)")
        if needsUpdateConstraints {
            updateConstraints()
        }
    }

    // MARK: - Enabling and Disabling Constraints


    /// A Boolean value that indicates whether the view’s horizontal size constraints are active.
    ///
    ///  Setting this property to ``false`` lets Auto Layout optimize layout operations by ignoring the view’s intrinsic content size.
    ///  The default value of this property is ``true``, which causes the system to take the view’s content size into account.
    public var isHorizontalContentSizeConstraintActive: Bool = true
    
    /// A Boolean value that indicates whether the view’s vertical size constraints are active.
    ///
    /// Setting this property to ``false`` lets Auto Layout optimize layout operations by ignoring the view’s intrinsic content size.
    /// The default value of this property is ``true``, which causes the system to take the view’s content size into account.
    public var isVerticalContentSizeConstraintActive: Bool = true

    // MARK: - Debugging Auto Layout
    
    /// A Boolean value indicating whether the constraints impacting the layout of the view incompletely specify the location of the view.
    ///
    /// The value of this property is ``true`` when the view’s location or size cannot be determined definitively based on the current constraints.
    ///
    /// Accessing this property engages the layout engine to determine whether any other frame would also satisfy the constraints on the view.
    /// Because this process involves laying out the view, accessing the property can be an expensive operation but it can also provide useful debugging information.
    /// OpenAppKit automatically calls this method when a window is asked to visualize its constraints using the ``visualizeConstraints(_:)`` method.
    public private(set) var hasAmbiguousLayout: Bool = false

    /// Returns the constraints impacting the layout of the view for a given orientation.
    ///
    /// The returned set of constraints may not all include the view explicitly.
    /// Constraints that impact the location of the view implicitly may also be included.
    /// While this provides a good starting point for debugging, there is no guarantee that the returned set of constraints will include all of the constraints that have an impact on the view’s layout in the given orientation.
    ///
    /// This method should only be used for debugging constraint-based layout.
    /// No application should ship with calls to this method as part of its operation.
    ///
    /// This property should be used only for debugging constraint-based layout. Do not access this property in the shipping version of your app.
    /// - Parameter orientation: The direction of the dimension for which the constraints should be found.
    /// - Returns: The constraints impacting the layout of the view for the specified orientation.
    public func constraintsAffectingLayout(for orientation: NSLayoutConstraint.Orientation) -> [NSLayoutConstraint] {
        print("\(Self.self).\(#function)")
        return []
    }

    /// Randomly changes the frame of a view with an ambiguous layout between the different valid values.
    ///
    /// This method randomly changes the frame of a view with an ambiguous layout between its different valid values, causing the view to move in the interface.
    /// This makes it easy to visually identify what the valid frames are and may enable the developer to discern what constraints need to be added to the layout to fully specify a location for the view.
    ///
    /// This method should only be used for debugging constraint-based layout.
    /// No application should ship with calls to this method as part of its operation.
    public func exerciseAmbiguityInLayout() {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Resizing Subviews
    
    /// A Boolean value indicating whether the view applies the autoresizing behavior to its subviews when its frame size changes.
    ///
    /// When the value of this property is ``true`` and the view’s frame changes, the view automatically calls the ``resizeSubviews(withOldSize:)`` method to facilitate the resizing of its subviews.
    /// When the value of this property is ``false``, the view does not autoresize its subviews.
    ///
    /// The default value of this property is ``true``.
    public var autoresizesSubviews: Bool = true

    /// The options that determine how the view is resized relative to its superview.
    ///
    /// The value of this property is an integer bit mask specified by combining the options described in ``NSView.AutoresizingMask``.
    /// This mask is used by the ``resize(withOldSuperviewSize:)`` method when the view needs to be resized.
    ///
    /// If the autoresizing mask is set to NSViewNotSizable (that is, if none of the options are set), the view does not resize at all.
    /// When more than one option along an axis is set, the ``resize(withOldSuperviewSize:)`` method distributes the size difference as evenly as possible among the flexible portions.
    /// For example, if NSViewWidthSizable and NSViewMaxXMargin are set and the superview’s width has increased by 10.0 points, the view’s frame and right margin are each widened by 5.0 points.
    public var autoresizingMask: NSView.AutoresizingMask = .none
    
    /// Informs the view’s subviews that the view’s bounds rectangle size has changed.
    ///
    /// If the view is configured to autoresize its subviews, this method is automatically invoked by any method that changes the view’s frame size.
    ///
    /// The default implementation sends ``resize(withOldSuperviewSize:)`` to the view’s subviews with oldBoundsSize as the argument.
    /// You shouldn’t invoke this method directly, but you can override it to define a specific resizing behavior.
    /// - Parameter oldSize: The previous size of the view’s bounds rectangle.
    public func resizeSubviews(withOldSize oldSize: OpenCoreGraphics.CGSize) {
        fatalError("Not implemented yet")
    }
    
    /// Informs the view that the bounds size of its superview has changed.
    ///
    /// This method is normally invoked automatically from resizeSubviews(withOldSize:).
    ///
    /// The default implementation resizes the view according to the autoresizing options specified by the autoresizingMask property.
    /// You shouldn’t invoke this method directly, but you can override it to define a specific resizing behavior.
    ///
    /// If you override this method and call super as part of your implementation, you should be sure to call super before making changes to the receiving view’s frame yourself.
    /// - Parameter oldSize: The previous size of the superview’s bounds rectangle.
    public func resize(withOldSuperviewSize oldSize: OpenCoreGraphics.CGSize) {
        fatalError("Not implemented yet")
    }

    // MARK: - Drawing
    // MARK: - Drawing the View’s Content
    
    /// Updates the view’s content by modifying its underlying layer.
    ///
    /// You use this method to optimize the rendering of your view in situations where you can represent your views contents entirely using a layer object.
    /// If your view’s ``wantsUpdateLayer`` property is ``true``, the view calls this method instead of ``draw(_:)`` during the view update cycle.
    /// Custom views can override this method and use it to modify the properties of the underlying layer object.
    /// Modifying layer properties is a much more efficient way to update your view than is redrawing its content each time something changes.
    ///
    /// When you want to update the contents of your layer, mark the view as dirty by setting its ``needsDisplay`` property to ``true``.
    /// Doing so adds the view to the list of views that need to be refreshed during the next update cycle.
    /// During that update cycle, this method is called if the ``wantsUpdateLayer`` property is still ``true``.
    ///
    /// Your implementation of this method should not call super.
    public func updateLayer() {
        print("\(Self.self).\(#function)")
        layer?.displayIfNeeded()
        layer?.frame = frame
        layer?.draw(in: .init())
    }

    /// Overridden by subclasses to draw the view’s image within the specified rectangle.
    ///
    /// Use this method to draw the specified portion of your view’s content. Your implementation of this method should be as fast as possible and do as little work as possible.
    /// The dirtyRect parameter helps you achieve better performance by specifying the portion of the view that needs to be drawn.
    /// You should always limit drawing to the content inside this rectangle.
    /// For even better performance, you can call the ``getRectsBeingDrawn(_:count:)`` method and use the list of rectangles returned by that method to limit drawing even further.
    /// You can also use the ``needsToDraw(_:)`` method test whether objects in a particular rectangle need to be drawn.
    ///
    /// The default implementation does nothing.
    /// 
    /// Subclasses should override this method if they do custom drawing.
    /// Prior to calling this method, ``OpenAppKit`` creates an appropriate drawing context and configures it for drawing to the view; you do not need to configure the drawing context yourself.
    /// If your app manages content using its layer object instead, use the ``updateLayer()`` method to update your layer instead of overriding this method.
    ///
    /// If your custom view is a direct ``NSView`` subclass, you do not need to call super.
    /// For all other views, call super at some point in your implementation so that the parent class can perform any additional drawing.
    /// - Parameter dirtyRect: A rectangle defining the portion of the view that requires redrawing.
    /// This rectangle usually represents the portion of the view that requires updating.
    /// When responsive scrolling is enabled, this rectangle can also represent a nonvisible portion of the view that ``OpenAppKit`` wants to cache.
    ///
    /// - Important: If the view’s ``isOpaque`` property is ``true``, the view must completely fill the dirtyRect rectangle with opaque content.
    public func draw(_ dirtyRect: OpenCoreGraphics.CGRect) {
        layer?.draw(in: .init())
    }

    /// A Boolean value that indicates whether the view, and its subviews, confine their drawing areas to the bounds of the view.
    /// 
    /// Setting this value to true causes the view, and its subviews, to clip themselves to the bounds of the view. 
    /// Setting it to false prevents views and subviews whose frames extend beyond the visible bounds of the view from clipping themselves. 
    /// A value of false has no effect on ``hitTest(_:)`` but does affect ``visibleRect``, as well as the area drawn inside ``draw(_:)``.
    ///
    /// By default this value is ``false``. In macOS 13 and earlier, the default value is ``true``.
    ///
    /// Because of this change in default value, views built on macOS 13 and earlier may require layout adjustments such as the following on newer versions of macOS:
    /// 
    /// * Showing or hiding UI elements by setting a parent’s frame size to zero. To hide a view hierarchy by shrinking the parent view, or positioning a child view outside a parent’s bounds, set the clipsToBounds property of the parent view to true. 
    /// Alternatively, set isHidden to true on the parent view instead.
    /// 
    /// * Filling the dirtyRect of a view inside ``draw(_:)``.
    /// It’s a common practice to set the background color on a view by calling ``setFill()`` on a background color and then calling ``fill(using:)`` on the dirtyRect parameter passed into an override of ``draw(_:)``.
    /// Because the dirtyRect now extends outside your view’s bounds, call ``fill(using:)`` on the view’s bounds instead of the dirtyRect, or set the view’s ``clipsToBounds ``to true.
    ///
    /// * Differentiating a view’s bounds from its dirtyRect. 
    /// Use the dirtyRect parameter passed to ``draw(_:)`` to determine what to draw, not where to draw it.
    /// Use the view’s bounds to determine the layout of what your view draws.
    public var clipsToBounds: Bool = false

    /// A Boolean value indicating whether the view can draw its contents on a background thread.
    ///
    /// If your view’s ``draw(_:)`` implementation can draw safely on a background thread, set this property to true.
    /// Doing so gives OpenAppKit the ability to run your view’s drawing code off the app’s main thread, which can improve performance.
    /// The view’s window must also have its ``allowsConcurrentViewDrawing`` property set to true (the default) for threaded view drawing to occur.
    public var canDrawConcurrently: Bool = true

    /// The portion of the view that isn’t clipped by its superviews.
    ///
    /// Visibility, as reflected by this property, doesn’t account for whether other view or window objects overlap the current view or whether the current view is installed in a window at all.
    /// This value of this property is ``.zero`` if the current view is effectively hidden.
    ///
    /// During a printing operation the visible rectangle is further clipped to the page being imaged.
    /// ``clipsToBounds`` affects this property.
    public private(set) var visibleRect: OpenCoreGraphics.CGRect = .zero
    
    /// Returns a Boolean value indicating whether the specified rectangle intersects any part of the area that the view is being asked to draw.
    ///
    /// You typically send this message from within a ``draw(_:)`` implementation.
    /// It gives you a convenient way to determine whether any part of a given graphical entity might need to be drawn.
    /// It is optimized to efficiently reject any rectangle that lies outside the bounding box of the area that the view is being asked to draw in ``draw(_:)``.
    /// - Parameter rect: A rectangle defining a region of the view.
    public func needsToDraw(_ rect: NSRect) -> Bool {
        draw(rect)
    }

    /// A Boolean value indicating whether OpenAppKit’s default clipping behavior is in effect.
    ///
    /// The default value of this property is ``true``. When the value of this property is ``true``, OpenAppKit sets the current clipping region to the bounds of the view prior to calling that view’s ``draw(_:)`` method.
    /// Subclasses may override this property and return ``false`` to suppress this default clipping behavior.
    /// You might do this to avoid the cost of setting up, enforcing, and cleaning up the clipping path. If you do change the value to ``false``, you are responsible for doing your own clipping or constraining drawing appropriately.
    /// Failure to do so could the view to corrupt the contents of other views in the window.
    public private(set) var wantsDefaultClipping: Bool = true

    /// Returns a bitmap-representation object suitable for caching the specified portion of the view.
    ///
    /// Passing the visible rectangle of the view (self.visibleRect) returns a bitmap suitable for caching the current contents of the view, including all of its descendants.
    /// - Parameter rect: A rectangle defining the area of the view to be cached.
    /// - Returns: An autoreleased ``NSBitmapImageRep`` object or ``nil`` if the object could not be created.
    public func bitmapImageRepForCachingDisplay(in rect: OpenCoreGraphics.CGRect) -> NSBitmapImageRep? {
        print("\(Self.self).\(#function)")
    }

    /// Draws the specified area of the view, and its descendants, into a provided bitmap-representation object.
    ///
    /// You are responsible for initializing the bitmap to the desired configuration before calling this method.
    /// However, once initialized, you can reuse the same bitmap multiple times to refresh the cached copy of your view’s contents.
    /// The bitmap produced by this method is transparent (that is, has an alpha value of 0) wherever the view and its descendants do not draw any content.
    /// - Parameters:
    ///   - rect: A rectangle defining the region to be drawn into ``bitmapImageRep``.
    ///   - bitmapImageRep: An ``NSBitmapImageRep`` object. For pixel-format compatibility, bitmapImageRep should have been obtained from ``bitmapImageRepForCachingDisplay(in:)``.
    public func cacheDisplay(in rect: NSRect, to bitmapImageRep: NSBitmapImageRep) {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Drawing the View in Fullscreen Mode

    /// A Boolean value indicating whether the view is in full screen mode.
    /// 
    /// The value of this property is ``true`` when the view is in full screen mode or ``false`` when it is not.
    public var isInFullScreenMode: Bool = false
    
    /// Sets the view to full screen mode.
    ///
    /// When the ``fullScreenModeApplicationPresentationOptions`` is contained in the options dictionary, the presentation options that were in effect when this method is invoked are not altered, and no displays are captured.
    /// If you do not wish to capture the screen when going to full screen mode, you can add ``fullScreenModeApplicationPresentationOptions`` to the options dictionary with the value returned by the ``presentationOptions``.
    ///
    /// When the ``fullScreenModeApplicationPresentationOptions`` options is specified, exiting full screen mode using ``exitFullScreenMode(options:)`` will restore the previously active ``presentationOptions``.
    /// - Parameters:
    ///   - screen: The screen the view should cover.
    ///   - options: A dictionary of options for the mode. For possible keys, see Full Screen Mode Options.
    /// - Returns: ``true`` if the view was able to enter full screen mode, otherwise ``false``.
    open func enterFullScreenMode(_ screen: NSScreen, withOptions options: [NSView.FullScreenModeOptionKey : Any]? = nil) -> Bool {
        print("\(Self.self).\(#function)")
        isInFullScreenMode = true
        return true
    }
    
    /// Instructs the view to exit full screen mode.
    ///
    /// When the ``fullScreenModeApplicationPresentationOptions`` options is specified when ``enterFullScreenMode(_:withOptions:)`` is invoked, exiting full screen mode will restore the previously active ``presentationOptions``.
    /// - Parameter options: A dictionary of options for the mode. For possible keys, see Full Screen Mode Options.
    open func exitFullScreenMode(options: [NSView.FullScreenModeOptionKey : Any]? = nil) {
        print("\(Self.self).\(#function)")
        isInFullScreenMode = false
    }

    // MARK: - Invalidating the View’s Content

    /// A Boolean value that determines whether the view needs to be redrawn before being displayed.
    /// 
    /// The ``displayIfNeeded`` methods check the value of this property to avoid unnecessary drawing, and all display methods set the value back to ``false`` when the view is up to date.
    /// Whenever the data or state affecting the view’s appearance changes, set this property to ``true``. 
    /// This marks the view as needing to update its display.
    /// On the next pass through the app’s event loop, the view is automatically redisplayed.
    public var needsDisplay: Bool = true

    /// Marks the region of the view within the specified rectangle as needing display, increasing the view’s existing invalid region to include it.
    /// 
    /// A later displayIfNeeded method will then perform drawing only within the invalid region. 
    /// View objects marked as needing display are automatically redisplayed on each pass through the application’s event loop. 
    /// (View objects that need to redisplay before the event loop comes around can of course immediately be sent the appropriate display method.)
    /// - Parameter invalidRect: The rectangular region of the view to mark as invalid; it should be specified in the coordinate system of the view.
    public func setNeedsDisplay(_ invalidRect: OpenCoreGraphics.CGRect) {
        print("\(Self.self).\(#function)")
        needsDisplay = true
        displayIfNeeded(invalidRect)
    }

    /// Displays the view and all its subviews if possible, invoking each of the NSView methods ``lockFocus()``, ``draw(_:)``, and ``unlockFocus()`` as necessary.
    /// 
    /// If the view isn’t opaque, this method backs up the view hierarchy to the first opaque ancestor, calculates the portion of the opaque ancestor covered by the view, and begins displaying from there.
    public func display() {
        print("\(Self.self).\(#function)")
        if wantsUpdateLayer {
            updateLayer()
            wantsUpdateLayer = false
        }

        display(frame)
    }

    /// Acts as ``display()``, but confining drawing to a rectangular region of the view.
    /// - Parameter rect: A rectangle defining the region of the view to be redrawn; it should be specified in the coordinate system of the view.
    public func display(_ rect: OpenCoreGraphics.CGRect) {
        print("\(Self.self).\(#function)")
        draw(frame)
    }

    ///  Displays the view but confines drawing to a specified region and does not back up to the first opaque ancestor—it simply causes the view and its descendants to execute their drawing code.
    /// - Parameter rect: A rectangle defining the region of the view to be redrawn; it should be specified in the coordinate system of the view.
    public func displayIgnoringOpacity(_ rect: OpenCoreGraphics.CGRect) {
        print("\(Self.self).\(#function)")
        display(rect)
    }

    /// Causes the view and its descendants to be redrawn to the specified graphics context.
    /// 
    /// Acts as ``display()``, but confines drawing to aRect. 
    /// This method initiates drawing with the view, even if the view is not opaque. 
    /// Appropriate scaling factors for the view are obtained from context.
    /// 
    /// If the context parameter represents the context for the window containing the view, then all of the necessary transformations are applied. 
    /// This includes the application of the view’s bounds and frame transforms along with any transforms it inherited from its ancestors. 
    /// In this situation, the view is also marked as no longer needing an update for the specified rectangle.
    /// 
    /// If context specifies any other graphics context, then only the view’s bounds transform is applied. 
    /// This means that drawing is not constrained to the view’s visible rectangle. 
    /// It also means that any dirty rectangles are not cleared, since they are not being redrawn to the window.
    /// - Parameters:
    ///   - rect: A rectangle defining the region of the view to be redrawn. It should be specified in the coordinate system of the view.
    ///   - context: The graphics context in which drawing will occur. See the discussion below for more about this parameter.
    public func displayIgnoringOpacity(_ rect: OpenCoreGraphics.CGRect, in context: NSGraphicsContext) {
        print("\(Self.self).\(#function)")
        display(rect)
    }

    /// Displays the view and all its subviews if any part of the view has been marked as needing display.
    /// 
    /// This method invokes the ``NSView`` methods ``lockFocus()``, ``draw(_:)``, and ``unlockFocus()`` as necessary. 
    /// If the view isn’t opaque, this method backs up the view hierarchy to the first opaque ancestor, calculates the portion of the opaque ancestor covered by the view, and begins displaying from there.
    public func displayIfNeeded() {
        displayIfNeeded(frame)
    }

    /// Acts as ``displayIfNeeded()``, confining drawing to a specified region of the view.
    /// - Parameter rect: A rectangle defining the region to be redrawn. It should be specified in the coordinate system of the view.
    public func displayIfNeeded(_ rect: OpenCoreGraphics.CGRect) {
        if needsDisplay {
            display(frame)
            needsDisplay = false
        }
    }

    /// Acts as ``displayIfNeeded()``, except that this method doesn’t back up to the first opaque ancestor—it simply causes the view and its descendants to execute their drawing code.
    public func displayIfNeededIgnoringOpacity() {
        displayIfNeeded(frame)
    }

    /// Acts as ``displayIfNeeded()``, but confining drawing to aRect and not backing up to the first opaque ancestor—it simply causes the view and its descendants to execute their drawing code.
    /// - Parameter rect: A rectangle defining the region to be redrawn. It should be specified in the coordinate system of the view.
    public func displayIfNeededIgnoringOpacity(_ rect: OpenCoreGraphics.CGRect) {
        displayIfNeeded(rect)
    }

    /// Translates the display rectangles by the specified delta.
    /// 
    /// This method performs the shifting of dirty rectangles that an equivalent scroll(_:by:) operation would cause, without performing the actual scroll operation. 
    /// It is only useful in very rare cases where a view implements its own low-level scrolling mechanics.
    /// 
    /// This method:
    /// 1. Collects the receiving view’s dirty rectangles.
    /// 2. Clears all dirty rectangles in the intersection of clipRect and the view’s bounds.
    /// 3. Shifts the retrieved rectangles by the delta offset.
    /// 4. Clips the result to the intersection of clipRect and the view’s bounds
    /// 5. Marks the resultant rectangles as needing display.
    /// 
    /// The developer must ensure that clipRect and delta are pixel-aligned in order to guarantee correct drawing. 
    /// See Transforming View Coordinates To and From Base Space for a description of how to pixel-align view coordinates.
    /// - Parameters:
    ///   - clipRect: A rectangle defining the region of the view, typically the view’s bounds.
    ///   - delta: A ``OpenCoreGraphics.CGSize`` structure that specifies an offset from aRect’s origin.
    public func translateRectsNeedingDisplay(in clipRect: OpenCoreGraphics.CGRect, by delta: OpenCoreGraphics.CGSize) {
        fatalError("Not implemented yet")
    }

    /// A Boolean value indicating whether the view fills its frame rectangle with opaque content.
    /// 
    /// The default value of this property is ``false`` to reflect the fact that views do no drawing by default. 
    /// Subclasses can override this property and return ``true`` to indicate that the view completely covers its frame rectangle with opaque content. 
    /// Doing so can improve performance during drawing operations by eliminating the need to render content behind the view.
    public private(set) var isOpaque: Bool = false

    /// Informs the view that it’s required to draw content.
    /// 
    /// In response to receiving one of the display methods, the view recurses down the view hierarchy, sending this message to each of the views that may be involved in the display operation.
    /// 
    /// Subclasses can override this method to move or resize views, mark additional areas as requiring display, or take other actions that can best be deferred until they are required for drawing. 
    /// During the recursion, setting the ``needsDisplay`` property or sending the ``setNeedsDisplay(_:)`` message to views in the hierarchy that are about to be drawn is valid and supported, and affects the assessment of the total area to be rendered in that drawing pass.
    public func viewWillDraw() {
        fatalError("Not implemented yet")
    }

    // MARK: - Managing Live Resize

    /// A Boolean value indicating whether the view is being rendered as part of a live resizing operation.
    /// 
    /// OpenAppKit sets the value of this property to ``true`` when a live resizing operation involving the view is underway. 
    /// Use this property to determine when to optimize your view’s drawing behavior. 
    /// Typically, you access this property from your ``draw(_:)`` method and use the value to change the fidelity of the content you draw, or to draw your content more efficiently.
    public private(set) var inLiveResize: Bool = false

    /// A Boolean value indicating whether the view optimizes live-resize operations by preserving content that has not moved.
    /// 
    /// The default value of this property is ``false``. If your view supports content preservation, override this property and return ``true``. 
    /// Content preservation lets your view decide what to redraw during a live resize operation. 
    /// If your view supports this feature, you should also provide a custom implementation of the ``setFrameSize(_:)`` method that invalidates the portions of your view that actually need to be redrawn.
    public private(set) var preservesContentDuringLiveResize: Bool = false

    /// Returns a list of rectangles indicating the newly exposed areas of the view.
    /// 
    /// If your view does not support content preservation during live resizing, the entire area of your view is returned in the exposedRects parameter. 
    /// To support content preservation, override the ``preservesContentDuringLiveResize`` property in your view and have your implementation return ``true``.
    /// 
    /// - Note: The window containing your view must also support content preservation. To enable support for this feature in your window, use the ``preservesContentDuringLiveResize`` method of ``NSWindow``.
    /// 
    /// If the view decreased in both height and width, the list of returned rectangles will be empty. 
    /// If the view increased in both height and width and its upper-left corner stayed anchored in the same position, the list of returned rectangles will contain a vertical and horizontal component indicating the exposed area.
    /// - Parameters:
    ///   - exposedRects: On return, contains the list of rectangles. The returned rectangles are in the coordinate space of the view.
    ///   - count: Contains the number of rectangles in exposedRects; this value may be 0 and is guaranteed to be no more than 4.
    public func getRectsExposedDuringLiveResize(_ exposedRects: UnsafeMutablePointer<NSRect>, count: UnsafeMutablePointer<Int>) {
        fatalError("Not implemented yet")
    }

    /// The rectangle identifying the portion of your view that did not change during a live resize operation.
    /// 
    /// The rectangle in this property is in the coordinate system of your view and reflects the space your view previously occupied. 
    /// This rectangle may be smaller or the same size as your view’s current bounds, depending on whether the view grew or shrunk.
    /// 
    /// If your view does not support content preservation during live resizing, the rectangle will be empty. 
    /// To support content preservation, override the ``preservesContentDuringLiveResize`` property in your view and have your implementation return ``true``.
    /// 
    /// - Note: The window containing your view must also support content preservation. To enable support for this feature in your window, use the ``preservesContentDuringLiveResize`` method of ``NSWindow``.
    public var rectPreservedDuringLiveResize: OpenCoreGraphics.CGRect = .zero

    /// Informs the view of the start of a live resize—the user has started resizing the view.
    /// 
    /// In the simple case, a view is sent ``viewDidEndLiveResize()`` before the first resize operation on the containing window and ``viewDidEndLiveResize()`` after the last resize operation. 
    /// A view that is repeatedly added and removed from a window during live resize will receive only one ``viewWillStartLiveResize()`` (on the first time it is added to the window) and one ``viewDidEndLiveResize()`` (when the window has completed the live resize operation). 
    /// This allows a superview such as NSBrowser object to add and remove its NSMatrix subviews during live resize without the NSMatrix object receiving multiple calls to these methods.
    /// 
    /// A view might allocate data structures to cache-drawing information in ``viewDidEndLiveResize()`` and should clean up these data structures in ``viewDidEndLiveResize()``. 
    /// In addition, a view that does optimized drawing during live resize might need to do full drawing after ``viewDidEndLiveResize()``. 
    /// However, you should not assume that a view has a drawing context in ``viewDidEndLiveResize()`` (since it may have been removed from the window during live resize). 
    /// A view that needs to redraw itself after live resize should set its ``needsDisplay`` property to true in ``viewDidEndLiveResize()``.
    /// 
    /// A view subclass should call super from these methods.
    public func viewWillStartLiveResize() {
        fatalError("Not implemented yet")
    }

    /// Informs the view of the end of a live resize—the user has finished resizing the view.
    /// 
    /// In the simple case, a view is sent ``viewWillStartLiveResize()`` before the first resize operation on the containing window and ``viewDidEndLiveResize()`` after the last resize operation. 
    /// A view that is repeatedly added and removed from a window during live resize will receive only one ``viewWillStartLiveResize(``) (on the first time it is added to the window) and one ``viewDidEndLiveResize()`` (when the window has completed the live resize operation). 
    /// This allows a superview such as NSBrowser object to add and remove its NSMatrix subviews during live resize without the NSMatrix receiving multiple calls to these methods.
    /// 
    /// A view might allocate data structures to cache-drawing information in ``viewWillStartLiveResize()`` and should clean up these data structures in ``viewDidEndLiveResize()``. 
    /// In addition, a view that does optimized drawing during live resize might need to do full drawing after ``viewDidEndLiveResize()``. 
    /// However, you should not assume that a view has a drawing context in ``viewDidEndLiveResize()`` (since it may have been removed from the window during live resize). 
    /// A view that needs to redraw itself after live resize should set its needsDisplay property to true in ``viewDidEndLiveResize()``.
    /// 
    /// A view subclass should call super from these methods.
    public func viewDidEndLiveResize() {
        fatalError("Not implemented yet")
    }
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

extension NSView {

    /// Constants that specify the autoresizing behaviors for views.
    public struct AutoresizingMask : Equatable, OptionSet, Sendable {

        /// The view cannot be resized.
        public static let none = NSView.AutoresizingMask(rawValue: 1)

        /// The left margin between the view and its superview is flexible.
        public static let minXMargin = NSView.AutoresizingMask(rawValue: 2)

        /// The view’s width is flexible.
        public static let width = NSView.AutoresizingMask(rawValue: 4)

        /// The right margin between the view and its superview is flexible.
        public static let maxXMargin = NSView.AutoresizingMask(rawValue: 8)

        /// The bottom margin between the view and its superview is flexible.
        public static let minYMargin = NSView.AutoresizingMask(rawValue: 16)

        /// The view’s height is flexible.
        public static let height = NSView.AutoresizingMask(rawValue: 32)

        /// The top margin between the view and its superview is flexible.
        public static let maxYMargin = NSView.AutoresizingMask(rawValue: 64)

        // MARK: - Accessing the Raw Value

        /// The corresponding value of the raw type.
        public var rawValue: UInt

        // MARK: - Creating a Raw Value

        /// Creates a new instance with the specified raw value.
        public init(rawValue: UInt) {
            self.rawValue = rawValue
        }
    }
}

extension NSView {

    /// These constants specify the type of a view’s border.
    public enum NSBorderType: Equatable {
        /// A concave border that makes the view look sunken.
        case bezelBorder

        /// A thin border that looks etched around the image.
        case grooveBorder

        /// A black line border around the view.
        case lineBorder

        /// No border.
        case noBorder
    }
}

extension NSView {
    
    /// These constants are keys that you can use in the options dictionary in ``enterFullScreenMode(_:withOptions:)`` and ``exitFullScreenMode(options:)``.
    public struct FullScreenModeOptionKey: Equatable, Hashable, RawRepresentable, Sendable {

        // MARK: - Type Properties

        /// Key whose corresponding value specifies whether the view should take over all screens.
        public static let fullScreenModeAllScreens = NSView.FullScreenModeOptionKey(rawValue: "")

        /// Key whose corresponding value specifies the application presentation options.
        public static let fullScreenModeApplicationPresentationOptions = NSView.FullScreenModeOptionKey(rawValue: "")

        /// Key whose corresponding value specifies the full screen mode setting.
        public static let fullScreenModeSetting = NSView.FullScreenModeOptionKey(rawValue: "")

        /// Key whose corresponding value specifies the screen mode window level.
        public static let fullScreenModeWindowLevel = NSView.FullScreenModeOptionKey(rawValue: "")

        // MARK: - Accessing the Raw Value

        /// The corresponding value of the raw type.
        public var rawValue: String

        // MARK: - Creating a Value

        /// Creates a new instance with the specified raw value.
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
}

extension NSView {
    public typealias NSBitmapImageRep = OpaquePointer
}

extension NSView : OpenCoreAnimation.CALayerDelegate {
    /// Tells the delegate to implement the display process.
    /// 
    /// The ``display(_:)`` delegate method is called when the layer is marked for its content to be reloaded, typically initiated by the ``setNeedsDisplay()`` method. 
    /// The typical technique for updating is to set the layer’s contents property.
    /// - Parameter layer: The layer whose contents need updating.
    public func display(_ layer: CALayer) {
        print("\(Self.self).\(#function)")

        layer.frame = frame
        
        if let context = NSGraphicsContext.current {
            draw(layer, in: context.cgContext)
            return
        } else {
            print("Context is nil")
        }
    }

    /// Tells the delegate to implement the display process using the layer’s context.
    /// 
    /// The draw(_:in:) method is called when the layer is marked for its content to be reloaded, typically with the setNeedsDisplay() method. 
    /// It is not called if the delegate implements the display(_:) method. 
    /// You can use the context to draw vectors, such as curves and lines, or images with the draw(_:in:byTiling:) method.
    /// - Parameters:
    ///   - layer: The layer whose contents need to be drawn.
    ///   - context: The graphics context to use for drawing. The graphics context incorporates the appropriate scale factor for drawing to the target screen
    public func draw(_ layer: CALayer, in context: CGContext) {
        print("\(Self.self).\(#function)")
        if let contents = layer.contents as? NSImage, let image = contents.cgImage {
            context.draw(image, in: layer.frame)
            return
        }

        if let image = layer.contents as? CGImage {
            context.draw(image, in: layer.frame)
            return
        }
    }
}