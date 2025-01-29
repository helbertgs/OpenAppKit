import Foundation
import OpenCoreGraphics

public typealias NSImageRep = AnyObject

/// A high-level interface for manipulating image data.
@MainActor public class NSImage {

    // MARK: - Managing Loading and Drawing of Images

    /// The image’s delegate object.
    /// 
    /// By default, this property contains nil.
    public weak var delegate: (any NSImageDelegate)?

    // MARK: - Setting Attributes of Images

    package var cgImage: CGImage

    /// The size of the image.
    /// 
    /// Defaults to {0.0, 0.0} if no size has been set and the size cannot be determined from any of the receiver’s image representations. 
    /// If the size of the image hasn’t already been set when an image representation is added, the size is taken from the image representation’s data. 
    /// For EPS images, the size is taken from the image’s bounding box. 
    /// For TIFF images, the size is taken from the ImageLength and ImageWidth attributes.
    /// 
    /// Changing the size of an NSImage after it has been used effectively resizes the image. 
    /// Changing the size invalidates all its caches and frees them. When the image is next composited, the selected representation will draw itself in an offscreen window to recreate the cache.
    public var size: OpenCoreGraphics.CGSize = .zero

    /// A Boolean value that determines whether the image represents a template image.
    /// 
    /// Images you mark as template images should consist of only black and clear colors. 
    /// You can use the alpha channel in the image to adjust the opacity of black content, however.
    /// 
    /// Template images are not intended to be used as standalone images. 
    /// They are always mixed with other content and processed to create the desired appearance. 
    /// You can mark an image as a “template image” to notify clients who care that the image contains only black and clear content. 
    /// The most common use for template images is in image cells. 
    /// 
    /// For example, you might use a template image to provide the content for a button or segmented control. 
    /// Cocoa cells take advantage of the nature of template images—that is, their simplified color scheme and use of transparency—to improve the appearance of the corresponding control in each of its supported states.
    public var isTemplate: Bool = false

    // MARK: - Determining Supported Types of Images

    /// Returns an array of UTI strings identifying the image types supported by the registered image representation objects, either directly or through a user-installed filter service.
    /// 
    /// The returned list includes UTIs all file types supported by registered subclasses of ``NSImageRep`` plus those that can be converted to a supported type by a user-installed filter service. 
    /// You can use the returned UTI strings with any method that supports UTIs.
    /// 
    /// Do not override this method directly. 
    /// If your app supports custom image types, create and register an ``NSImageRep`` subclass that handles those types.
    public static var imageTypes: [String] {
        []
    }

    /// Returns an array of UTI strings identifying the image types supported directly by the registered image representation objects.
    /// 
    /// The returned list includes UTI strings only for those file types that are supported directly by registered subclasses of ``NSImageRep``. 
    /// It does not include types that are supported through user-installed filter services. 
    /// You can use the returned UTI strings with any method that supports UTIs.
    /// 
    /// Do not override this method directly. 
    /// If your app supports custom image types, create and register an ``NSImageRep`` subclass that handles those types.
    public static var imageUnfilteredTypes: [String] {
        []
    }

    // MARK: - Creating Images by Name

    /// Returns the image object associated with the specified name.
    /// - Parameter name: The name associated with the desired image. This can be a name you assigned to the image or the name of an image file in your app bundle.
    public init?(named name: NSImage.Name) {
        fatalError("Not implemented yet")
    }

    // MARK: - Creating Dynamically Drawn Images

    /// Creates and returns an image object whose contents are drawn using the specified block.
    /// - Parameters:
    ///   - size: The size of the image, measured in points.
    ///   - flipped: ``true`` to apply a flip transformation to the graphics context before drawing or ``false`` to draw using the default Cocoa coordinate system orientation.
    ///   - drawingHandler: A block that draws the contents of the image representation. 
    /// The image representation copies the block and stores it for later use. 
    /// It is not executed until you draw the image. 
    /// Because the block is executed later, AppKit executes it on the same thread on which you draw the image itself, which can be any thread of your app. 
    /// Therefore, the block must be safe to call from any thread. The block takes the following parameter:
    ///   - dstRect: The destination rectangle in which to draw. The coordinates of this rectangle are specified in points.  
    public convenience init(size: NSSize, flipped drawingHandlerShouldBeCalledWithFlippedContext: Bool, drawingHandler: @escaping (NSRect) -> Bool) {
        fatalError("Not implemented yet")
    }

