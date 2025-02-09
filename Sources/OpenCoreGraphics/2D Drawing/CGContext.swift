import Foundation
import OpenGLAD

/// An OpenGL drawing environment.
/// 
/// The CGContext type represents an OpenGL drawing destination. 
/// A graphics context contains drawing parameters and all device-specific information needed to render the paint on a page to the destination, whether the destination is a window in an application, a bitmap image, a PDF document, or a printer.
@MainActor public class CGContext {

    // MARK: - Creating Bitmap Graphics Contexts

    public init() {
    }

    // MARK: - Converting Between Coordinate Spaces.

    /// The affine transforms that maps the user space of the graphics context to the device space.
    public var userSpaceToDeviceSpaceTransform: CGAffineTransform = .init()

    /// Returns a point that is transformed from user space coordinates to device space coordinates.
    /// - Parameter point: The point, in user space coordinates, to transform.
    /// - Returns: The coordinates of the point in device space coordinates.
    public func convertToDeviceSpace(_ point: CGPoint) -> CGPoint {
        .init()
    }

    /// Returns a point that is transformed from device space coordinates to user space coordinates.
    /// - Parameter point: The point, in device space coordinates, to transform.
    /// - Returns: The coordinates of the point in user space coordinates.
    public func convertToUserSpace(_ point: CGPoint) -> CGPoint {
        .init()
    }

    /// Returns a rectangle that is transformed from user space coordinate to device space coordinates.
    /// 
    /// In general affine transforms do not preserve rectangles. 
    /// As a result, this function returns the smallest rectangle that contains the transformed corner points of the rectangle.
    /// - Parameter rect: The rectangle, in user space coordinates, to transform.
    /// - Returns: The rectangle in device space coordinates.
    public func convertToDeviceSpace(_ rect: CGRect) -> CGRect {
        .init()
    }

    /// Returns a rectangle that is transformed from device space coordinate to user space coordinates.
    /// 
    /// In general, affine transforms do not preserve rectangles. 
    /// As a result, this function returns the smallest rectangle that contains the transformed corner points of the rectangle.
    /// - Parameter rect: The rectangle, in device space coordinates, to transform.
    /// - Returns: The rectangle in user space coordinates.
    public func convertToUserSpace(_ rect: CGRect) -> CGRect {
        .init()
    }

    /// Returns a size that is transformed from user space coordinates to device space coordinates.
    /// - Parameter size: The size, in user space coordinates, to transform.
    /// - Returns: The size in device space coordinates.
    public func convertToDeviceSpace(_ size: CGSize) -> CGSize {
        .init()
    }

    /// Returns a size that is transformed from device space coordinates to user space coordinates.
    /// - Parameter size: The size, in device space coordinates, to transform.
    /// - Returns: The size in user space coordinates.
    public func convertToUserSpace(_ size: CGSize) -> CGSize {
        .init()
    }

    // MARK: - Constructing a Current Graphics Path

    /// A path object containing the current path data.
    public private(set) var path: CGPath?

    /// Creates a new empty path in a graphics context.
    /// 
    /// A graphics context can have only a single path in use at any time. I
    /// f the specified context already contains a current path when you call this function, the old path and any data associated with it is discarded.
    /// 
    /// The current path is not part of the graphics state. 
    /// Consequently, saving and restoring the graphics state has no effect on the current path.
    public func beginPath() {
    }

    /// Begins a new subpath at the specified point.
    /// 
    /// The specified point becomes the start point of a new subpath. 
    /// The current point is set to this start point.
    /// - Parameter point: The point, in user space coordinates, at which to start a new subpath.
    public func move(to point: CGPoint) {
    }

    /// Appends a straight line segment from the current point to the specified point.
    /// 
    /// After adding the line segment, the current point is set to the endpoint of the line segment.
    /// - Parameter point: The location, in user space coordinates, for the end of the new line segment.
    public func addLine(to point: CGPoint) {

    }

    /// Adds a sequence of connected straight-line segments to the current path.
    /// 
    /// Calling this convenience method is equivalent to calling the ``move(to:)`` method with the first value in the points array, then calling the ``addLine(to:)`` method for each subsequent point until the array is exhausted. 
    /// After calling this method, the path's current point is the last point in the array.
    /// - Parameter points: An array of values that specify the start and end points of the line segments to draw. Each point in the array specifies a position in user space. The first point in the array specifies the initial starting point.
    public func addLines(between points: [CGPoint]) {
    }

