import OpenCoreGraphics
import Foundation

/// An object that manages image-based content and allows you to perform animations on that content.
/// 
/// Layers are often used to provide the backing store for views but can also be used without a view to display content. 
/// A layer’s main job is to manage the visual content that you provide but the layer itself has visual attributes that can be set, such as a background color, border, and shadow. 
/// In addition to managing visual content, the layer also maintains information about the geometry of its content (such as its position, size, and transform) that is used to present that content onscreen. 
/// Modifying the properties of the layer is how you initiate animations on the layer’s content or geometry. 
/// A layer object encapsulates the duration and pacing of a layer and its animations by adopting the ``CAMediaTiming`` protocol, which defines the layer’s timing information.
/// 
/// If the layer object was created by a view, the view typically assigns itself as the layer’s delegate automatically, and you should not change that relationship. 
/// For layers you create yourself, you can assign a delegate object and use that object to provide the contents of the layer dynamically and perform other tasks. 
/// A layer may also have a layout manager object (assigned to the ``layoutManager`` property) to manage the layout of subviews separately.
@MainActor
open class CALayer {

    // MARK: - Creating a Layer

    /// Returns an initialized CALayer object.
    /// 
    /// This is the designated initializer for layer objects that are not in the presentation layer.
    /// - Returns: An initialized CALayer object.
    public required init() {
        print("\(Self.self).\(#function)")
        self.contents = CGImage()
    }

    /// Override to copy or initialize custom fields of the specified layer.
    /// 
    /// This initializer is used to create shadow copies of layers, for example, for the ``presentation()`` method. 
    /// Using this method in any other situation will produce undefined behavior. 
    /// For example, do not use this method to initialize a new layer with an existing layer’s content.
    /// 
    /// If you are implementing a custom layer subclass, you can override this method and use it to copy the values of instance variables into the new object. 
    /// Subclasses should always invoke the superclass implementation.
    /// 
    /// This method is the designated initializer for layer objects in the presentation layer.
    /// - Parameter layer: The layer from which custom fields should be copied.
    /// - Returns: A layer instance with any custom instance variables copied from layer.
    @available(*, unavailable)
    public init(layer: Any) {
        print("\(Self.self).\(#function)")
        self.contents = CGImage()
    }

    // MARK: - Accessing Related Layer Objects

    /// Returns a copy of the presentation layer object that represents the state of the layer as it currently appears onscreen.
    /// 
    /// The layer object returned by this method provides a close approximation of the layer that is currently being displayed onscreen. 
    /// While an animation is in progress, you can retrieve this object and use it to get the current values for those animations.
    /// 
    /// The ``sublayers``, ``mask``, and ``superlayer`` properties of the returned layer return the corresponding objects from the presentation tree (not the model tree). 
    /// This pattern also applies to any read-only layer methods. 
    /// For example, the ``hitTest(_:)`` method of the returned object queries the layer objects in the presentation tree.
    /// - Returns: A copy of the current presentation layer object.
    open func presentation() -> Self? {
        print("\(Self.self).\(#function)")
        return self
    }

    /// Returns the model layer object associated with the receiver, if any.
    /// 
    /// Calling this method on a layer in the presentation tree returns the corresponding layer object in the model tree. 
    /// This method returns a value only when a transaction involving changes to the presentation layer is in progress. 
    /// If no transaction is in progress, the results of calling this method are undefined.
    /// - Returns: A layer instance representing the underlying model layer.
    open func model() -> Self {
        print("\(Self.self).\(#function)")
        return self
    }

    // MARK: - Accessing the Delegate

    /// The layer’s delegate object.
    /// 
    /// You can use a delegate object to provide the layer’s contents, handle the layout of any sublayers, and provide custom actions in response to layer-related changes. 
    /// The object you assign to this property should implement one or more of the methods of the ``CALayerDelegate`` informal protocol. 
    /// For more information about that protocol, see ``CALayerDelegate``
    /// In Windows, if the layer is associated with a NSView object, this property must be set to the view that owns the layer.
    public weak var delegate: (any CALayerDelegate)?

    // MARK: - Providing the Layer’s Content

    /// An object that provides the contents of the layer.
    /// 
    /// The default value of this property is nil.
    /// 
    /// If you are using the layer to display a static image, you can set this property to the ``CGImage`` containing the image you want to display. 
    /// (In macOS 10.6 and later, you can also set the property to an NSImage object.) 
    /// Assigning a value to this property causes the layer to use your image rather than create a separate backing store.
    /// 
    /// If the layer object is tied to a view object, you should avoid setting the contents of this property directly. 
    /// The interplay between views and layers usually results in the view replacing the contents of this property during a subsequent update.
    public var contents: Any?

    /// The rectangle, in the unit coordinate space, that defines the portion of the layer’s contents that should be used.
    /// 
    /// Defaults to the unit rectangle (0.0, 0.0, 1.0, 1.0).
    /// If pixels outside the unit rectangle are requested, the edge pixels of the contents image will be extended outwards.
    /// If an empty rectangle is provided, the results are undefined.
    public var contentsRect: OpenCoreGraphics.CGRect = .init(x: 0, y: 0, width: 1, height: 1)

    /// The rectangle that defines how the layer contents are scaled if the layer’s contents are resized.
    /// 
    /// You can use this property to subdivide the layer’s content into a 3x3 grid. 
    /// The value in this property specifies the location and size of the center rectangle in that grid. 
    /// If the layer’s contentsGravity property is set to one of the resizing modes, resizing the layer causes scaling to occur differently in each rectangle of the grid. 
    /// The center rectangle is stretched in both dimensions, the top-center and bottom-center rectangles are stretched only horizontally, the left-center and right-center rectangles are stretched only vertically, and the four corner rectangles are not stretched at all. 
    /// Therefore, you can use this technique to implement stretchable backgrounds or images using a three-part or nine-part image.
    /// 
    /// The value in this property is set to the unit rectangle (0.0,0.0) (1.0,1.0) by default, which causes the entire image to scale in both dimensions. 
    /// If you specify a rectangle that extends outside the unit rectangle, the result is undefined. 
    /// The rectangle you specify is applied only after the contentsRect property has been applied to the image.
    public var contentsCenter: OpenCoreGraphics.CGRect = .init(x: 0, y: 0, width: 1, height: 1)

