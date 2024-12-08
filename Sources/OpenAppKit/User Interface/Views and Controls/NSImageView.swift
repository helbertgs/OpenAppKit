import Foundation

/// A display of image data in a frame.
/// 
/// Image views can be static or editable. 
/// A static image view only displays the image that you specify. 
/// An editable image view object lets the user change the displayed image. 
/// You can also configure an image view to allow copying, pasting, deleting, and dragging of the image.
@MainActor public class NSImageView : NSControl {

    // MARK: - Specifying the image

    /// Use this property to change the image being displayed.
    public var image: NSImage?

    // MARK: - Creating the view

    /// Create a image view
    /// - Parameter image: The image displayed by the image view.
    public init(image: NSImage) {
        self.image = image
        super.init(frame: .zero)
    }
}