    /// Adds an ellipse that fits inside the specified rectangle.
    /// 
    /// The ellipse is approximated by a sequence of Bézier curves. 
    /// Its center is the midpoint of the rectangle defined by the rect parameter. 
    /// If the rectangle is square, then the ellipse is circular with a radius equal to one-half the width (or height) of the rectangle. 
    /// If the rect parameter specifies a rectangular shape, then the major and minor axes of the ellipse are defined by the width and height of the rectangle.
    /// 
    /// The ellipse forms a complete subpath of the path—that is, the ellipse drawing starts with a move-to operation and ends with a close-subpath operation, with all moves oriented in the clockwise direction.
    /// - Parameter rect: A rectangle that defines the area for the ellipse to fit in.
    public func addEllipse(in rect: CGRect) {
    }

    /// Adds an arc of a circle to the current path, specified with a radius and angles.
    /// 
    /// This method calculates starting and ending points using the radius and angles you specify, uses a sequence of cubic Bézier curves to approximate a segment of a circle between those points, and then appends those curves to the current path.
    /// 
    /// The clockwise parameter determines the direction in which the arc is created; the actual direction of the final path is dependent on the current transformation matrix of the graphics context. 
    /// In a flipped coordinate system (the default for UIView drawing methods in iOS), specifying a clockwise arc results in a counterclockwise arc after the transformation is applied.
    /// 
    /// If the current path already contains a subpath, this method adds a line connecting the current point to the starting point of the arc. 
    /// If the current path is empty, his method creates a new subpath whose starting point is the starting point of the arc. 
    /// The ending point of the arc becomes the new current point of the path.
    /// - Parameters:
    ///   - center: The center of the arc, in user space coordinates.
    ///   - radius: The radius of the arc, in user space coordinates.
    ///   - startAngle: The angle to the starting point of the arc, measured in radians from the positive x-axis.
    ///   - endAngle: The angle to the end point of the arc, measured in radians from the positive x-axis.
    ///   - clockwise: true to make a clockwise arc; false to make a counterclockwise arc.
    public func addArc(center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool) {
    }

    /// Adds an arc of a circle to the current path, specified with a radius and two tangent lines.
    /// 
    /// This method calculates two tangent lines—the first from the current point to the tangent1End point, and the second from the tangent1End point to the tangent2End point—then calculates the start and end points for a circular arc of the specified radius such that the arc is tangent to both lines. 
    /// Finally, this method approximates that arc with a sequence of cubic Bézier curves and appends those curves to the current path.
    /// 
    /// If the starting point of the arc (that is, the point where a circle of the specified radius must meet the first tangent line in order to also be tangent to the second line) is not the current point, this method appends a straight line segment from the current point to the starting point of the arc.
    /// 
    /// The ending point of the arc (that is, the point where a circle of the specified radius must meet the second tangent line in order to also be tangent to the first line) becomes the new current point of the path.
    /// - Parameters:
    ///   - tangent1End: The end point, in user space coordinates, for the first tangent line to be used in constructing the arc. (The start point for this tangent line is the path's current point.)
    ///   - tangent2End: The end point, in user space coordinates, for the second tangent line to be used in constructing the arc. (The start point for this tangent line is the tangent1End point.)
    ///   - radius: The radius of the arc, in user space coordinates.   
    public func addArc(tangent1End: CGPoint, tangent2End: CGPoint, radius: CGFloat) {
    }

    /// Adds a cubic Bézier curve to the current path, with the specified end point and control points.
    /// 
    /// This method constructs a curve starting from the path's current point and ending at the specified end point, with curvature defined by the two control points. 
    /// After this method appends that curve to the current path, the end point of the curve becomes the path's current point.
    /// - Parameters:
    ///   - end: The point, in user space coordinates, at which to end the curve.
    ///   - control1: The first control point of the curve, in user space coordinates.
    ///   - control2: The second control point of the curve, in user space coordinates.
    public func addCurve(to end: CGPoint, control1: CGPoint, control2: CGPoint) {
    }

