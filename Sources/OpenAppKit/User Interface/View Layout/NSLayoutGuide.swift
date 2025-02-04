import Foundation
import OpenCoreGraphics

/// A rectangular area that can interact with Auto Layout.
@MainActor public class NSLayoutGuide {

    // MARK: - Working With Layout Guides

    /// A string used to identify the layout guide.
    /// 
    /// By default, the identifier property is nil. 
    /// You can assign a string to help identify this guide. 
    /// This string appears as part of the guide’s description when the guide is printed to the console. 
    /// You can also use the identifier to find a particular layout guide from among the guides owned by a view.
    /// Identifiers starting with “NS” or “UI” are reserved by the system. The system may assign these identifiers to the guides it creates.
    public var identifier: NSUserInterfaceItemIdentifier

    /// The layout guide’s frame in its owning view’s coordinate system.
    /// 
    /// The layout guide defines a rectangular space in its owning view’s coordinate system. 
    /// This property contains a valid ``CGRect`` value by the time its owning view’s ``layout()`` method is called.
    public var frame: OpenCoreGraphics.CGRect

    /// The view that owns this layout guide.
    /// 
    /// By default, this property is nil. 
    /// To participate in Auto Layout, the layout guide must be added to a view by calling its ``addLayoutGuide(_:)`` method. 
    /// Do not modify this property directly. Instead, use the view’s ``addLayoutGuide(_:)`` and ``removeLayoutGuide(_:)`` methods, which update this property as necessary.
    public weak var owningView: NSView?

    // MARK: - Creating Constraints Using Layout Anchors

    public init(identifier: NSUserInterfaceItemIdentifier = .init(rawValue: ""), frame: OpenCoreGraphics.CGRect = .zero, owningView: NSView? = nil) {
        self.identifier = identifier
        self.frame = frame
        self.owningView = owningView
    }
}
