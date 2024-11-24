import Foundation

/// The standard transform matrix used throughout Core Animation.
/// 
/// The transform matrix is used to rotate, scale, translate, skew, and project the layer content. 
/// Functions are provided for creating, concatenating, and modifying CATransform3D data.
@MainActor
public struct CATransform3D: Equatable, Hashable, Sendable {
    public init() {
    }
}