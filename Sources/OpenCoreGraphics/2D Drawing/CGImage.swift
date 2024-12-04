import Foundation
// import STB

/// A bitmap image or image mask.
@MainActor public class CGImage {
   
    // MARK: - Examining an Image

    /// Returns whether a bitmap image is an image mask.
    public private(set) var isMask: Bool = false

    /// Returns the height of a bitmap image.
    /// 
    /// The height in pixels of the bitmap image (or image mask).
    public var height: Int = 0

    /// Returns the width of a bitmap image.
    /// 
    /// The width, in pixels, of the specified bitmap image (or image mask).
    public var width: Int = 0

    /// Returns the decode array for a bitmap image.
    /// 
    /// For a bitmap image or image mask, for each color component in the source color space, the decode array contains a pair of values denoting the upper and lower limits of a range. 
    /// When the image is rendered, a linear transform maps the original component value into a relative number, within the designated range, that is appropriate for the destination color space. 
    /// If remapping of the image’s color values is not allowed, the returned value will be nil.
    nonisolated(unsafe) public private(set) var decode: UnsafeMutablePointer<UInt8>? = nil

    // MARK: - Creating Representations of Images

    /// Creates and returns an image representation object using the contents of the specified file.
    /// - Parameter filename: A full or relative pathname specifying the file to open. This string should include the filename extension.
    /// - Returns: An initialized instance of an NSImageRep subclass, or nil if the image data could not be read.
    public init?(contentsOfFile filename: String) {
        // stbi_set_flip_vertically_on_load(1)
        // var width: Int32 = 0
        // var height: Int32 = 0
        // var channel: Int32 = 0

        // guard let decode = stbi_load(url, &width, &height, &channel, 0) else {
        //     return nil
        // }

        // self.decode = decode
        // self.width = Int(width)
        // self.height = Int(height)
    }

    deinit { 
        // stbi_image_free(decode)
    }
}