    /// Reloads the content of this layer.
    /// 
    /// Do not call this method directly. The layer calls this method at appropriate times to update the layer’s content. 
    /// If the layer has a delegate object, this method attempts to call the delegate’s ``display(_:)`` method, which the delegate can use to update the layer’s contents. 
    /// If the delegate does not implement the ``display(_:)`` method, this method creates a backing store and calls the layer’s ``draw(in:)`` method to fill that backing store with content. 
    /// The new backing store replaces the previous contents of the layer.
    /// 
    /// Subclasses can override this method and use it to set the layer’s contents property directly. 
    /// You might do this if your custom layer subclass handles layer updates differently.
    open func display() {
        print("\(Self.self).\(#function)")
        if let delegate {
            delegate.display(self)
        } else {
            contents == nil ? CGImage() : contents
        }
    }

    /// Draws the layer’s content using the specified graphics context.
    /// 
    /// The default implementation of this method does not do any drawing itself. 
    /// If the layer’s delegate implements the draw(_:in:) method, that method is called to do the actual drawing.
    /// 
    /// Subclasses can override this method and use it to draw the layer’s content. 
    /// When drawing, all coordinates should be specified in points in the logical coordinate space.
    /// - Parameter context: The graphics context in which to draw the content. The context may be clipped to protect valid layer content.
    open func draw(in context: CGContext) {
        print("\(Self.self).\(#function)")
        if let delegate {
            delegate.draw(self, in: context)
        }
    }

    // MARK: - Modifying the Layer’s Appearance

    /// A constant that specifies how the layer's contents are positioned or scaled within its bounds.
    public var contentsGravity: CALayerContentsGravity = .resize

    /// The opacity of the receiver.
    /// 
    /// The value of this property must be in the range 0.0 (transparent) to 1.0 (opaque). 
    /// Values outside that range are clamped to the minimum or maximum. 
    /// The default value of this property is 1.0.
    public var opacity: Float = 1.0

    /// A Boolean indicating whether the layer is displayed. 
    ///
    /// The default value of this property is false.
    public var isHidden: Bool = false

    /// A Boolean indicating whether sublayers are clipped to the layer’s bounds.
    /// 
    /// When the value of this property is true, Core Animation creates an implicit clipping mask that matches the bounds of the layer and includes any corner radius effects. 
    /// If a value for the mask property is also specified, the two masks are multiplied to get the final mask value.
    /// 
    /// The default value of this property is false.
    public var masksToBounds: Bool = false

    /// An optional layer whose alpha channel is used to mask the layer’s content.
    /// 
    /// The layer’s alpha channel determines how much of the layer’s content and background shows through. 
    /// Fully or partially opaque pixels allow the underlying content to show through, but fully transparent pixels block that content.
    /// 
    /// The default value of this property is nil. 
    /// When configuring a mask, remember to set the size and position of the mask layer to ensure it is aligned properly with the layer it masks.
    public var mask: CALayer?

    /// A Boolean indicating whether the layer displays its content when facing away from the viewer.
    /// 
    /// When the value in this property is false, the layer hides its content when it faces away from the viewer.
    ///  The default value of this property is true.
    public var isDoubleSided: Bool = true

    /// The radius to use when drawing rounded corners for the layer’s background.
    /// 
    /// Setting the radius to a value greater than 0.0 causes the layer to begin drawing rounded corners on its background. 
    /// By default, the corner radius does not apply to the image in the layer’s contents property; it applies only to the background color and border of the layer. 
    /// However, setting the masksToBounds property to true causes the content to be clipped to the rounded corners.
    /// 
    /// The default value of this property is 0.0.
    public var cornerRadius: Float = 0

    /// The width of the layer’s border.
    /// 
    /// When this value is greater than 0.0, the layer draws a border using the current ``borderColor`` value. 
    /// The border is drawn inset from the receiver’s bounds by the value specified in this property. 
    /// It is composited above the receiver’s contents and sublayers and includes the effects of the ``cornerRadius`` property.
    /// 
    /// The default value of this property is 0.0.
    public var borderWidth: Float = 0

    /// The background color of the receiver.
    /// 
    /// The default value of this property is nil.
    /// 
    /// The value of this property is retained using the Core Foundation retain/release semantics. 
    /// This behavior occurs despite the fact that the property declaration appears to use the default assign semantics for object retention.
    public var backgroundColor: CGColor?

    /// The opacity of the layer’s shadow.
    /// 
    /// The value in this property must be in the range 0.0 (transparent) to 1.0 (opaque). 
    /// The default value of this property is 0.0.
    public var shadowOpacity: Float = 0.0

    /// The blur radius (in points) used to render the layer’s shadow.
    /// 
    /// You specify the radius The default value of this property is 3.0.
    public var shadowRadius: Float = 3.0

    /// The offset (in points) of the layer’s shadow.
    /// 
    /// The default value of this property is (0.0, -3.0).
    public var shadowOffset: OpenCoreGraphics.CGSize = .init(width: 0, height: -3)

    /// The color of the layer’s shadow.
    /// 
    /// The default value of this property is an opaque black color.
    public var shadowColor: CGColor? = .black

    /// The shape of the layer’s shadow.
    /// 
    /// The default value of this property is nil, which causes the layer to use a standard shadow shape. 
    /// If you specify a value for this property, the layer creates its shadow using the specified path instead of the layer’s composited alpha channel. 
    /// The path you provide defines the outline of the shadow. 
    /// It is filled using the non-zero winding rule and the current shadow color, opacity, and blur radius.
    /// 
    /// Unlike most animatable properties, this property (as with all CGPathRef animatable properties) does not support implicit animation. 
    /// However, the path object may be animated using any of the concrete subclasses of CAPropertyAnimation. 
    /// Paths will interpolate as a linear blend of the "on-line" points; "off-line" points may be interpolated non-linearly (to preserve continuity of the curve's derivative). 
    /// If the two paths have a different number of control points or segments, the results are undefined. 
    /// If the path extends outside the layer bounds it will not automatically be clipped to the layer, only if the normal layer masking rules cause that.
    /// 
    /// Specifying an explicit path usually improves rendering performance.
    public var shadowPath: CGPath?

