import Foundation

public class CGPath {

    public init() {
    }
    
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
    public func addArc(center: CGPoint, radius: Double, startAngle: Double, endAngle: Double, clockwise: Bool) {
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
    public func addArc(tangent1End: CGPoint, tangent2End: CGPoint, radius: Double) {
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
}