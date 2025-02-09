import Foundation

/// Methods that allow an object to manage the layout of a layer and its sublayers.
public protocol CALayoutManager {

    // MARK: - Managing Layout

    /// Invalidates the layout of a layer so it knows to refresh its content on the next frame.
    /// - Parameter layer: The layer whose layout needs to be refreshed.
    func invalidateLayout(of layer: CALayer)

    /// Override to customize layout of sublayers whenever the layer needs redrawing.
    /// - Parameter layer: The layer whose sublayers need to be laid out.
    func layoutSublayers(of layer: CALayer)

    /// Override to customize layer size.
    /// - Parameter layer: The layer whose size needs to be calculated.
    /// - Returns: The preferred size of the layer.
    func preferredSize(of layer: CALayer) -> CGSize
}