    /// An optional dictionary used to store property values that aren't explicitly defined by the layer.
    /// 
    /// This dictionary may in turn have a style key, forming a hierarchy of default values. 
    /// In the case of hierarchical style dictionaries the shallowest value for a property is used. 
    /// For example, the value for “style.someValue” takes precedence over “style.style.someValue”.
    /// 
    /// If the style dictionary does not define a value for an attribute, the receiver’s defaultValue(forKey:) method is called. 
    /// The default value of this property is nil.
    /// 
    /// The style dictionary is not consulted for the following keys: bounds, frame.
    public var style: [AnyHashable : Any]?

    /// A Boolean indicating whether the layer is allowed to perform edge antialiasing.
    /// 
    /// When the value is true, the layer is allowed to antialias its edges, as requested by the value in the layer’s ``edgeAntialiasingMask`` property. 
    /// The default value is false.
    public var allowsEdgeAntialiasing: Bool = false

    /// A Boolean indicating whether the layer is allowed to composite itself as a group separate from its parent.
    /// 
    /// When the value is true and the layer’s opacity property value is less than 1.0, the layer is allowed to composite itself as a group separate from its parent. 
    /// This gives correct results when the layer contains multiple opaque components, but may reduce performance.
    /// 
    /// The default value is true.
    public var allowsGroupOpacity: Bool = true

    // MARK: - Layer Filters

    /// An array of Core Image filters to apply to the contents of the layer and its sublayers.
    /// 
    /// The filters you add to this property affect the content of the layer, including its border, filled background and sublayers. 
    /// The default value of this property is nil.
    /// 
    /// Changing the inputs of the CIFilter object directly after it is attached to the layer causes undefined behavior. 
    /// It is possible to modify filter parameters after attaching them to the layer but you must use the layer’s setValue(_:forKeyPath:) method to do so. 
    /// In addition, you must assign a name to the filter so that you can identify it in the array.
    public var filters: [Any]?

    /// A CoreImage filter used to composite the layer and the content behind it. 
    /// 
    /// The default value of this property is nil, which causes the layer to use source-over compositing. 
    /// Although you can use any Core Image filter as a layer's compositing filter, for best results, use those in the ``CICategoryCompositeOperation`` category.
    /// 
    /// In macOS, it is possible to modify the filter’s parameters after attaching it to the layer but you must use the layer’s ``setValue(_:forKeyPath:)`` method to do so.
    public var compositingFilter: Any?

    /// An array of Core Image filters to apply to the content immediately behind the layer. 
    /// 
    /// Background filters affect the content behind the layer that shows through into the layer itself. 
    /// Typically this content belongs to the superlayer that acts as the parent of the layer. 
    /// These filters do not affect the content of the layer itself, including the layer’s background color and border.
    /// 
    /// The default value of this property is nil.
    /// 
    /// Changing the inputs of the ``CIFilter`` object directly after it is attached to the layer causes undefined behavior. 
    /// In macOS, it is possible to modify filter parameters after attaching them to the layer but you must use the layer’s ``setValue(_:forKeyPath:)`` method to do so. 
    /// In addition, you must assign a name to the filter so that you can identify it in the array.
    public var backgroundFilters: [Any]?

    /// The filter used when reducing the size of the content.
    /// 
    /// The possible values for this property are listed in ``Scaling Filters``.
    /// The default value of this property is ``linear``.
    public var minificationFilter: CALayerContentsFilter = .linear

    /// The bias factor used by the minification filter to determine the levels of detail.
    /// 
    /// This value is used by the minificationFilter when it is set to trilinear.
    /// The default value of this property is 0.0.
    public var minificationFilterBias: Float = 0

    /// The filter used when increasing the size of the content.
    /// 
    /// The possible values for this property are listed in ``Scaling Filters``.
    /// The default value of this property is ``linear``.
    public var magnificationFilter: CALayerContentsFilter = .linear

    // MARK: - Configuring the Layer’s Rendering Behavior

    /// A Boolean value indicating whether the layer contains completely opaque content.
    /// 
    /// The default value of this property is false. 
    /// If your app draws completely opaque content that fills the layer’s bounds, setting this property to true lets the system optimize the rendering behavior for the layer. 
    /// Specifically, when the layer creates the backing store for your drawing commands, Core Animation omits the alpha channel of that backing store. 
    /// Doing so can improve the performance of compositing operations. 
    /// If you set the value of this property to true, you must fill the layer’s bounds with opaque content.
    /// 
    /// Setting this property affects only the backing store managed by Core Animation. 
    /// If you assign an image with an alpha channel to the layer’s ``contents`` property, that image retains its alpha channel regardless of the value of this property.
    public var isOpaque: Bool = false

    /// A bitmask defining how the edges of the receiver are rasterized.
    /// 
    /// This property specifies which edges of the layer are antialiased and is a combination of the constants defined in CAEdgeAntialiasingMask. 
    /// You can enable or disable antialiasing for each edge (top, left, bottom, right) separately. 
    /// By default antialiasing is enabled for all edges.
    /// 
    /// Typically, you would use this property to disable antialiasing for edges that abut edges of other layers, to eliminate the seams that would otherwise occur.
    public var edgeAntialiasingMask: [CAEdgeAntialiasingMask] = CAEdgeAntialiasingMask.allCases

    /// Returns a Boolean indicating whether the layer content is implicitly flipped when rendered.
    /// 
    /// This method provides information about whether the layer’s contents are being flipped during drawing. 
    /// You should not attempt to override this method and return a different value.
    /// 
    /// If the layer needs to flip its content, it returns true from this method and applies a y-flip transform to the graphics context before passing it to the layer’s ``draw(in:)`` method. 
    /// Similarly, the layer converts any rectangles passed to its ``setNeedsDisplay(_:)`` into the flipped coordinate space.
    /// - Returns: true if the layer contents are implicitly flipped when rendered or false if they are not. This method returns false by default.
    open func contentsAreFlipped() -> Bool {
        print("\(Self.self).\(#function)")
        return false
    }

