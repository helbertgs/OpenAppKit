import Foundation

/// The standard transform matrix used throughout Core Animation.
/// 
/// The transform matrix is used to rotate, scale, translate, skew, and project the layer content. 
/// Functions are provided for creating, concatenating, and modifying CATransform3D data.
@MainActor
public struct CATransform3D: BitwiseCopyable, Copyable, Equatable, Hashable, Sendable {

    // MARK: - Static Properties

    /// The identity transform matrix.
    public static var identity: CATransform3D {
        .init(
            m11: 1, m12: 0, m13: 0, m14: 0, 
            m21: 0, m22: 1, m23: 0, m24: 0, 
            m31: 0, m32: 0, m33: 1, m34: 0, 
            m41: 0, m42: 0, m43: 0, m44: 1
        )
    }
    
    // MARK: - Instance Properties

    /// The entry at position 1,1 in the matrix.
    public let m11: Float

    /// The entry at position 1,2 in the matrix.
    public let m12: Float

    /// The entry at position 1,3 in the matrix.
    public let m13: Float

    /// The entry at position 1,4 in the matrix.
    public let m14: Float

    /// The entry at position 2,1 in the matrix.
    public let m21: Float

    /// The entry at position 2,2 in the matrix.
    public let m22: Float

    /// The entry at position 2,3 in the matrix.
    public let m23: Float

    /// The entry at position 2,4 in the matrix.
    public let m24: Float

    /// The entry at position 3,1 in the matrix.
    public let m31: Float

    /// The entry at position 3,2 in the matrix.
    public let m32: Float

    /// The entry at position 3,3 in the matrix.
    public let m33: Float

    /// The entry at position 3,4 in the matrix.
    public let m34: Float

    /// The entry at position 4,1 in the matrix.
    public let m41: Float

    /// The entry at position 4,2 in the matrix.
    public let m42: Float

    /// The entry at position 4,3 in the matrix.
    public let m43: Float

    /// The entry at position 4,4 in the matrix.
    public let m44: Float

    public init(m11: Float = 0, m12: Float = 0, m13: Float = 0, m14: Float = 0, m21: Float = 0, m22: Float = 0, m23: Float = 0, m24: Float = 0, m31: Float = 0, m32: Float = 0, m33: Float = 0, m34: Float = 0, m41: Float = 0, m42: Float = 0, m43: Float = 0, m44: Float = 0) {
        self.m11 = m11
        self.m12 = m12
        self.m13 = m13
        self.m14 = m14
        self.m21 = m21
        self.m22 = m22
        self.m23 = m23
        self.m24 = m24
        self.m31 = m31
        self.m32 = m32
        self.m33 = m33
        self.m34 = m34
        self.m41 = m41
        self.m42 = m42
        self.m43 = m43
        self.m44 = m44
    }

    package static func ortho(_ left: Float, _ right: Float, _ top: Float, _ bottom: Float, near: Float, far: Float) -> CATransform3D {
        .init(
            m11: 2.0 / (right - left), 
            m14: -(right + left)/(right - left),
            m22: 2.0 / (top - bottom),
            m24: -(top + bottom) / (top - bottom),
            m33: -2.0 / (far - near),
            m34: -(far + near) / (far - near),
            m44: 1
        )
    }
}