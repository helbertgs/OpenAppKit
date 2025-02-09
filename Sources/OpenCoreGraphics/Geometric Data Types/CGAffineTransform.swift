import Foundation

/// An affine transformation matrix for use in drawing 2D graphics.
/// 
/// 
public struct CGAffineTransform: BitwiseCopyable, Copyable, Codable, Equatable, Hashable, Sendable {

    // MARK: - Instance Properties

    /// Checks whether an affine transform is the identity transform.
    public var isIdentity: Bool {
        self == CGAffineTransform.identity
    }

    /// The entry at position [1,1] in the matrix.
    public let a: Double

    /// The entry at position [1,2] in the matrix.
    public let b: Double

    /// The entry at position [2,1] in the matrix.
    public let c: Double

    /// The entry at position [2,2] in the matrix.
    public let d: Double

    /// The entry at position [3,1] in the matrix.
    public let tx: Double

    /// The entry at position [3,2] in the matrix.
    public let ty: Double

    // MARK: - Type Properties

    /// The identity transform.
    public static var identity: CGAffineTransform {
        CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
    }
    
    // MARK: - Initializers

    /// Returns an affine transformation matrix constructed from a rotation value you provide.
    /// - Parameter angle: The angle, in radians, by which this matrix rotates the coordinate system axes. 
    ///                    In iOS, a positive value specifies counterclockwise rotation and a negative value specifies clockwise rotation. 
    ///                    In macOS, a positive value specifies clockwise rotation and a negative value specifies counterclockwise rotation.
    public init(rotationAngle angle: Double) {
        self.a = cos(angle)
        self.b = sin(angle)
        self.c = -sin(angle)
        self.d = cos(angle)
        self.tx = 0
        self.ty = 0
    }

    /// Returns an affine transformation matrix constructed from scaling values you provide.
    /// - Parameters:
    ///   - sx: The factor by which to scale the x-axis of the coordinate system.
    ///   - sy: The factor by which to scale the y-axis of the coordinate system.
    public init(scaleX sx: Double, y sy: Double) {
        self.a = sx
        self.b = 0
        self.c = 0
        self.d = sy
        self.tx = 0
        self.ty = 0
    }

    /// Returns an affine transformation matrix constructed from translation values you provide.
    /// - Parameters:
    ///   - tx: The value by which to move the x-axis of the coordinate system.
    ///   - ty: The value by which to move the y-axis of the coordinate system.
    public init(translationX tx: Double, y ty: Double) {
        self.a = 1
        self.b = 0
        self.c = 0
        self.d = 1
        self.tx = tx
        self.ty = ty
    }

    /// Returns an affine transformation matrix constructed from values you provide.
    public init(a: Double = 1, b: Double = 0, c: Double = 0, d: Double = 1, tx: Double = 0, ty: Double = 0) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        self.tx = tx
        self.ty = ty
    }

    // MARK: - Instance Methods

    /// Returns an affine transformation matrix constructed by combining two existing affine transforms.
    /// 
    /// Concatenation combines two affine transformation matrices by multiplying them together. 
    /// You might perform several concatenations in order to create a single affine transform that contains the cumulative effects of several transformations.
    /// 
    /// Note that matrix operations are not commutative—the order in which you concatenate matrices is important. 
    /// That is, the result of multiplying matrix t1 by matrix t2 does not necessarily equal the result of multiplying matrix t2 by matrix t1.
    /// - Parameters:
    ///   - t2: The affine transform to concatenate to this affine transform.
    /// - Returns: A new affine transformation matrix. That is, t’ = t1*t2.
    public func concatenating(_ t2: CGAffineTransform) -> CGAffineTransform {
        let a = self.a * t2.a + self.b * t2.c
        let b = self.a * t2.b + self.b * t2.d
        let c = self.c * t2.a + self.d * t2.c
        let d = self.c * t2.b + self.d * t2.d
        let tx = self.tx * t2.a + self.ty * t2.c + t2.tx
        let ty = self.tx * t2.b + self.ty * t2.d + t2.ty
        return CGAffineTransform(a: a, b: b, c: c, d: d, tx: tx, ty: ty)
    }

    /// Returns an affine transformation matrix constructed by inverting an existing affine transform.
    /// 
    /// Inversion is generally used to provide reverse transformation of points within transformed objects. 
    /// Given the coordinates (x,y), which have been transformed by a given matrix to new coordinates (x’,y’), transforming the coordinates (x’,y’) by the inverse matrix produces the original coordinates (x,y).
    /// - Returns: A new affine transformation matrix. If the affine transform passed in parameter t cannot be inverted, the affine transform is returned unchanged.
    public func inverted() -> CGAffineTransform {
        let determinant = a * d - b * c
        guard determinant != 0 else { return self }
        let invdet = 1.0 / determinant
        let a = d * invdet
        let b = -b * invdet
        let c = -c * invdet
        let d = a * invdet
        let tx = (c * ty - d * tx) * invdet
        let ty = (b * tx - a * ty) * invdet
        return CGAffineTransform(a: a, b: b, c: c, d: d, tx: tx, ty: ty)
    }

    /// Returns an affine transformation matrix constructed by rotating an existing affine transform.
    /// 
    /// You use this function to create a new affine transformation matrix by adding a rotation value to an existing affine transform. 
    /// The resulting structure represents a new affine transform, which you can use (and reuse, if you want) to rotate a coordinate system.
    /// 
    /// The actual direction of rotation is dependent on the coordinate system orientation of the target platform, which is different in iOS and macOS.
    /// - Parameter angle: The angle, in radians, by which to rotate the affine transform.
    /// - Returns: A new affine transformation matrix.
    public func rotated(by angle: Double) -> CGAffineTransform {
        self.concatenating(CGAffineTransform(rotationAngle: angle))
    }

    /// Returns an affine transformation matrix constructed by scaling an existing affine transform.
    /// 
    /// You use this function to create a new affine transformation matrix by adding scaling values to an existing affine transform. 
    /// The resulting structure represents a new affine transform, which you can use (and reuse, if you want) to scale a coordinate system.
    /// - Parameters:
    ///   - sx: The value by which to scale x values of the affine transform.
    ///   - sy: The value by which to scale y values of the affine transform.
    /// - Returns: A new affine transformation matrix.
    public func scaledBy(x sx: Double, y sy: Double) -> CGAffineTransform {
        self.concatenating(CGAffineTransform(scaleX: sx, y: sy))
    }

    /// Returns an affine transformation matrix constructed by translating an existing affine transform.
    /// 
    /// You use this function to create a new affine transform by adding translation values to an existing affine transform. 
    /// The resulting structure represents a new affine transform, which you can use (and reuse, if you want) to move a coordinate system.
    /// - Parameters:
    ///   - tx: The value by which to move x values with the affine transform.
    ///   - ty: The value by which to move y values with the affine transform.
    /// - Returns: A new affine transformation matrix.
    public func translatedBy(x tx: Double, y ty: Double) -> CGAffineTransform {
        self.concatenating(CGAffineTransform(translationX: tx, y: ty))
    }
}