    /// A Boolean that indicates whether the geometry of the layer and its sublayers is flipped vertically.
    /// 
    /// If the layer is providing the backing for a layer-backed view, the view is responsible for managing the value in this property. 
    /// For standalone layers, this property controls whether geometry values for the layer are interpreted using the standard or flipped coordinate system. 
    /// The value of this property does not affect the rendering of the layer’s content.
    /// 
    /// The default value of this property is false.
    public var isGeometryFlipped: Bool = false

    /// A Boolean indicating whether drawing commands are deferred and processed asynchronously in a background thread.
    /// 
    /// When this property is set to true, the graphics context used to draw the layer’s contents queues drawing commands and executes them on a background thread rather than executing them synchronously. 
    /// Performing these commands asynchronously can improve performance in some apps. 
    /// However, you should always measure the actual performance benefits before enabling this capability.
    /// 
    /// The default value for this property is false.
    public var drawsAsynchronously: Bool = false

    /// A Boolean that indicates whether the layer is rendered as a bitmap before compositing. 
    /// 
    /// When the value of this property is true, the layer is rendered as a bitmap in its local coordinate space and then composited to the destination with any other content. 
    /// Shadow effects and any ``filters`` in the filters property are rasterized and included in the bitmap. 
    /// However, the current opacity of the layer is not rasterized. 
    /// If the rasterized bitmap requires scaling during compositing, the filters in the ``minificationFilter`` and ``magnificationFilter`` properties are applied as needed.
    /// 
    /// When the value of this property is false, the layer is composited directly into the destination whenever possible. 
    /// The layer may still be rasterized prior to compositing if certain features of the compositing model (such as the inclusion of filters) require it.
    /// 
    /// The default value of this property is false.
    public var shouldRasterize: Bool = false

    /// The scale at which to rasterize content, relative to the coordinate space of the layer.
    /// 
    /// When the value in the ``shouldRasterize`` property is true, the layer uses this property to determine whether to scale the rasterized content (and by how much). 
    /// The default value of this property is 1.0, which indicates that the layer should be rasterized at its current size. 
    /// Larger values magnify the content and smaller values shrink it.
    public var rasterizationScale: Float = 1

    /// Renders the layer and its sublayers into the specified context.
    /// 
    /// This method renders directly from the layer tree, ignoring any animations added to the render tree. 
    /// Renders in the coordinate space of the layer.
    /// - Parameter context: The graphics context to use to render the layer.
    public func render(in context: CGContext) {
        print("\(Self.self).\(#function)")
        if let contents = contents as? CGImage {
            context.draw(contents, in: frame)
        }

        // sublayers?.forEach {
        //     $0.render(in: context)
        // }
    }

    // MARK: - Modifying the Layer Geometry

    /// The layer’s frame rectangle.
    /// 
    /// The frame rectangle is position and size of the layer specified in the superlayer’s coordinate space. 
    /// For layers, the frame rectangle is a computed property that is derived from the values in the ``bounds``, ``anchorPoint`` and ``position`` properties. 
    /// When you assign a new value to this property, the layer changes its ``position`` and ``bounds`` properties to match the rectangle you specified. 
    /// The values of each coordinate in the rectangle are measured in points.
    public var frame: OpenCoreGraphics.CGRect { 
        get { .init(origin: position, size: bounds.size) }
        set {
            bounds.size = newValue.size
            position = newValue.origin
        }
    }

    /// The layer’s bounds rectangle.
    /// 
    /// The bounds rectangle is the origin and size of the layer in its own coordinate space. 
    /// When you create a new standalone layer, the default value for this property is an empty rectangle, which you must change before using the layer. 
    /// The values of each coordinate in the rectangle are measured in points.
    public var bounds: OpenCoreGraphics.CGRect = .zero

    /// The layer’s position in its superlayer’s coordinate space.
    /// 
    /// The value of this property is specified in points and is always specified relative to the value in the ``anchorPoint`` property. 
    /// For new standalone layers, the default position is set to (0.0, 0.0). 
    /// Changing the ``frame`` property also updates the value in this property.
    public var position: OpenCoreGraphics.CGPoint = .zero

    /// The layer’s position on the z axis.
    /// 
    /// The default value of this property is 0. 
    /// Changing the value of this property changes the front-to-back ordering of layers onscreen. 
    /// Higher values place this layer visually closer to the viewer than layers with lower values. 
    /// This can affect the visibility of layers whose frame rectangles overlap.
    /// 
    /// The value of this property is measured in points. 
    /// The range of this property is single-precision, floating-point -``greatestFiniteMagnitude`` to ``greatestFiniteMagnitude``.
    public var zPosition: Float = 0

    /// The anchor point for the layer’s position along the z axis. 
    /// 
    /// This property specifies the anchor point on the z axis around which geometric manipulations occur. 
    /// The point is expressed as a distance (measured in points) along the z axis. 
    /// The default value of this property is 0.
    public var anchorPointZ: Float = 0

    /// Defines the anchor point of the layer's bounds rectangle.
    /// 
    /// You specify the value for this property using the unit coordinate space. 
    /// The default value of this property is (0.5, 0.5), which represents the center of the layer’s bounds rectangle. 
    /// All geometric manipulations to the view occur about the specified point. 
    /// For example, applying a rotation transform to a layer with the default anchor point causes the layer to rotate around its center. 
    /// Changing the anchor point to a different location would cause the layer to rotate around that new point.
    public var anchorPoint: OpenCoreGraphics.CGPoint = .init(x: 0.5, y: 0.5)

    /// The scale factor applied to the layer.
    /// 
    /// This value defines the mapping between the logical coordinate space of the layer (measured in points) and the physical coordinate space (measured in pixels). 
    /// Higher scale factors indicate that each point in the layer is represented by more than one pixel at render time. 
    /// For example, if the scale factor is 2.0 and the layer’s bounds are 50 x 50 points, the size of the bitmap used to present the layer’s content is 100 x 100 pixels.
    /// 
    /// The default value of this property is 1.0. 
    /// For layers attached to a view, the view changes the scale factor automatically to a value that is appropriate for the current screen. 
    /// For layers you create and manage yourself, you must set the value of this property yourself based on the resolution of the screen and the content you are providing.
    public var contentsScale: Float = 1

