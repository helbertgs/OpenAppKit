import Foundation

/// Levels of interpolation quality for rendering an image.
public enum CGInterpolationQuality: String, Codable, Equatable, Hashable, Sendable {

    /// The default level of quality.
    case `default`

    /// No interpolation.
    case none

    /// A low level of interpolation quality. This setting may speed up image rendering.
    case low

    /// A medium level of interpolation quality. This setting is slower than the low setting but faster than the high setting.
    case medium

    /// A high level of interpolation quality. This setting may slow down image rendering.
    case high
}