    // MARK: - Creating Images from Resource Files

    /// Initializes and returns an image object with the contents of the specified file.
    /// 
    /// Unlike ``init(byReferencingFile:)``, which initializes an ``NSImage`` object lazily, this method immediately opens the specified file and creates one or more image representations from its data.
    /// 
    /// The filename parameter should include the file extension that identifies the type of the image data. 
    /// This method looks for an ``NSImageRep`` subclass that handles that data type from among those registered with ``NSImage``.
    /// - Parameter fileName: A full or relative path name specifying the file with the desired image data. Relative paths must be relative to the current working directory.
    public convenience init?(contentsOfFile fileName: String) {
        fatalError("Not implemented yet")
    }

    /// Initializes and returns an image object with the contents of the specified URL.
    /// - Parameter url: The URL identifying the image.
    public convenience init?(contentsOf url: URL) {
        fatalError("Not implemented yet")
    }

    // MARK: - Creating Images from Existing Data 

    /// Initializes and returns an image object using the provided image data.
    /// 
    /// Use this method in cases where you already have image data in a supported format and want to obtain an ``NSImage`` object that represents that data. 
    /// This method initializes the object with an image representation that is most appropriate for the type of data you provided.
    /// - Parameter data: The data object containing the image data. The data can be in any format that macOS supports, including PDF, PICT, EPS, or any number of bitmap data formats.
    public convenience init?(data: Data) {
        fatalError("Not implemented yet")
    }

    /// Creates a new image using the contents of the provided image.
    /// 
    /// Don’t assume anything about the image, other than drawing it is equivalent to drawing the source image.
    /// This is not a designated initializer.
    /// - Parameters:
    ///   - cgImage: The source image.
    ///   - size: The size of the new image. Use zero to have the new image adopt the pixel dimensions of the source image.
    public convenience init(cgImage: CGImage, size: OpenCoreGraphics.CGSize) {
        fatalError("Not implemented yet")
    }

    // MARK: - Creating Empty Images

    /// Initializes and returns an image object with the specified dimensions.
    /// 
    /// This method does not add any image representations to the image object. 
    /// It is permissible to initialize the image object by passing a size of (0.0, 0.0); however, you must set the size to a non-zero value before using it or an exception will be raised.
    /// 
    /// After using this method to initialize an image object, you are expected to provide the image contents before trying to draw the image. 
    /// You might lock focus on the image and draw to the image or you might explicitly add an image representation that you created.
    /// - Parameter size: The size of the image, measured in points.
    public init(size: OpenCoreGraphics.CGSize) {
        self.cgImage = CGImage()
        self.size = size
    }

    // MARK: - Working with Representations of Images

    /// An array containing all of the image object’s image representations.
    /// 
    /// This property can contain zero or more ``NSImageRep`` objects.
    public private(set) var representations: [NSImageRep] = []

    /// Adds the specified image representation object to the image.
    /// 
    /// After invoking this method, you may need to explicitly set features of the new image representation, such as the size, number of colors, and so on. 
    /// This is true particularly when the ``NSImage`` object has multiple image representations to choose from. 
    /// See ``NSImageRep`` and its subclasses for the methods you use to complete initialization.
    /// 
    /// Any representation added by this method is retained by the receiver. 
    /// Image representations cannot be shared among multiple ``NSImage`` objects.
    /// - Parameter imageRep: 
    public func addRepresentation(_ imageRep: NSImageRep) {
        fatalError("Not implemented yet")
    }

