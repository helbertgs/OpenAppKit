import OpenCoreGraphics
import Foundation

/// A layer that draws a color gradient over its background color, filling the shape of the layer.
/// 
/// You use a gradient layer to create a color gradient containing an arbitrary number of colors. 
/// By default, the colors are spread uniformly across the layer, but you can optionally specify locations for control over the color positions through the gradient.
@MainActor public class CAGradientLayer: CALayer {

    // MARK: - Gradient Style Properties
    
    /// An array of CGColorRef objects defining the color of each gradient stop.
    public var colors: [Any]?

    /// An optional array of Float values defining the location of each gradient stop.
    /// 
    /// The gradient stops are specified as values between 0 and 1. 
    /// The values must be monotonically increasing. 
    /// If nil, the stops are spread uniformly across the range. 
    /// Defaults to nil.
    /// 
    /// When rendered, the colors are mapped to the output color space before being interpolated.
    public var locations: [Float]?

    /// The start point of the gradient when drawn in the layer’s coordinate space.
    /// 
    /// The start point corresponds to the first stop of the gradient. 
    /// The point is defined in the unit coordinate space and is then mapped to the layer’s bounds rectangle when drawn.
    /// 
    /// Default value is (0.5,0.0).
    public var startPoint: OpenCoreGraphics.CGPoint = .init(x: 0.5, y: 0.0)

    /// The end point of the gradient when drawn in the layer’s coordinate space.
    /// 
    /// The end point corresponds to the last stop of the gradient. 
    /// The point is defined in the unit coordinate space and is then mapped to the layer’s bounds rectangle when drawn.
    /// 
    /// Default value is (0.5,1.0).
    public var endPoint: OpenCoreGraphics.CGPoint = .init(x: 0.5, y: 1.0)

    /// Style of gradient drawn by the layer.
    public var type: CAGradientLayerType = .axial
}

extension CAGradientLayer {
    @MainActor public enum CAGradientLayerType: Equatable, Hashable {
        case axial
        case conic
        case radial
    }
}