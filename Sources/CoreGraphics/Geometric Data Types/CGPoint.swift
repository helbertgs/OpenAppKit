import Foundation

/// A structure that contains a point in a two-dimensional coordinate system.
@MainActor public struct CGPoint: Equatable, Hashable {

    // MARK: - Geometric Properties

    /// The x-coordinate of the point.
    public var x: Double

    /// The y-coordinate of the point.
    public var y: Double

    // MARK: - Special Values
    
    /// The point with location (0,0).
    public static let zero: CGPoint = .init()
        
    // MARK: - Creating Point Values

    /// Creates a point with coordinates specified as floating-point values.
    /// - Parameters:
    ///   - x: The x-coordinate of the point.
    ///   - y: The y-coordinate of the point.
    public init(x: Double = 0, y: Double = 0) {
        self.x = x
        self.y = y
    }

    /// Creates a point with coordinates specified as integer values.
    /// - Parameters:
    ///   - x: The x-coordinate of the point.
    ///   - y: The y-coordinate of the point.
    public init(x: Int, y: Int) {
        self.x = Double(x)
        self.y = Double(y)
    }

    // MARK: - Transforming Points

    /// Returns the point resulting from an affine transformation of an existing point.
    /// - Parameter t: The affine transform to apply.
    /// - Returns: A new point resulting from applying the specified affine transform to the existing point.
    public func applying(_ t: CGAffineTransform) -> CGPoint {
        fatalError("not implemented yet")
    }
}

extension CGPoint {
    /// A type that can be used as a key for encoding and decoding.
    fileprivate enum CodingKeys: String, CodingKey {
        case x
        case y
    }
}

extension CGPoint: @preconcurrency Encodable {
    /// Encodes this value into the given encoder.
    /// 
    /// If the value fails to encode anything, encoder will encode an empty keyed container in its place.
    /// This function throws an error if any values are invalid for the given encoder’s format.
    /// - Parameter encoder: The encoder to write data to.
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(x, forKey: .x)
        try container.encode(y, forKey: .y)
    }
}

extension CGPoint: @preconcurrency Decodable {
    /// Creates a new instance by decoding from the given decoder.
    /// 
    /// This initializer throws an error if reading from the decoder fails, or if the data read is corrupted or otherwise invalid.
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        x = try container.decode(Double.self, forKey: .x)
        y = try container.decode(Double.self, forKey: .y)
    }
}