    /// Adds an array of image representation objects to the image.
    /// 
    /// After invoking this method, you may need to explicitly set features of the new image representations, such as their size, number of colors, and so on. 
    /// This is true particularly when the ``NSImage`` object has multiple image representations to choose from. 
    /// See ``NSImageRep`` and its subclasses for the methods you use to complete initialization.
    /// 
    /// Representations added by this method are retained by the receiver. 
    /// Image representations cannot be shared among multiple ``NSImage`` objects.
    /// - Parameter imageReps: 
    public func addRepresentations(_ imageReps: [NSImageRep]) {
        fatalError("Not implemented yet")
    }

    /// Removes and releases the specified image representation.
    /// - Parameter imageRep: The image representation object you want to remove.
    public func removeRepresentation(_ imageRep: NSImageRep) {
        fatalError("Not implemented yet")
    }

    // MARK: - Drawing Images

    /// Draws the image in the specified rectangle.
    /// 
    /// This method draws the entire image in the specified rectangle, scaling the image as needed. 
    /// The method composites the image using the ``NSCompositeSourceOver`` operation
    /// - Parameter rect: The rectangle in which to draw the image, specified in the current coordinate system.
    public func draw(in rect: OpenCoreGraphics.CGRect) {
        fatalError("Not implemented yet")
    }

    /// Draws all or part of the image at the specified point in the current coordinate system.
    /// 
    /// The image content is drawn at its current resolution and is not scaled unless the CTM of the current coordinate system itself contains a scaling factor. 
    /// The image is otherwise positioned and oriented using the current coordinate system.
    /// - Parameters:
    ///   - point: The location in the current coordinate system at which to draw the image.
    ///   - from: The source rectangle specifying the portion of the image you want to draw. The coordinates of this rectangle are specified in the image’s own coordinate system. If you pass in ``.zero``, the entire image is drawn.
    ///   - op: The compositing operation to use when drawing the image. See the NSCompositingOperation constants.
    ///   - delta: The opacity of the image, specified as a value from 0.0 to 1.0. Specifying a value of 0.0 draws the image as fully transparent while a value of 1.0 draws the image as fully opaque. Values greater than 1.0 are interpreted as 1.0.
    public func draw(at point: OpenCoreGraphics.CGPoint, from fromRect: OpenCoreGraphics.CGRect, operation op: NSCompositingOperation, fraction delta: Float) {
        fatalError("Not implemented yet")
    }

    /// Draws all or part of the image in the specified rectangle respecting the hints and the orientation of the current coordinate system.
    /// 
    /// If the ``srcSpacePortionRect`` and ``dstSpacePortionRect`` rectangles have different sizes, the source portion of the image is scaled to fit the specified destination rectangle.
    /// - Parameters:
    ///   - dstSpacePortionRect: The rectangle in which to draw the image, specified in the current coordinate system.
    ///   - srcSpacePortionRect: The source rectangle specifying the portion of the image you want to draw. The coordinates of this rectangle must be specified using the image’s own coordinate system. If you pass in ``.zero``, the entire image is drawn.
    ///   - op: The compositing operation to use when drawing the image.
    ///   - requestedAlpha: The alpha of the image, specified as a value from 0.0 to 1.0. Specifying a value of 0.0 draws the image as fully transparent while a value of 1.0 draws the image as fully opaque.
    ///   - respectContextIsFlipped: ``true`` if the drawing should respect the context flipped state, otherwise ``false``.
    ///   - hints: An optional dictionary of hints that provide more context for selecting or generating the image.
    public func draw(in dstSpacePortionRect: NSRect, from srcSpacePortionRect: NSRect, operation op: NSCompositingOperation, fraction requestedAlpha: CGFloat, respectFlipped respectContextIsFlipped: Bool, hints: [NSImage.HintKey : Any]?) {
        fatalError("Not implemented yet")
    }

    // MAR: - Managing Drawing Options

    /// A Boolean value that indicates whether it is possible to draw an image representation.
    /// 
    /// If you created the image with an existing image file, but the corresponding image data is not yet loaded into memory, this method loads the data and expands it as needed. 
    /// If the receiver contains no image representations and no associated image file, this method creates a valid cached image representation and initializes it to the default bit depth. 
    /// If the file or URL from which the image was initialized is nonexistent, or the data in an existing file is invalid, this method returns ``false``.
    public private(set) var isValid: Bool = false

