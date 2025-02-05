import Foundation

/// Storage options for alpha component data.
/// 
/// A ``CGImageAlphaInfo`` constant specifies 
/// (1) whether a bitmap contains an alpha channel, (2) where the alpha bits are located in the image data, and (3) whether the alpha value is premultiplied. 
/// You can obtain a ``CGImageAlphaInfo`` constant for an image by calling the ``alphaInfo`` function. 
/// (You provide a ``CGBitmapInfo`` constant to the function init(width:height:bitsPerComponent:bitsPerPixel:bytesPerRow:space:bitmapInfo:provider:decode:shouldInterpolate:intent:), part of which is a CGImageAlphaInfo constant.)
/// 
/// Alpha blending is accomplished by combining the color components of the source image with the color components of the destination image using the linear interpolation formula, where “source” is one color component of one pixel of the new paint and “destination” is one color component of the background image.
/// 
/// Core Graphics supports premultiplied alpha only for images. You should not premultiply any other color values specified in Core Graphics.
public enum CGImageAlphaInfo {
    /// The alpha component is stored in the most significant bits of each pixel. For example, non-premultiplied ARGB.
    case first

    /// The alpha component is stored in the least significant bits of each pixel. For example, non-premultiplied RGBA.
    case last

    /// There is no alpha channel.
    case none

    /// There is no alpha channel. If the total size of the pixel is greater than the space required for the number of color components in the color space, the most significant bits are ignored.
    case noneSkipFirst

    /// There is no color data, only an alpha channel.
    case alphaOnly

    /// There is no alpha channel.
    case noneSkipLast

    /// The alpha component is stored in the most significant bits of each pixel and the color components have already been multiplied by this alpha value. For example, premultiplied ARGB.
    case premultipliedFirst

    /// The alpha component is stored in the least significant bits of each pixel and the color components have already been multiplied by this alpha value. For example, premultiplied RGBA.
    case premultipliedLast
}