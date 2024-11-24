import OpenCoreAnimation
import Foundation

/// An optional layer delegate method for handling resolution changes.
/// 
/// Use this protocol to manage scale and contents for a layer hosted in a view. 
/// When a window changes its backing resolution, AppKit attempts to automatically update the contentsScale and contents of all CALayer objects in the window to match the new resolution. 
/// Layers backed by a view are updated automatically. Any layer whose contents property is set to an NSImage object is also updated automatically. 
/// Based on the NSImage object’s available representations, AppKit selects an appropriate bitmapped representation, or rasterizes a resolution-independent representation at the appropriate scale factor.
/// 
/// For all other layers, AppKit checks whether the layer has a delegate that implements this protocol. 
/// If so, AppKit asks the layer's delegate whether it should automatically update the contentsScale for that layer to match the new scale factor of the window.
@MainActor public protocol NSViewLayerContentScaleDelegate {

    /// Notifies you when a resolution changes occurs for the window that hosts the layer.
    /// 
    /// When a resolution change occurs for a given window, the system traverses the layer trees in that window to decide what action, if any, to take for each layer. 
    /// The system queries the layer’s delegate to determine whether to change the layer’s ``contentsScale`` property to the new scale (either 2.0 or 1.0).
    /// 
    /// Note that you don’t need to manage ``NSImage`` contents and that this method is not called on the delegate of a layer whose content is an NSImage object.
    /// 
    /// If the delegate returns true, it should make any corresponding changes to the layer’s properties, as required by the resolution change. 
    /// For example, a layer whose contents contain a ``CGImage`` object needs to determine whether an alternate ``CGImage`` object is available for the new scale factor. 
    /// If the delegate finds a suitable ``CGImage`` object, then in addition to returning true, it should set the appropriate ``CGImage`` object as the layer’s new contents.
    /// - Parameters:
    ///   - layer: The layer whose scale and content might need updating.
    ///   - newScale: The new scale of the window.
    ///   - window: The window that hosts the layer.
    /// - Returns: A Boolean value that specifies whether to change the layer’s ``contentsScale`` property.
    func layer(_ layer: CALayer, shouldInheritContentsScale newScale: Float, from window: NSWindow) -> Bool
}