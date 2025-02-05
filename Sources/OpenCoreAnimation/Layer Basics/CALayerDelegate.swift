import Foundation
import OpenCoreGraphics

/// Methods your app can implement to respond to layer-related events.
/// 
/// You can implement the methods of this protocol to provide the layer’s content, handle the layout of sublayers, and provide custom animation actions to perform. 
/// The object that implements this protocol must be assigned to the delegate property of the layer object.
@MainActor
public protocol CALayerDelegate : AnyObject {
    
    // MARK: - Providing the Layer’s Content

    /// Tells the delegate to implement the display process.
    /// 
    /// The ``display(_:)`` delegate method is called when the layer is marked for its content to be reloaded, typically initiated by the ``setNeedsDisplay()`` method. 
    /// The typical technique for updating is to set the layer’s contents property.
    /// - Parameter layer: The layer whose contents need updating.
    func display(_ layer: CALayer)

    /// Tells the delegate to implement the display process using the layer’s context.
    /// 
    /// The draw(_:in:) method is called when the layer is marked for its content to be reloaded, typically with the setNeedsDisplay() method. 
    /// It is not called if the delegate implements the display(_:) method. 
    /// You can use the context to draw vectors, such as curves and lines, or images with the draw(_:in:byTiling:) method.
    /// - Parameters:
    ///   - layer: The layer whose contents need to be drawn.
    ///   - context: The graphics context to use for drawing. The graphics context incorporates the appropriate scale factor for drawing to the target screen
    func draw(_ layer: CALayer, in context: CGContext)

    /// Notifies the delegate of an imminent draw.
    /// 
    /// The ``layerWillDraw(_:)`` method is called before ``draw(_:in:)``. 
    /// You can use this method to configure any layer state affecting contents prior to ``draw(_:in:)`` such as contentsFormat and ``isOpaque``.
    /// 
    /// - Important: This method is not called if the delegate implements display(_:).
    /// - Parameter layer: The layer whose contents will be drawn.
    func layerWillDraw(_ layer: CALayer)

    // MARK: - Laying Out Sublayers

    /// Tells the delegate a layer’s bounds have changed.
    /// 
    /// The ``layoutSublayers(of:)`` method is called when a layer’s bounds have changed and its sublayers may need rearranging, for example by changing its frame’s size. 
    /// You can implement this method if you need precise control over the layout of your layer’s sublayers.
    /// - Parameter layer: The layer that requires layout of its sublayers.
    func layoutSublayers(of layer: CALayer)

    // MARK: - Providing a Layer’s Actions

    /// Returns the default action of the ``action(forKey:)`` method.
    /// 
    /// A layer’s delegate that implements this method returns an action for a specified key and stops any further searches (i.e. actions for the same key in the layer’s actions dictionary or specified by ``defaultAction(forKey:)`` are not returned).
    /// - Parameters:
    ///   - layer: The layer that is the target of the action.
    ///   - event: The identifier of the action.
    /// - Returns: An object implementing the ``CAAction`` protocol or nil if the delegate does not specify a behavior for the specified key.
    func action(for layer: CALayer, forKey event: String) -> (any CAAction)?
}

extension CALayerDelegate {
    /// Notifies the delegate of an imminent draw.
    /// 
    /// The ``layerWillDraw(_:)`` method is called before ``draw(_:in:)``. 
    /// You can use this method to configure any layer state affecting contents prior to ``draw(_:in:)`` such as contentsFormat and ``isOpaque``.
    /// 
    /// - Important: This method is not called if the delegate implements display(_:).
    /// - Parameter layer: The layer whose contents will be drawn.
    public func layerWillDraw(_ layer: CALayer) {        
    }

    // MARK: - Laying Out Sublayers

    /// Tells the delegate a layer’s bounds have changed.
    /// 
    /// The ``layoutSublayers(of:)`` method is called when a layer’s bounds have changed and its sublayers may need rearranging, for example by changing its frame’s size. 
    /// You can implement this method if you need precise control over the layout of your layer’s sublayers.
    /// - Parameter layer: The layer that requires layout of its sublayers.
    public func layoutSublayers(of layer: CALayer) {
    }

    // MARK: - Providing a Layer’s Actions

    /// Returns the default action of the ``action(forKey:)`` method.
    /// 
    /// A layer’s delegate that implements this method returns an action for a specified key and stops any further searches (i.e. actions for the same key in the layer’s actions dictionary or specified by ``defaultAction(forKey:)`` are not returned).
    /// - Parameters:
    ///   - layer: The layer that is the target of the action.
    ///   - event: The identifier of the action.
    /// - Returns: An object implementing the ``CAAction`` protocol or nil if the delegate does not specify a behavior for the specified key.
    public func action(for layer: CALayer, forKey event: String) -> (any CAAction)? {
        nil
    }
}