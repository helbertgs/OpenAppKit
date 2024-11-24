import Foundation

@MainActor
public enum CALayerContentsFilter: Equatable, Hashable, Sendable {
    /// Linear interpolation filter.
    case linear
    /// Nearest neighbor interpolation filter.
    case nearest
    /// Trilinear minification filter. Enables mipmap generation. Some renderers may ignore this, or impose additional restrictions, such as source images requiring power-of-two dimensions.
    case trilinear
}