import Foundation
import OpenCoreGraphics

public class CAConstraintLayoutManager : CALayoutManager, @unchecked Sendable {
    public init() {
    }

    // MARK: - Managing Layout

    /// Invalidates the layout of a layer so it knows to refresh its content on the next frame.
    /// - Parameter layer: The layer whose layout needs to be refreshed.
    public func invalidateLayout(of layer: CALayer) {
    }

    /// Override to customize layout of sublayers whenever the layer needs redrawing.
    /// - Parameter layer: The layer whose sublayers need to be laid out.
    public func layoutSublayers(of layer: CALayer) {
    }

    /// Override to customize layer size.
    /// - Parameter layer: The layer whose size needs to be calculated.
    /// - Returns: The preferred size of the layer.
    public func preferredSize(of layer: CALayer) -> OpenCoreGraphics.CGSize {
        return .zero
    }
}