import Foundation
import OpenSTB

/// A bitmap image or image mask.
public class CGImage {
   
    // MARK: - Examining an Image

    package var texture: UInt32 = 0

    /// Returns whether a bitmap image is an image mask.
    public private(set) var isMask: Bool = false

    /// Returns the height of a bitmap image.
    /// 
    /// The height in pixels of the bitmap image (or image mask).
    public var height: Int {
        if let dataProvider = dataProvider {
            return Int(dataProvider.height)
        }

        return 0
    }

    /// Returns the width of a bitmap image.
    /// 
    /// The width, in pixels, of the specified bitmap image (or image mask).
    public var width: Int {
        if let dataProvider = dataProvider {
            return Int(dataProvider.width)
        }

        return 0
    }

    /// Returns the number of bits allocated for a single color component of a bitmap image.
    /// 
    /// The number of bits used in memory for each color component of the specified bitmap image (or image mask). 
    /// Possible values are 1, 2, 4, or 8. For example, for a 16-bit RGB(A) colorspace, the function would return a value of 4 bits per color component.
    public var bitsPerComponent: Int = 0

    /// Returns the number of bits allocated for a single pixel in a bitmap image.
    /// 
    /// The number of bits used in memory for each pixel of the specified bitmap image (or image mask).
    public var bitsPerPixel: Int = 0

    /// Returns the number of bytes allocated for a single row of a bitmap image.
    public var bytesPerRow: Int = 0

    /// Return the color space for a bitmap image.
    /// 
    /// The source color space for the specified bitmap image, or ``nil`` if the image is an image mask. You are responsible for retaining and releasing the color space as necessary.
    public var colorSpace: CGColorSpace?

    /// Returns the alpha channel information for a bitmap image.
    public private(set) var alphaInfo: CGImageAlphaInfo = .none

    /// Returns the data provider for a bitmap image.
    public private(set) var dataProvider: CGDataProvider?

    /// Returns the decode array for a bitmap image.
    /// 
    /// For a bitmap image or image mask, for each color component in the source color space, the decode array contains a pair of values denoting the upper and lower limits of a range. 
    /// When the image is rendered, a linear transform maps the original component value into a relative number, within the designated range, that is appropriate for the destination color space. 
    /// If remapping of the image’s color values is not allowed, the returned value will be nil.
    public var decode: UnsafeMutablePointer<UInt8>? {
        dataProvider?.info
    }

    /// Returns the interpolation setting for a bitmap image.
    /// 
    /// Returns ``true`` if interpolation is enabled for the specified bitmap image (or image mask), otherwise, returns ``false``.
    /// The interpolation setting specifies whether an edge-smoothing algorithm is applied to the associated image.
    public private(set) var shouldInterpolate: Bool = false

    // MARK: - Creating Representations of Images

    /// Create an empty image.
    public init() {
    }

    /// Creates and returns an image representation object using the contents of the specified file.
    /// - Parameter url: A full or relative pathname specifying the file to open. This string should include the filename extension.
    /// - Returns: An initialized instance of an NSImageRep subclass, or nil if the image data could not be read.
    public init?(url: URL) {
        self.dataProvider = CGDataProvider(url: url)
    }

    public init?(_ dataProvider: CGDataProvider) {
        self.dataProvider = dataProvider
    }

    // MARK: - Creating Images by Modifying an Image

    /// Creates a bitmap image using the data contained within a subregion of an existing bitmap image.
    /// 
    /// Cropping removes content around the designated rectangle; it cuts out the desired area of the input image and returns an image of the cropped size.
    /// - Parameter rect: A rectangle specifying the portion of the image to keep.
    /// - Returns: A ``CGImage`` object that specifies a subimage of the image. If the rect parameter defines an area that is not in the image, returns ``nil``.
    public func cropping(to rect: OpenCoreGraphics.CGRect) -> CGImage? {
        nil
    }

    /// Creates a bitmap image from an existing image and an image mask.
    /// 
    /// The resulting image depends on whether the mask parameter is an image mask or an image. If the mask parameter is an image mask, then the source samples of the image mask act as an inverse alpha value. 
    /// That is, if the value of a source sample in the image mask is S, then the corresponding region in image is blended with the destination using an alpha value of (1-S). 
    /// For example, if S is 1, then the region is not painted, while if S is 0, the region is fully painted.
    /// 
    /// If the mask parameter is an image, then it serves as an alpha mask for blending the image onto the destination. 
    /// The source samples of mask' act as an alpha value. 
    /// If the value of the source sample in mask is S, then the corresponding region in image is blended with the destination with an alpha of S. 
    /// For example, if S is 0, then the region is not painted, while if S is 1, the region is fully painted.
    /// - Parameter mask: A mask. If the mask is an image, it must be in the DeviceGray color space, must not have an alpha component, and may not itself be masked by an image mask or a masking color. If the mask is not the same size as the image specified by the image parameter, the mask is scaled to fit the image.
    /// - Returns: An image created by masking image with mask. 
    public func masking(_ mask: CGImage) -> CGImage? {
        nil
    }
}