    /// Adds a quadratic Bézier curve to the current path, with the specified end point and control point.
    /// 
    /// This method constructs a curve starting from the path’s current point and ending at the specified end point, with curvature defined by the control point. 
    /// After this method appends that curve to the current path, the end point of the curve becomes the path’s current point.
    /// - Parameters:
    ///   - end: The point, in user space coordinates, at which to end the curve.
    ///   - control: The control point of the curve, in user space coordinates.
    public func addQuadCurve(to end: CGPoint, control: CGPoint) {
    }

    /// Adds a previously created path object to the current path in a graphics context.
    /// 
    /// If the source path is non-empty, then its path elements are appended in order onto the current path. 
    /// The current transformation matrix (CTM) is applied to the points before adding them to the path.
    /// 
    /// After the call completes, the start point and current point of the path are those of the last subpath in path.
    /// - Parameter path: A previously created path object.
    public func addPath(_ path: CGPath) {
    }

    /// Closes and terminates the current path’s subpath.
    /// 
    /// Appends a line from the current point to the starting point of the current subpath and ends the subpath.
    /// 
    /// After closing the subpath, your application can begin a new subpath without first calling ``moveTo(x:y:)``. 
    /// In this case, a new subpath is implicitly created with a starting and current point equal to the previous subpath’s starting point.
    /// 
    /// If the current path is empty or the current subpath is already closed, this function does nothing.
    public func closePath() {
    }

    // MARK: - Examining the Current Graphics Path

    /// Returns the smallest rectangle that contains the current path.
    /// 
    /// The bounding box is the smallest rectangle completely enclosing all points in a path, including control points for Bézier cubic and quadratic curves.
    public private(set) var boundingBoxOfPath: CGRect = .zero

    /// Returns the current point in a non-empty path.
    /// 
    /// The location, in user space, of the current point in the context’s path. If there is no path, the function returns ``CGPoint.zero``.
    public private(set) var currentPointOfPath: CGPoint = .zero

    /// Indicates whether the current path contains any subpaths.
    /// 
    /// Returns ``true`` if the context’s path contains no subpaths, otherwise returns ``false``.
    public private(set) var isPathEmpty: Bool = true

    /// Checks to see whether the specified point is contained in the current path.
    /// 
    /// A point is contained within the path of a graphics context if the point is inside the painted region when the path is stroked or filled with opaque colors using the specified path drawing mode. 
    /// A point can be inside a path only if the path is explicitly closed by calling the function ``closePath()`` for paths drawn directly to the current context, or ``closeSubpath()`` for paths first created as ``CGPath`` objects and then drawn to the current context.
    /// - Parameters:
    ///   - point: The point to check, specified in user space units.
    ///   - mode: A path drawing mode.
    /// - Returns: Returns true if point is inside the current path of the graphics context; false otherwise.
    public func pathContains(_ point: CGPoint, mode: CGPathDrawingMode) -> Bool {
        false
    }

    // MARK: - Drawing the Current Graphics Path

    /// Draws the current path using the provided drawing mode.
    /// 
    /// The current path is cleared as a side effect of calling this function.
    /// - Parameter mode: A path drawing mode constant
    public func drawPath(using mode: CGPathDrawingMode) {
    }

    /// Paints the area within the current path, as determined by the specified fill rule.
    /// 
    /// If the current path contains any non-closed subpaths, this method treats each subpath as if it had been closed with the ``closePath()`` method, then applies the specified rule to determine which areas to fill.
    /// - Parameter rule: The rule for determining which areas to treat as the interior of the path.
    public func fillPath(using rule: CGPathFillRule = .winding) {
    }

    /// Paints a line along the current path.
    /// 
    /// The line width and stroke color of the context’s graphics state are used to paint the path. 
    /// The current path is cleared as a side effect of calling this function.
    public func strokePath() {
    }

    // MARK: - Drawing Shapes

    /// Paints a transparent rectangle.
    /// 
    /// If the provided context is a window or bitmap context, Core Graphics clears the rectangle. 
    /// For other context types, Core Graphics fills the rectangle in a device-dependent manner. 
    ///  However, you should not use this function in contexts other than window or bitmap contexts.
    /// - Parameter rect: The rectangle, in user space coordinates.
    public func clear(_ rect: CGRect) {
    }

