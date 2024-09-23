import Foundation
import CoreGraphics

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
    }

    // MARK: - Managing the Window's Behavior

    /// The window’s delegate.
    /// 
    /// The value of this property is nil if the window doesn’t have a delegate.
    /// A window object’s delegate is inserted in the responder chain after the window itself and is informed of various actions by the window through delegation messages.
    public weak var delegate: (any NSWindowDelegate)?

    // MARK: - Configuring the Window's Content

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
    public var backgroundColor: NSColor = NSColor()

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
    public var frame: CGRect = CGRect()

    /// Positions the bottom-left corner of the window’s frame rectangle at a given point in screen coordinates.
    /// Note that the window server limits window position coordinates to ±16,000.
    /// - Parameter point: The new position of the window’s bottom-left corner in screen coordinates.
    public func setFrameOrigin(_ point: CGPoint) {
    }

    /// Positions the top-left corner of the window’s frame rectangle at a given point in screen coordinates.
    /// Note that the window server limits window position coordinates to ±16,000; if necessary, adjust aPoint relative to the window’s lower-left corner to account for this limit.
    /// - Parameter point: The new position of the window’s top-left corner in screen coordinates.
    public func setFrameTopLeftPoint(_ point: CGPoint) {
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
    public func constrainFrameRect(_ frameRect: CGRect, to screen: NSScreen?) -> CGRect {
        .init()
    }

    /// Positions the window’s top-left to a given point.
    /// 
    /// The returned point can be passed to a subsequent invocation of cascadeTopLeft(from:) to position the next window so the title bars of both windows are fully visible.
    /// - Parameter topLeftPoint: The new top-left point, in screen coordinates, for the window. When ``NSZeroPoint``, the window is not moved, except as needed to constrain to the visible screen
    /// - Returns: The point shifted from top left of the window in screen coordinates.
    public func cascadeTopLeft(from topLeftPoint: NSPoint) -> NSPoint {
        .init()
    }

    /// Sets the origin and size of the window’s frame rectangle according to a given frame rectangle, thereby setting its position and size onscreen.
    /// Note that the window server limits window position coordinates to ±16,000 and sizes to 10,000.
    /// - Parameters:
    ///   - frameRect: The frame rectangle for the window, including the title bar.
    ///   - flag: Specifies whether the window redraws the views that need to be displayed. When true the window sends a ``displayIfNeeded()`` message down its view hierarchy, thus redrawing all views.
    public func setFrame(_ frameRect: NSRect, display flag: Bool) {
    }

    /// Sets the origin and size of the window’s frame rectangle, with optional animation, according to a given frame rectangle, thereby setting its position and size onscreen.
    /// - Parameters:
    ///   - frameRect: The frame rectangle for the window, including the title bar.
    ///   - displayFlag: Specifies whether the window redraws the views that need to be displayed. When true the window sends a displayIfNeeded() message down its view hierarchy, thus redrawing all views.
    ///   - animateFlag: Specifies whether the window performs a smooth resize. true to perform the animation, whose duration is specified by animationResizeTime(_:).
    public func setFrame(_ frameRect: NSRect, display displayFlag: Bool, animate animateFlag: Bool) {
    }
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
        
        /// The corresponding value is an NSValue object containing a value of type NSSize that describes the window’s raster resolution in dots per inch (dpi).
        case resolution
        
        /// The corresponding value is an NSValue object containing a value of type NSSize that gives the size of the window’s frame rectangle.
        case size
    }
}