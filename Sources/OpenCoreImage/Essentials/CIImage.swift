import Foundation
import OpenCoreGraphics
import OpenSTB
@preconcurrency import OpenGLAD

/// A representation of an image to be processed or produced by Core Image filters.
@MainActor 
public class CIImage {

    // MARK: - Getting Image Information

    /// A rectangle that specifies the extent of the image.
    public private(set) var extent: OpenCoreGraphics.CGRect = .zero

    /// A dictionary containing metadata about the image.
    /// 
    /// If the ``CIImage`` object is the output of a filter (or filter chain), this property’s value is the metadata from the filter’s original input image.
    public private(set) var properties: [String : Any] = [:]

    /// The URL from which the image was loaded.
    /// 
    /// A URL is available only if the image object was created with a URL (such as with the init(contentsOf:) method or related methods). 
    /// Otherwise, this property’s value is nil.
    public private(set) var url: URL?

    /// The color space of the image.
    public private(set) var colorSpace: OpenCoreGraphics.CGColorSpace?

    // MARK: - Accessing Original Image Content
    public private(set) var cgImage: OpenCoreGraphics.CGImage?

    // MARK: - Creating an Image

    /// Initializes an image object with a Core Graphics image.
    /// - Parameter image: A Core Graphics image (CGImage) object.
    public init(cgImage image: OpenCoreGraphics.CGImage) {
        self.cgImage = image
    }

    /// Creates and returns an empty image object.
    public convenience init() {
        self.init(cgImage: .init())
    }

    /// Initializes an image of infinite extent whose entire content is the specified color.
    /// - Parameters:
    ///   - red: The unpremultiplied red component of the color.
    ///   - green: The unpremultiplied green component of the color.
    ///   - blue: The unpremultiplied blue component of the color.
    ///   - alpha: The alpha (opacity) component of the color.
    public init(red: Int, green: Int, blue: Int, alpha: Int) {
        let pixelData = [red, green, blue, alpha]
        let width = 256
        let height = 256
        var textureID: UInt32 = 0
        var textureData = Array(repeating: pixelData, count: width * height).flatMap { $0 }

        glad_glGenTextures(1, &textureID)
        glad_glBindTexture(GLenum(GL_TEXTURE_2D), textureID)
        glad_glTexParameteri(GLenum(GL_TEXTURE_2D), GLenum(GL_TEXTURE_WRAP_S), GL_REPEAT)
        glad_glTexParameteri(GLenum(GL_TEXTURE_2D), GLenum(GL_TEXTURE_WRAP_T), GL_REPEAT)
        glad_glTexParameteri(GLenum(GL_TEXTURE_2D), GLenum(GL_TEXTURE_MIN_FILTER), GL_LINEAR)
        glad_glTexParameteri(GLenum(GL_TEXTURE_2D), GLenum(GL_TEXTURE_MAG_FILTER), GL_LINEAR)
        glad_glTexImage2D(GLenum(GL_TEXTURE_2D), 0, GL_RGBA, GLsizei(width), GLsizei(height), 0, GLenum(GL_RGBA), GLenum(GL_UNSIGNED_BYTE), &textureData)
        glad_glGenerateMipmap(GLenum(GL_TEXTURE_2D))

        self.cgImage = .init()
    }
}