    /// Paints the area contained within the provided rectangle, using the fill color in the current graphics state.
    /// 
    /// The current path is cleared as a side effect of calling this function.
    /// - Parameter rect: A rectangle, in user space coordinates.
    public func fill(_ rect: CGRect) {
    }

    /// Paints the areas contained within the provided rectangles, using the fill color in the current graphics state.
    /// 
    /// The current path is cleared as a side effect of calling this function.
    /// - Parameter rects: An array of rectangles, in user space coordinates.
    public func fill(_ rects: [CGRect]) {
    }

    /// Paints the area of the ellipse that fits inside the provided rectangle, using the fill color in the current graphics state.
    /// 
    /// The current path is cleared as a side effect of calling this function.
    /// - Parameter rect: A rectangle that defines the area for the ellipse to fit in.
    public func fillEllipse(in rect: CGRect) {
    }

    /// Paints a rectangular path.
    /// 
    /// The line width and stroke color of the context’s graphics state are used to paint the path. 
    /// The current path is cleared as a side effect of calling this function.
    /// - Parameter rect: A rectangle, specified in user space coordinates.
    public func stroke(_ rect: CGRect) {
    }

    /// Paints a rectangular path, using the specified line width.
    /// 
    /// Aside from the line width value, Core Graphics uses the current attributes of the graphics state (such as stroke color) to paint the line. 
    /// The line straddles the path, with half of the total width on either side.
    /// 
    /// The current path is cleared as a side effect of calling this function.
    /// - Parameters:
    ///   - rect: A rectangle, in user space coordinates.
    ///   - width: A value, in user space units, that is greater than zero. This value does not affect the line width values in the current graphics state.
    public func stroke(_ rect: CGRect, width: CGFloat) {
    }

    /// Strokes an ellipse that fits inside the specified rectangle.
    /// 
    /// The current path is cleared as a side effect of calling this function.
    /// - Parameter rect: A rectangle that defines the area for the ellipse to fit in.
    public func strokeEllipse(in rect: CGRect) {
    }

    /// Strokes a sequence of line segments.
    /// 
    /// This function creates a new path, adds the individual line segments to the path, and then strokes the path. 
    /// The current path is cleared as a side effect of calling this function.
    /// - Parameter points: An array of points, organized as pairs—the starting point of a line segment followed by the ending point of a line segment.
    public func strokeLineSegments(between points: [CGPoint]) {
    }

    // MARK: - Drawing Images and PDF Content

    /// Returns the current level of interpolation quality for a graphics context.
    /// 
    /// Interpolation quality is a graphics state parameter that provides a hint for the level of quality to use for image interpolation (for example, when scaling the image). 
    /// Not all contexts support all interpolation quality levels.
    public var interpolationQuality: CGInterpolationQuality = .medium

    /// Draws an image in the specified area.
    /// 
    /// This method scales the image (disproportionately, if necessary) to fit the bounds specified by the rect parameter.
    /// When the byTiling parameter is true, the image is tiled in user space—thus, unlike when drawing with patterns, the current transformation (see the ctm property) affects the final result.
    /// - Parameters:
    ///   - image: The image to draw.
    ///   - rect: The rectangle, in user space coordinates, in which to draw the image.
    ///   - byTiling: If true, this method fills the context's entire clipping region by tiling many copies of the image, and the rect parameter defines the origin and size of the tiling pattern.
    ///               If false (the default), this method draws a single copy of the image in the area defined by the rect parameter.
    public func draw(_ image: CGImage, in rect: CGRect, byTiling: Bool = false) {
    }

    // MARK: - Drawing Core Graphics Layers

    /// Draws the contents of a layer object at the specified point.
    /// 
    /// Calling this method is equivalent to calling the draw(_:in:) method with a rectangle whose origin is the specified point and whose size matches that of the specified layer.
    /// - Parameters:
    ///   - layer: The layer whose contents you want to draw.
    ///   - point: The location, in current user space coordinates, to use as the origin for the drawing.
    public func draw(_ layer: CGLayer, at point: CGPoint) {
    }

    /// Draws the contents of a layer object into the specified rectangle.
    /// 
    /// The contents are scaled, if necessary, to fit into the rectangle.
    /// - Parameters:
    ///   - layer: The layer whose contents you want to draw.
    ///   - rect: The rectangle, in current user space coordinates, to draw in.
    public func draw(_ layer: CGLayer, in rect: CGRect) {
    }