    // MARK: - Managing the Layer’s Transform

    /// The transform applied to the layer’s contents.
    /// 
    /// This property is set to the identity transform by default. 
    /// Any transformations you apply to the layer occur relative to the layer’s anchor point.
    public var transform: CATransform3D = .init()

    /// Specifies the transform to apply to sublayers when rendering. 
    /// 
    /// You typically use this property to add perspective and other viewing effects to embedded layers. 
    /// You add perspective by setting the sublayer transform to the desired projection matrix. 
    /// The default value of this property is the identity transform.
    public var sublayerTransform: CATransform3D = .init()

    /// Returns an affine version of the layer’s transform.
    /// - Returns: The affine transform structure that corresponds to the value in the layer’s ``transform`` property.
    public func affineTransform() -> OpenCoreGraphics.CGAffineTransform {
        print("\(Self.self).\(#function)")
        return .init()
    }

    /// Sets the layer’s transform to the specified affine transform.
    /// - Parameter m: The affine transform to use for the layer’s transform.
    public func setAffineTransform(_ m: OpenCoreGraphics.CGAffineTransform) {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Managing the Layer Hierarchy

    /// An array containing the layer’s sublayers.
    /// 
    /// The sublayers are listed in back to front order. 
    /// The default value of this property is nil.
    /// 
    /// When setting the sublayers property to an array populated with layer objects, each layer in the array must not already have a superlayer—that is, its superlayer property must currently be nil.
    public private(set) var sublayers: [CALayer]?

    /// The superlayer of the layer.
    /// 
    /// The superlayer manages the layout of its sublayers.
    public weak private(set) var superlayer: CALayer?

    /// Appends the layer to the layer’s list of sublayers.
    /// 
    /// If the array in the sublayers property is nil, calling this method creates an array for that property and adds the specified layer to it.
    /// - Parameter layer: The layer to be added.
    public func addSublayer(_ layer: CALayer) {
        print("\(Self.self).\(#function)")
        if sublayers == nil {
            sublayers = []
        }

        sublayers?.append(layer)
    }

    /// Detaches the layer from its parent layer.
    /// 
    /// You can use this method to remove a layer (and all of its sublayers) from a layer hierarchy. 
    /// This method updates both the superlayer’s list of sublayers and sets this layer’s ``superlayer`` property to nil.
    public func removeFromSuperlayer() {
        print("\(Self.self).\(#function)")
        superlayer?.sublayers?.removeAll { $0 === self }
    }

    /// Inserts the specified layer into the receiver’s list of sublayers at the specified index.
    /// - Parameters:
    ///   - layer: The sublayer to be inserted into the current layer.
    ///   - index: The index at which to insert layer. This value must be a valid 0-based index into the ``sublayers`` array.
    public func insertSublayer(_ layer: CALayer, at index: Int) {
        print("\(Self.self).\(#function)")
        if sublayers == nil {
            sublayers = []
        }

        sublayers?.insert(layer, at: index)
    }

    /// Inserts the specified sublayer below a different sublayer that already belongs to the receiver.
    /// 
    /// If sublayer is not in the receiver’s sublayers array, this method raises an exception.
    /// - Parameters:
    ///   - layer: The sublayer to be inserted into the current layer.
    ///   - sibling: An existing sublayer in the current layer. The layer in aLayer is inserted before this layer in the ``sublayers`` array, and thus appears behind it visually.
    public func insertSublayer(_ layer: CALayer, below sibling: CALayer?) {
        print("\(Self.self).\(#function)")
        guard let index = sublayers?.firstIndex(where: { $0 === sibling }) else {
            fatalError("")
        }

        sublayers?.insert(layer, at: index - 1)
    }

    /// Inserts the specified sublayer above a different sublayer that already belongs to the receiver.
    /// 
    /// If sublayer is not in the receiver’s sublayers array, this method raises an exception.
    /// - Parameters:
    ///   - layer: The sublayer to be inserted into the current layer.
    ///   - sibling: An existing sublayer in the current layer. The layer in aLayer is inserted after this layer in the ``sublayers`` array, and thus appears in front of it visually.
    public func insertSublayer(_ layer: CALayer, above sibling: CALayer?) {
        print("\(Self.self).\(#function)")
        guard let index = sublayers?.firstIndex(where: { $0 === sibling }) else {
            fatalError("")
        }

        sublayers?.insert(layer, at: index + 1)
    }

    /// Replaces the specified sublayer with a different layer object.
    /// 
    /// If oldLayer is not in the receiver’s ``sublayers`` array, the behavior of this method is undefined.
    /// - Parameters:
    ///   - oldLayer: The layer to be replaced.
    ///   - newLayer: The layer with which to replace oldLayer.
    public func replaceSublayer(_ oldLayer: CALayer, with newLayer: CALayer) {
        print("\(Self.self).\(#function)")
        guard let index = sublayers?.firstIndex(where: { $0 === oldLayer }) else {
            fatalError("")
        }

        sublayers?[index] = newLayer
    }

    // MARK: - Updating Layer Display

    /// Marks the layer’s contents as needing to be updated.
    /// 
    /// Calling this method causes the layer to recache its content. 
    /// This results in the layer potentially calling either the ``display(_:)`` or ``draw(_:in:)`` method of its delegate. 
    /// The existing content in the layer’s contents property is removed to make way for the new content.
    public func setNeedsDisplay() {
        print("\(Self.self).\(#function)")
        needsDisplay = true
    }

    /// Marks the region within the specified rectangle as needing to be updated.
    /// - Parameter rect: The rectangular region of the layer to mark as invalid. You must specify this rectangle in the layer’s own coordinate system.
    public func setNeedsDisplay(_ rect: OpenCoreGraphics.CGRect) {
        print("\(Self.self).\(#function)")
        needsDisplay = true
    }

    /// A Boolean indicating whether the layer contents must be updated when its bounds rectangle changes.
    /// When this property is set to true, the layer automatically calls its ``setNeedsDisplay()`` method whenever its bounds property changes. 
    /// The default value of this property is false.
    public var needsDisplayOnBoundsChange: Bool = false

    /// Initiates the update process for a layer if it is currently marked as needing an update.
    /// 
    /// You can call this method as needed to force an update to your layer’s contents outside of the normal update cycle. 
    /// Doing so is generally not needed, though. 
    /// The preferred way to update a layer is to call ``setNeedsDisplay()`` and let the system update the layer during the next cycle.
    public func displayIfNeeded() {
        print("\(Self.self).\(#function)")
        if needsDisplay {
            self.display()
        }
    }

    /// Returns a Boolean indicating whether the layer has been marked as needing an update.
    /// - Returns: true if the layer needs to be updated.
    public private(set) var needsDisplay: Bool = true

    /// Returns a Boolean indicating whether changes to the specified key require the layer to be redisplayed.
    /// 
    /// Subclasses can override this method and return true if the layer should be redisplayed when the value of the specified attribute changes. 
    /// Animations changing the value of the attribute also trigger redisplay.
    /// 
    /// The default implementation of this method returns false.
    /// - Parameter key: A string that specifies an attribute of the layer.
    /// - Returns: true if the layer requires a redisplay.
    public class func needsDisplay(forKey key: String) -> Bool {
        print("\(Self.self).\(#function)")
        return false
    }
    
    // MARK: - Layer Animations

    /// Add the specified animation object to the layer’s render tree.
    /// 
    /// If the duration property of the animation is zero or negative, the duration is changed to the current value of the kCATransactionAnimationDuration transaction property (if set) or to the default value of 0.25 seconds.
    /// - Parameters:
    ///   - anim: The animation to be added to the render tree. This object is copied by the render tree, not referenced. Therefore, subsequent modifications to the object are not propagated into the render tree.
    ///   - key: A string that identifies the animation. Only one animation per unique key is added to the layer. The special key kCATransition is automatically used for transition animations. You may specify nil for this parameter.
    public func add(_ anim: CAAnimation, forKey key: String?) {
        print("\(Self.self).\(#function)")
        fatalError("not implemented yet")
    }

    /// Returns the animation object with the specified identifier.
    /// 
    /// Use this method to retrieve only animation objects already associated with a layer. 
    /// Modifying any properties of the returned object results in undefined behavior.
    /// - Parameter key: A string that specifies the identifier of the animation. This string corresponds to the identifier string you passed to the ``add(_:forKey:)`` method.
    /// - Returns: The animation object matching the identifier, or nil if no such animation exists.
    public func animation(forKey key: String) -> CAAnimation? {
        print("\(Self.self).\(#function)")
        fatalError("not implemented yet")
    }

    /// Remove all animations attached to the layer.
    public func removeAllAnimations() {
        print("\(Self.self).\(#function)")
        fatalError("not implemented yet")
    }

    /// Returns an array of strings that identify the animations currently attached to the layer.
    /// 
    /// The order of the array matches the order in which animations will be applied to the layer.
    /// - Returns: An array of ``String`` objects identifying the current animations.
    public func animationKeys() -> [String]? {
        print("\(Self.self).\(#function)")
        fatalError("not implemented yet")
    }

    // MARK: - Managing Layer Resizing and Layout

    /// The object responsible for laying out the layer’s sublayers.
    /// 
    /// The object you assign to this property must nominally implement the ``CALayoutManager`` informal protocol. 
    /// If the layer’s delegate does not handle layout updates, the object assigned to this property is given a chance to update the layout of the layer’s sublayers.
    /// 
    /// In macOS, assign an instance of the ``CAConstraintLayoutManager`` class to this property if your layer uses layer-based constraints to handle layout changes.
    /// 
    /// The default value of this property is nil.
    public var layoutManager: (any CALayoutManager)?

    /// Invalidates the layer’s layout and marks it as needing an update.
    /// 
    /// You can call this method to indicate that the layout of a layer’s sublayers has changed and must be updated. 
    /// The system typically calls this method automatically when the layer’s bounds change or when ``sublayers`` are added or removed. 
    /// In macOS, if your layer’s ``layoutManager`` property contains an object that implements the ``invalidateLayout(of:)`` method, that method is called too.
    /// 
    /// During the next update cycle, the system calls the ``layoutSublayers()`` method of any layers requiring layout updates.
    public func setNeedsLayout() {
        print("\(Self.self).\(#function)")
        needsLayout = true
    }

    /// Tells the layer to update its layout.
    /// 
    /// Subclasses can override this method and use it to implement their own layout algorithm. 
    /// Your implementation must set the frame of each sublayer managed by the receiver.
    /// 
    /// The default implementation of this method calls the ``layoutSublayers(of:)`` method of the layer’s delegate object. 
    /// If there is no delegate object, or the delegate does not implement that method, this method calls the ``layoutSublayers(of:)`` method of the object in the ``layoutManager`` property.
    public func layoutSublayers() {
        print("\(Self.self).\(#function)")
        sublayers?.forEach { 
            $0.layoutIfNeeded()
        }
    }

    /// Recalculate the receiver’s layout, if required.
    /// 
    /// When this message is received, the layer’s super layers are traversed until a ancestor layer is found that does not require layout. 
    /// Then layout is performed on the entire layer-tree beneath that ancestor.
    public func layoutIfNeeded() {
        print("\(Self.self).\(#function)")
        fatalError("not implemented yet")
    }

    /// Returns a Boolean indicating whether the layer has been marked as needing a layout update.
    /// - Returns: true if the layer has been marked as requiring a layout update.
    public private(set) var needsLayout: Bool = false

    /// A bitmask defining how the layer is resized when the bounds of its superlayer changes.
    /// 
    /// If your app does not use a layout manager or constraints to handle layout changes, you can assign a value to this property to adjust the layer’s size in response to changes in the superlayer’s bounds. 
    /// For a list of possible values, see CAAutoresizingMask.
    /// 
    /// The default value of this property is layerNotSizable.
    public var autoresizingMask: CAAutoresizingMask = .layerNotSizable

    /// Informs the receiver that the size of its superlayer changed.
    /// 
    /// When the ``autoresizingMask`` property is used for resizing and the bounds of a layer change, that layer calls this method on each of its sublayers. 
    /// Sublayers use this method to adjust their own frame rectangles to reflect the new superlayer bounds, which can be retrieved directly from the superlayer. 
    /// The old size of the superlayer is passed to this method so that the sublayer has that information for any calculations it must make.
    /// - Parameter size: The previous size of the superlayer.
    public func resize(withOldSuperlayerSize size: OpenCoreGraphics.CGSize) {
        print("\(Self.self).\(#function)")
        fatalError("not implemented yet")
    }

    /// Informs the receiver’s sublayers that the receiver’s size has changed.
    /// 
    /// When the ``autoresizingMask`` property is used for resizing and the bounds of this layer change, the layer calls this method. 
    /// The default implementation calls the ``resize(withOldSuperlayerSize:)`` method of each sublayer to let it know its superlayer’s bounds changed. 
    /// You should not need to call or override this method directly.
    /// - Parameter size: The previous size of the current layer.
    public func resizeSublayers(withOldSize size: OpenCoreGraphics.CGSize) {
        print("\(Self.self).\(#function)")
        fatalError("not implemented yet")
    }

    /// Returns the preferred size of the layer in the coordinate space of its superlayer.
    /// 
    /// In macOS, the default implementation of this method calls the ``preferredSize(of:)`` method of its layout manager—that is, the object in its ``layoutManager`` property. 
    /// If that object does not exist or does not implement that method, this method returns the size of the layer’s current ``bounds`` rectangle mapped into the coordinate space of its ``superlayer``.
    /// - Returns: The layer’s preferred frame size.
    public func preferredFrameSize() -> OpenCoreGraphics.CGSize {
        print("\(Self.self).\(#function)")
        fatalError("not implemented yet")
    }

    // MARK: - Managing Layer Constraints

    /// The constraints used to position current layer’s sublayers.
    /// 
    /// macOS apps can use this property to access their layer-based constraints. 
    /// Before constraints can be applied, you must also assign a ``CAConstraintLayoutManager`` object to the ``layoutManager`` property of the layer.
    public private(set) var constraints: [CAConstraint]?

    /// Adds the specified constraint to the layer.
    /// 
    /// In macOS, you typically add constraints to a layer to manage the size and position of that layer’s sublayers. 
    /// Before constraints can be applied, you must also assign a ``CAConstraintLayoutManager`` object to the ``layoutManager`` property of the layer.
    /// - Parameter constraint: The constraint object to add to the receiver’s array of constraint objects. 
    public func addConstraint(_ constraint: CAConstraint) {
        print("\(Self.self).\(#function)")
        if constraints == nil {
            constraints = []
        }

        constraints?.append(constraint)
    }

    // MARK: - Getting the Layer’s Actions

    /// Returns the action object assigned to the specified key.
    /// 
    /// This method searches for the given action object of the layer. 
    /// Actions define dynamic behaviors for a layer. 
    /// For example, the animatable properties of a layer typically have corresponding action objects to initiate the actual animations. 
    /// When that property changes, the layer looks for the action object associated with the property name and executes it. 
    /// You can also associate custom action objects with your layer to implement app-specific actions.
    /// 
    /// This method searches for the layer’s associated actions in the following order:
    /// 1. If the layer has a delegate that implements the action(for:forKey:) method, the layer calls that method. The delegate must do one of the following:
    /// 2. Return the action object for the given key.
    /// 3. Return the nil object if it does not handle the action.
    /// 4. The layer looks in the layer’s actions dictionary for a matching key/action pair.
    /// 5. The layer looks in the style dictionary for an actions dictionary for a matching key/action pair.
    /// 6. The layer calls the defaultAction(forKey:) class method to look for any class-defined actions.
    /// 
    /// If any of the above steps returns an instance of nil, it is converted to nil before continuing.
    /// When an action object is invoked it receives three parameters: the name of the event, the object on which the event happened (the layer), and a dictionary of named arguments specific to each event kind.
    /// - Parameter event: The identifier of the action.
    /// - Returns: Returns the object that provides the action for key. The object must implement the CAAction protocol.
    public func action(forKey event: String) -> (any CAAction)? {
        print("\(Self.self).\(#function)")
        return actions?[event]
    }

    /// A dictionary containing layer actions.
    /// 
    /// The default value of this property is nil. 
    /// You can use this dictionary to store custom actions for your layer. 
    /// The contents of this dictionary searched as part of the standard implementation of the ``action(forKey:)`` method.
    public var actions: [String : any CAAction]?

    /// Returns the default action for the current class.
    /// 
    /// Classes that want to provide default actions can override this method and use it to return those actions.
    /// - Parameter event: The identifier of the action.
    /// - Returns: Returns a suitable action object for the given key or nil of no action object was associated with that key.
    public class func defaultAction(forKey event: String) -> (any CAAction)? {
        print("\(Self.self).\(#function)")
        fatalError("not implemented yet")
    }

    // MARK: - Mapping Between Coordinate and Time Spaces

    /// Converts the point from the specified layer’s coordinate system to the receiver’s coordinate system.
    /// 
    /// If you specify nil for the layer parameter, this method returns the original point subtracted from the layer's frame's origin.
    /// - Parameters:
    ///   - point: A point specifying a location in the coordinate system of layer.
    ///   - layer: The layer with point in its coordinate system. The receiver and layer and must share a common parent layer. This parameter may be nil.
    /// - Returns: The point converted to the receiver’s coordinate system.
    public func convert(_ point: OpenCoreGraphics.CGPoint, from layer: CALayer?) -> OpenCoreGraphics.CGPoint {
        print("\(Self.self).\(#function)")
        fatalError("not implemented yet")
    }

    /// Converts the point from the receiver’s coordinate system to the specified layer’s coordinate system.
    /// 
    /// If you specify nil for the layer parameter, this method returns the original point added to the layer's frame's origin.
    /// - Parameters:
    ///   - point: A point specifying a location in the coordinate system of layer.
    ///   - layer: The layer into whose coordinate system point is to be converted. The receiver and layer must share a common parent layer. This parameter may be nil.
    /// - Returns: The point converted to the coordinate system of layer.
    public func convert(_ point: OpenCoreGraphics.CGPoint, to layer: CALayer?) -> OpenCoreGraphics.CGPoint {
        print("\(Self.self).\(#function)")
        fatalError("not implemented yet")
    }

    /// Converts the rectangle from the specified layer’s coordinate system to the receiver’s coordinate system.
    /// 
    /// If you specify nil for the layer parameter, this method returns the original rect with an origin subtracted from the layer's frame's origin.
    /// - Parameters:
    ///   - rect: A point specifying a location in the coordinate system of layer.
    ///   - layer: The layer with rect in its coordinate system. The receiver and layer and must share a common parent layer. This parameter may be nil.
    /// - Returns: The rectangle converted to the receiver’s coordinate system.
    public func convert(_ rect: OpenCoreGraphics.CGRect, from layer: CALayer?) -> OpenCoreGraphics.CGRect {
        print("\(Self.self).\(#function)")
        fatalError("not implemented yet")
    }

    /// Converts the rectangle from the receiver’s coordinate system to the specified layer’s coordinate system.
    /// 
    /// If you specify nil for the l parameter, this method returns the original rect with an origin added to the layer's frame's origin.
    /// - Parameters:
    ///   - rect: A point specifying a location in the coordinate system of layer.
    ///   - layer: The layer into whose coordinate system rect is to be converted. The receiver and layer and must share a common parent layer. This parameter may be nil.
    /// - Returns: The rectangle converted to the coordinate system of layer.
    public func convert(_ rect: OpenCoreGraphics.CGRect, to layer: CALayer?) -> OpenCoreGraphics.CGRect {
        print("\(Self.self).\(#function)")
        fatalError("not implemented yet")
    }

    /// Converts the time interval from the specified layer’s time space to the receiver’s time space.
    /// - Parameters:
    ///   - timeInterval: A point specifying a location in the coordinate system of layer.
    ///   - layer: The layer with timeInterval in its time space. The receiver and layer and must share a common parent layer.
    /// - Returns: The time interval converted to the receiver’s time space.
    public func convertTime(_ timeInterval: TimeInterval, from layer: CALayer?) -> TimeInterval {
        print("\(Self.self).\(#function)")
        fatalError("not implemented yet")
    }

    /// Converts the time interval from the receiver’s time space to the specified layer’s time space
    /// - Parameters:
    ///   - timeInterval: A point specifying a location in the coordinate system of layer.
    ///   - layer: The layer into whose time space timeInterval is to be converted. The receiver and layer and must share a common parent layer.
    /// - Returns: The time interval converted to the time space of layer.
    public func convertTime(_ timeInterval: TimeInterval, to layer: CALayer?) -> TimeInterval {
        print("\(Self.self).\(#function)")
        fatalError("not implemented yet")
    }

    // MARK: - Hit Testing

    /// Returns the farthest descendant of the receiver in the layer hierarchy (including itself) that contains the specified point.
    /// - Parameter point: A point in the coordinate system of the receiver's superlayer.
    /// - Returns: The layer that contains the point or nil if the point lies outside the receiver’s bounds rectangle.
    public func hitTest(_ point: OpenCoreGraphics.CGPoint) -> CALayer? {
        print("\(Self.self).\(#function)")
        fatalError("not implemented yet")
    }

    /// Returns whether the receiver contains a specified point.
    /// - Parameter point: A point in the receiver’s coordinate system.
    /// - Returns: true if the bounds of the layer contains the point.
    public func contains(_ point: OpenCoreGraphics.CGPoint) -> Bool {
        print("\(Self.self).\(#function)")
        fatalError("not implemented yet")
    }

    // MARK: - Scrolling

    /// The visible region of the layer in its own coordinate space.
    /// 
    /// The visible region is the area not clipped by the containing scroll layer.
    public var visibleRect: OpenCoreGraphics.CGRect = .init()

    /// Initiates a scroll in the layer’s closest ancestor scroll layer so that the specified point lies at the origin of the scroll layer.
    /// 
    /// If the layer is not contained by a ``CAScrollLayer`` object, this method does nothing.
    /// - Parameter point: The point in the current layer that should be scrolled into position.
    public func scroll(_ point: OpenCoreGraphics.CGPoint) {
        print("\(Self.self).\(#function)")
    }

    /// Initiates a scroll in the layer’s closest ancestor scroll layer so that the specified rectangle becomes visible.
    /// 
    /// If the layer is not contained by a ``CAScrollLayer`` object, this method does nothing.
    /// - Parameter rect: The rectangle to be made visible.
    public func scrollRectToVisible(_ rect: OpenCoreGraphics.CGRect) {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Identifying the Layer

    /// The name of the receiver.
    /// 
    /// The layer name is used by some layout managers to identify a layer. 
    /// The default value of this property is nil.
    public var name: String?

    // MARK: - Key-Value Coding Extension

    /// Returns a Boolean indicating whether the value of the specified key should be archived.
    /// 
    /// The default implementation returns true.
    /// - Parameter key: The name of one of the receiver’s properties.
    /// - Returns: true if the specified property should be archived or false if it should not.
    public func shouldArchiveValue(forKey key: String) -> Bool {
        print("\(Self.self).\(#function)")
        return true
    }

    /// Specifies the default value associated with the specified key.
    /// 
    /// If you define custom properties for a layer but do not set a value, this method returns a suitable “zero” default value based on the expected value of the key. 
    /// For example, if the value for key is a ``CGSize`` struct, the method returns a size struct containing (0.0,0.0) wrapped in an value object. 
    /// For a ``CGRect`` an empty rectangle is returned. For ``CGAffineTransform`` and ``CATransform3D``, the appropriate ``identity`` matrix is returned.
    /// 
    /// If key is not a known for property of the class, the result of the method is undefined.
    /// - Parameter key: The name of one of the receiver’s properties.
    /// - Returns: The default value for the named property. Returns nil if no default value has been set.
    public class func defaultValue(forKey key: String) -> Any? {
        print("\(Self.self).\(#function)")
        return nil
    }
}