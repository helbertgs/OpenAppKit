import Foundation

/// An object that manages standard appearance attributes for UI elements in an app.
/// 
/// An NSAppearance object manages how AppKit renders your app's UI elements. 
/// Specifically, appearance objects determine which colors and images AppKit uses when drawing windows, views, and controls. 
/// Although you can use an appearance object to determine how to draw custom views and controls, a better approach is to choose colors and images that adapt automatically to the current appearance. 
/// For example, define a color asset whose actual color value changes for light and dark appearances. 
/// You can assign specific appearances to your views in Interface Builder.
/// 
/// The user chooses the default appearance for the system, but you can override that appearance for all or part of your app. 
/// Apps inherit the default system appearance, windows inherit their app's appearance, and views inherit the appearance of their nearest ancestor (either a superview or window). 
/// To force a window or view to adopt an appearance, assign a specific appearance object to its appearance property.
/// 
/// When AppKit draws a control, it automatically sets the current appearance on the current thread to the control’s appearance. 
/// The current appearance influences the drawing path and return values you get when you access system fonts and colors. 
/// The current appearance also affects the appearance of text and images, such as the text and template images in a toolbar.
@MainActor
public class NSAppearance {

    // MARK: - Getting the Appearance Name

    /// The name of the appearance.
    /// For a list of standard appearance names, see NSAppearance.Name.
    public var name: NSAppearance.Name

    // MARK: - Creating an Appearance

    /// Creates an appearance object based on the name of one of the standard system appearances.
    /// When you specify a standard appearance name—such as aqua—this method returns a built-in appearance.
    /// - Parameter name: The name of a standard appearance. See NSAppearance.Name for the list of standard appearance names.
    /// - Returns: A standard NSAppearance object.
    public init?(named name: NSAppearance.Name) {
        self.name = name
    }

    /// Creates an appearance object from the named appearance file located in the specified bundle.
    /// An initialized appearance object, or nil if an error occurs.
    /// - Parameters:
    ///   - name: The name of the appearance file to retrieve. Do not include any path information in the name.
    ///   - bundle: The bundle in which to search for the named appearance file. Specify nil to search for the appearance file in the main bundle.
    public init?(appearanceNamed name: NSAppearance.Name, bundle: Bundle?) {
        self.name = name
    }

    // MARK: - Getting and Setting the Current Appearance

    /// The appearance that the system uses for color and asset resolution, and that’s active for drawing, usually from locking focus on a view.
    /// - Returns: The current appearance used for drawing.
    public class func currentDrawing() -> NSAppearance {
        NSApplication.shared.effectiveAppearance
    }

    /// Sets the appearance to be the active drawing appearance and perform the specified block.
    /// This method saves and restores the previous current appearance.
    /// - Parameter block: The block to invoke after setting the appearance to be the current drawing appearance.
    public func performAsCurrentDrawingAppearance(_ block: () -> Void) {
    }
}

extension NSAppearance {
    public struct Name: Hashable, RawRepresentable, Sendable {

        // MARK: - System Appearance Names

        /// The aqua light system appearance.
        /// Use this constant to retrieve the named ``NSAppearance`` associated with the standard light system appearance. 
        /// You can assign that appearance object to the views and windows of your interface or to your entire app.
        public static let aqua: NSAppearance.Name = .init(rawValue: "aqua")

        /// The aqua dark system appearance.
        /// Use this constant to retrieve the named ``NSAppearance`` associated with the standard dark system appearance. 
        /// You can assign that appearance object to the views and windows of your interface or to your entire app.
        public static let darkAqua: NSAppearance.Name = .init(rawValue: "darkAqua")

        /// The fluent light system appearance.
        /// Use this constant to retrieve the named ``NSAppearance`` associated with the standard light system appearance. 
        /// You can assign that appearance object to the views and windows of your interface or to your entire app.
        public static let fluent: NSAppearance.Name = .init(rawValue: "fluent")

        /// The fluent dark system appearance.
        /// Use this constant to retrieve the named ``NSAppearance`` associated with the standard dark system appearance. 
        /// You can assign that appearance object to the views and windows of your interface or to your entire app.
        public static let darkFluent: NSAppearance.Name = .init(rawValue: "darkFluent")

        // MARK: - Accessing the Raw Value
        
        /// The corresponding value of the raw type.
        public let rawValue: String

        // MARK: - Initializers

        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
}