    // MARK: - Setting Fill, Stroke, and Shadow Colors

    /// The new fill color.
    public var fillColor: CGColor = .black

    /// The new fill color space.
    public var fillColorSpace: CGColorSpace = .init()

    /// The new stroke color.
    public var strokeColor: CGColor = .black

    /// The new stroke color space.
    public var strokeColorSpace: CGColorSpace = .init()

    /// A value that specifies the opacity level.
    public var alpha: Double = 0

    // MARK: - Working with the Current Transformation Matrix

    /// Returns the current transformation matrix.
    public var ctm: CGAffineTransform = .init()

    /// Rotates the user coordinate system in a context.
    /// 
    /// The direction that the context is rotated may appear to be altered by the state of the current transformation matrix prior to executing this function. 
    /// For example, on iOS, a UIView applies a transformation to the graphics context that inverts the Y-axis (by multiplying it by -1). 
    /// Rotating the user coordinate system on coordinate system that was previously flipped results in a rotation in the opposite direction (that is, positive values appear to rotate the coordinate system in the clockwise direction).
    /// - Parameter angle: The angle, in radians, by which to rotate the coordinate space of the specified context. Positive values rotate counterclockwise and negative values rotate clockwise.)
    public func rotate(by angle: CGFloat) {
    }

    /// Changes the scale of the user coordinate system in a context.
    /// - Parameters:
    ///   - sx: The factor by which to scale the x-axis of the coordinate space of the specified context.
    ///   - sy: The factor by which to scale the y-axis of the coordinate space of the specified context.
    public func scaleBy(x sx: CGFloat, y sy: CGFloat) {
    }

    /// Changes the origin of the user coordinate system in a context.
    /// - Parameters:
    ///   - tx: The amount to displace the x-axis of the coordinate space, in units of the user space, of the specified context.
    ///   - ty: The amount to displace the y-axis of the coordinate space, in units of the user space, of the specified context.
    public func translateBy(x tx: CGFloat, y ty: CGFloat) {
    }

    /// Transforms the user coordinate system in a context using a specified matrix.
    /// 
    /// When you call this function, it concatenates (that is, it combines) two matrices, by multiplying them together. 
    /// The order in which matrices are concatenated is important, as the operations are not commutative. 
    /// The resulting CTM in the context is: CTMnew = transform * CTMcontext.
    /// - Parameter transform: The transformation matrix to apply to the specified context’s current transformation matrix.
    public func concatenate(_ transform: CGAffineTransform) {
    }

    // MARK: - Saving and Restoring Graphics State

    /// Pushes a copy of the current graphics state onto the graphics state stack for the context.
    /// 
    /// Each graphics context maintains a stack of graphics states. 
    /// Note that not all aspects of the current drawing environment are elements of the graphics state. 
    /// For example, the current path is not considered part of the graphics state and is therefore not saved when you call this function. 
    /// The graphics state parameters that are saved are:
    /// CTM (current transformation matrix), clip region, image interpolation quality, line width, line join, miter limit, line cap, line dash, flatness, should anti-alias, rendering intent, fill color space, stroke color space, fill color
    /// stroke color, alpha value, font, font size, character spacing, text drawing mode, shadow parameters, the pattern phase, the font smoothing parameter, blend mode
    public func saveGState() {
    }

    /// Sets the current graphics state to the state most recently saved.
    /// 
    /// Core Graphics removes the graphics state at the top of the stack so that the most recently saved state becomes the current graphics state.
    public func restoreGState() {
    }

    // MARK: - Managing a Graphics Context

    /// Forces all pending drawing operations in a window context to be rendered immediately to the destination device.
    /// 
    /// When you call this function, Core Graphics immediately flushes the current drawing to the destination device (for example, a screen). 
    /// Because the system software flushes a context automatically at the appropriate times, calling this function could have an adverse effect on performance. 
    /// Under normal conditions, you do not need to call this function.
    public func flush() {
    }

    /// Marks a window context for update.
    /// 
    /// When you call this function, all drawing operations since the last update are flushed at the next regular opportunity. 
    /// Under normal conditions, you do not need to call this function.
    public func synchronize() {
    }

    /// Compositing operations for images.
    public var blendMode: CGBlendMode = .normal

    // MARK: - Managing a Bitmap Graphics Context

    
}