    /// The background color for the image.
    /// 
    /// The background color is visible only if the drawn image representation does not completely cover all of the pixels available for the image’s current size. 
    /// The background color is ignored for cached image representations; such caches are always created with a white background. 
    /// Assigning a new background color does not cause the receiver to recache itself.
    /// 
    /// The default color is transparent, as returned by the clear method of NSColor.
    public var backgroundColor: NSColor = .clear

    /// The cap insets for the image.
    public var capInsets: NSEdgeInsets = .init()

    /// The resizing mode for the image.
    public var resizingMode: NSImage.ResizingMode = .stretch

    // MARK: - Working with Alignment Metadata

    /// A rectangle that you can use to position the image during layout.
    /// 
    /// Alignment rectangles specify baselines that you can use to position the content of an image more accurately. 
    /// These baselines are merely hints that your own code can use to determine positioning. 
    /// The NSImage class does not use this rectangle during drawing; however, instances of NSCell typically use this information when laying out images within their boundaries.
    /// 
    /// For example, if you have a 20 x 20 pixel icon that includes a glow effect, you might set the alignment rectangle to {{2, 2}, {16, 16}} to indicate the position of the underlying icon without the glow effect. 
    /// This property defaults to a rectangle with an origin of {0, 0} and a size that matches the size of the image.
    public var alignmentRect: OpenCoreGraphics.CGRect = .zero

    // MARK: - Managing Caching Options

    /// The image’s caching mode.
    public var cacheMode: NSImage.CacheMode = .default

    /// Invalidates and frees offscreen caches of all image representations.
    /// 
    /// If you modify an image representation, you must send a ``recache()`` message to the corresponding image object to force the changes to be recached. 
    /// The next time any image representation is drawn, it is asked to recreate its cached image. 
    /// If you do not send this message, the image representation may use the old cache data. 
    /// This method simply clears the cached image data
    public func recache() {
        fatalError("Not implemented yet")
    }

    // MARK: - Hit-Testing Images

    /// Returns whether the destination rectangle would intersect a non-transparent portion of the image.
    /// 
    /// This method simulates the results of hit-testing the test rectangle as if the image was drawn in the graphics context using the provided hints and respecting the specified flippedness.
    /// - Parameters:
    ///   - testRectDestSpace: The rectangle to hit test.
    ///   - imageRectDestSpace: A rectangle representing the drawn size of the image.
    ///   - context: A graphics context. This value can be nil.
    ///   - hints: An optional dictionary of hints that provide more context for selecting or generating a ``CGImage``, and may override properties of the referenceContext.
    ///   - flipped: ``true`` if the image is flipped, otherwise ``false``.
    /// - Returns: ``true`` if the ``testRectDestSpace`` intersects with non-transparent content within the ``imageRectDestSpace``, otherwise ``false``.
    public func hitTest(_ testRectDestSpace: NSRect, withDestinationRect imageRectDestSpace: NSRect, context: NSGraphicsContext?, hints: [NSImage.HintKey : Any]?, flipped: Bool) -> Bool {
        true
    }
}

extension NSImage {
    public typealias Name = String
}

extension NSImage {
    /// Constants that describe the resizing mode for the image.
    public enum ResizingMode: String, Equatable, Hashable, Sendable {
        /// The image tiles when it resizes.
        case tile
        
        /// The image stretches when it resizes.
        case stretch
    }
}

extension NSImage {
    public enum HintKey: String, Equatable, Hashable, Sendable {
        // MARK: - Hint Keys

        /// A context transform hint.
        case ctm

        /// An interpolation hint.
        case interpolation

        /// A layout direction hint.
        case userInterfaceLayoutDirection
    }
}

extension NSImage {
    /// Constants that specify the caching policy on a per-image basis.
    public enum CacheMode: String, Equatable, Hashable, Sendable {
        // MARK: - Cache Options

        /// Caching is unspecified.
        case `default`

        /// Always generate a cache when drawing.
        case always

        /// Cache if the cache size is smaller than the original data.
        case bySize

        /// Never cache; always draw direct.
        case never
    }
}
