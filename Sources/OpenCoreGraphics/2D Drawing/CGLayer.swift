import Foundation

/// An offscreen context for reusing content drawn with Core Graphics.
@MainActor public class CGLayer {

    // MARK: - Examining a Layer

    /// Returns the graphics context associated with a layer object.
    /// 
    /// The context that’s returned is the context for the layer itself, not the context that you specified when you created the layer.
    public private(set) var context: CGContext?

    /// Returns the width and height of a layer object.
    /// 
    /// The width and height of the layer, in default user space coordinates.
    public private(set) var size: CGSize

    /// Reserved for future use.
    public private(set) var auxiliaryInfo: [String: Any]?

    // MARK: - Creating Layer Objects

    /// Creates a layer object that is associated with a graphics context.
    /// 
    /// After you create a CGLayer object, you should reuse it whenever you can to facilitate the Core Graphics caching strategy. 
    /// Core Graphics caches any objects that are reused, including CGLayer objects. 
    /// Objects that are reused frequently remain in the cache. In contrast, objects that are used once in a while may be moved in and out of the cache according to their frequency of use. 
    /// If you don’t reuse CGLayer objects, Core Graphics won’t cache them. 
    /// This means that you lose an opportunity to improve the performance of your application.
    /// - Parameters:
    ///   - context: The graphics context you want to create the layer relative to. The layer uses this graphics context as a reference for initialization.
    ///   - size: The size, in default user space units, of the layer relative to the graphics context.
    ///   - auxiliaryInfo: Reserved for future use. Pass nil.
    /// - Returns: A ``CGLayer`` object. You are responsible for releasing this object using the function ``CGLayerRelease`` when you no longer need the layer.
    public init?(_ context: CGContext, size: CGSize, auxiliaryInfo: [String: Any]?) {
        self.context = context
        self.size = size
        self.auxiliaryInfo = auxiliaryInfo
    }
}