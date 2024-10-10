import Foundation

/// An object that describes the attributes of a computer’s monitor or screen.
@MainActor
public class NSScreen: NSObject {

    // MARK: - Getting Screen Objects
    
    /// Returns the screen object containing the window with the keyboard focus.
    /// 
    /// The main screen is not necessarily the same screen that contains the menu bar or has its origin at (0, 0). 
    /// The main screen refers to the screen containing the window that is currently receiving keyboard events. 
    /// It is the main screen because it is the one with which the user is most likely interacting.
    ///
    /// The screen containing the menu bar is always the first object (index 0) in the array returned by the screens method.
    public static var main: NSScreen?
    
    /// Returns a screen object representing the screen that can best represent color.
    /// 
    /// This method always returns an object, even if there is only one screen and it is not a color screen.
    public static var deepest: NSScreen?
    
    /// Returns an array of screen objects representing all of the screens available on the system.
    /// 
    /// The screen at index 0 in the returned array corresponds to the primary screen of the user’s system. 
    /// This is the screen that contains the menu bar and whose origin is at the point (0, 0). 
    /// In the case of mirroring, the first screen is the largest drawable display; if all screens are the same size, it is the screen with the highest pixel depth. 
    /// This primary screen may not be the same as the one returned by the main method, which returns the screen with the active window.
    /// 
    /// The array should not be cached. Screens can be added, removed, or dynamically reconfigured at any time. 
    /// When the display configuration is changed, the default notification center sends a ``didChangeScreenParametersNotification`` notification.
    public static var screens: [NSScreen] = []

    // MARK: - Getting Screen Information

    /// The current bit depth and colorspace information of the screen.
    public private(set) var depth: NSWindow.Depth = .onehundredtwentyeightBitRGB
    
    /// The dimensions and location of the screen.
    public private(set) var frame: NSRect = NSRect()

    /// The device dictionary for the screen.
    public private(set) var deviceDescription: [String: Any] = [:]

    /// The color space of the screen.
    public private(set) var colorSpace: NSColorSpace?

    /// The localized name of the display.
    public private(set) var localizedName: String = ""

    /// A Boolean value indicating whether the color space of the screen is capable of representing the specified display gamut.
    public func canRepresent(_ displayGamut: NSDisplayGamut) -> Bool {
        true
    }

    // MARK: - Getting the Visible Portion of the Screen
    
    /// The current location and dimensions of the visible screen.
    /// 
    /// This rectangle defines the portion of the screen in which it is currently safe to draw your app’s content.
    /// The returned rectangle is always based on the current user-interface settings and does not include the area currently occupied by the dock and menu bar. 
    /// On Macs that include a camera housing in the bezel, this rectangle does not include the bezel or the visible areas on either side of the bezel. Get those areas using the ``auxiliaryTopLeftArea`` and ``auxiliaryTopRightArea`` properties. 
    /// Don’t cache the rectangle in this property; it is based on the current user-interface settings, which can change between calls.
    public private(set) var visibleFrame: NSRect = NSRect()
    
    /// The distances from the screen’s edges at which content isn’t obscured.
    /// 
    /// The safe area reflects the unobscured portion of the screen. 
    /// On some Macs, the insets reflect the portion of the screen covered by the camera housing. 
    /// If your app offers a custom full-screen experience, apply the specified insets to the screen’s frame rectangle to obtain the area within which it is safe to display your content. 
    /// Content in the safe area is guaranteed to be unobscured.
    /// 
    /// If your app uses the system’s full-screen experience, you don’t need to account for the safe area in your window. 
    /// When you call your window’s ``toggleFullScreen(_:)`` method to enter full-screen mode, the system automatically positions the window’s contents within the safe area.
    public private(set) var safeAreaInsets: NSEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)
    
    /// The unobscured portion of the top-left corner of the screen.
    /// 
    /// If the top inset of the screen’s safeAreaInsets property contains a non-zero value, the rectangle in this property is the visible top-left portion of the screen. 
    /// The rectangle is specified in global screen coordinates and lies outside the safe area. 
    /// If the top portion of the screen isn’t obscured, the value of this property is nil.
    /// 
    /// If your app offers a custom full-screen experience, use this property to determine what additional space is available for your custom content. 
    /// The specified rectangle is safe to use to display your content.
    public private(set) var auxiliaryTopLeftArea: NSRect?
    
    /// The unobscured portion of the top-right corner of the screen.
    /// 
    /// If the top inset of the screen’s safeAreaInsets property contains a non-zero value, the rectangle in this property is the visible top-right portion of the screen.The rectangle is specified in global screen coordinates and lies outside the safe area. 
    /// If the top portion of the screen isn’t obscured, the value of this property is nil.
    /// 
    /// If your app offers a custom full-screen experience, use this property to determine what additional space is available for your custom content. 
    /// The specified rectangle is safe to use to display your content.
    public private(set) var auxiliaryTopRightArea: NSRect?

    // MARK: - Receiving Screen-Related Notifications
    
    /// Posted when the color space of the screen has changed.
    /// The notification object is the NSScreen object whose colorSpace has changed. 
    /// This notification does not contain a userInfo dictionary.
    public static let colorSpaceDidChangeNotification = NSNotification.Name(rawValue: "NSColorSpaceDidChangeNotification")

    // MARK: - Creating a NSScreen

    /// The window object associated with the event.
    private weak var window: NSWindow?

    /// Create a NSScreen
    /// - Parameter window: The window object associated with the event.
    private init(window: NSWindow) {
        self.window = window
        super.init()
    }

    public required init() {
        self.window = nil
        super.init()
    }
}

extension NSScreen {
    public enum NSDisplayGamut: Sendable {
        case p3
        case sRGB
    }
}