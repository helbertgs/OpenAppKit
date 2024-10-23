import Foundation

/// A structure that contains the location and dimensions of a rectangle.
/// 
/// In the default Core Graphics coordinate space, the origin is located in the lower-left corner of the rectangle and the rectangle extends towards the upper-right corner. 
/// If the context has a flipped-coordinate space—often the case on iOS—the origin is in the upper-left corner and the rectangle extends towards the lower-right corner.
@MainActor
public struct CGRect: Equatable, Hashable {

    // MARK: - Basic Geometric Properties

    /// A point that specifies the coordinates of the rectangle’s origin.
    public var origin: CGPoint

    /// A size that specifies the height and width of the rectangle.
    public var size: CGSize

    // MARK: - Special Values

    /// A rectangle that has infinite extent.
    public static let infinite: CGRect = .init()

    /// The null rectangle, representing an invalid value.
    public static let null: CGRect = .init()

    /// The rectangle whose origin and size are both zero.
    public static let zero: CGRect = .init()

    // MARK: - Creating Rectangle Values

    /// Creates a rectangle with the specified origin and size.
    /// - Parameters:
    ///   - origin: A point that specifies the coordinates of the rectangle’s origin.
    ///   - size: A size that specifies the height and width of the rectangle.
    public init(origin: CGPoint = .zero, size: CGSize = .zero) {
        self.origin = origin
        self.size = size
    }

    /// Creates a rectangle with coordinates and dimensions specified as floating-point values.
    /// - Parameters:
    ///   - x: The x-coordinate of the rectangle.
    ///   - y: The y-coordinate of the rectangle.
    ///   - width: A width value.
    ///   - height: A height value.
    public init(x: Double, y: Double, width: Double, height: Double) {
        self.origin = .init(x: x, y: y)
        self.size = .init(width: width, height: height)
    }

    /// Creates a rectangle with coordinates and dimensions specified as integer values.
    /// - Parameters:
    ///   - x: The x-coordinate of the rectangle.
    ///   - y: The y-coordinate of the rectangle.
    ///   - width: A width value.
    ///   - height: A height value.
    public init(x: Int, y: Int, width: Int, height: Int) {
        self.origin = .init(x: x, y: y)
        self.size = .init(width: width, height: height)
    }

    // MARK: - Calculated Geometric Properties
    
    /// Returns the height of a rectangle.
    public var height: Double { 0 }

    /// Returns the width of a rectangle.
    public var width: Double { 0 }

    /// Returns the smallest value for the x-coordinate of the rectangle.
    public var minX: Double { 0 }

    /// Returns the x- coordinate that establishes the center of a rectangle.
    public var midX: Double { 0 }

    /// Returns the largest value of the x-coordinate for the rectangle.
    public var maxX: Double { 0 }

    /// Returns the smallest value for the y-coordinate of the rectangle.
    public var minY: Double { 0 }

    /// Returns the y-coordinate that establishes the center of the rectangle.
    public var midY: Double { 0 }

    /// Returns the largest value for the y-coordinate of the rectangle.
    public var maxY: Double { 0 }
}