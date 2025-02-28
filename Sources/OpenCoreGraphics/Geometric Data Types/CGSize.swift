import Foundation

/// A structure that contains width and height values.
/// 
/// A CGSize structure is sometimes used to represent a distance vector, rather than a physical size. As a vector, its values can be negative. 
/// To normalize a CGRect structure so that its size is represented by positive values, call the CGRectStandardize(_:) function.
public struct CGSize: Equatable, Hashable, Sendable {

    // MARK: - Geometric Properties

    /// A width value.
    public var width: Float

    /// A height value.
    public var height: Float

    // MARK: - Special Values
    
    /// The size whose width and height are both zero.
    public static let zero: OpenCoreGraphics.CGSize = .init()

    // MARK: - Creating Size Values

    /// Creates a size with specified as floating-point values.
    /// - Parameters:
    ///   - width: A width value.
    ///   - height: A height value.
    public init(width: Float = 0, height: Float = 0) {
        self.width = width
        self.height = height
    }

    /// Creates a size with specified as integer values.
    /// - Parameters:
    ///   - width: A width value.
    ///   - height: A height value.
    public init(width: Int, height: Int) {
        self.width = Float(width)
        self.height = Float(height)
    }

    /// Creates a size with specified as integer values.
    /// - Parameters:
    ///   - width: A width value.
    ///   - height: A height value.
    public init(width: Int32, height: Int32) {
        self.width = Float(width)
        self.height = Float(height)
    }

    // MARK: - Transforming Sizes

    /// Returns the height and width resulting from a transformation of an existing height and width.
    /// - Parameter t: The affine transform to apply.
    /// - Returns: A new size resulting from applying the specified affine transform to the existing size.
    public func applying(_ t: CGAffineTransform) -> OpenCoreGraphics.CGSize {
        fatalError("Not implemented yet")
    }
}

extension CGSize {
    /// A type that can be used as a key for encoding and decoding.
    fileprivate enum CodingKeys: String, CodingKey {
        case width
        case height
    }
}

extension CGSize: Encodable {
    /// Encodes this value into the given encoder.
    /// 
    /// If the value fails to encode anything, encoder will encode an empty keyed container in its place.
    /// This function throws an error if any values are invalid for the given encoder’s format.
    /// - Parameter encoder: The encoder to write data to.
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(width, forKey: .width)
        try container.encode(height, forKey: .height)
    }
}

extension CGSize: Decodable {
    /// Creates a new instance by decoding from the given decoder.
    /// 
    /// This initializer throws an error if reading from the decoder fails, or if the data read is corrupted or otherwise invalid.
    /// - Parameter decoder: The decoder to read data from.
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        width = try container.decode(Float.self, forKey: .width)
        height = try container.decode(Float.self, forKey: .height)
    }
}

extension CGSize : CustomStringConvertible {
    /// A textual representation of this instance.
    public var description: String {
        "CGSize(width: \(width), height: \(height))"
    }
}