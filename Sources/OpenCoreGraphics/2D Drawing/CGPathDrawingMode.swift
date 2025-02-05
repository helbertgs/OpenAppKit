import Foundation

/// Options for rendering a path.
/// 
/// You can pass a path drawing mode constant to the function ``drawPath(using:)`` to specify how Core Graphics should paint a graphics context’s current path.
public enum CGPathDrawingMode: String, Codable, Equatable, Sendable {
    
    /// Render the area contained within the path using the non-zero winding number rule.
    case fill

    /// Render the area within the path using the even-odd rule.
    case eoFill

    /// Render a line along the path.
    case stroke

    /// First fill and then stroke the path, using the nonzero winding number rule.
    case fillStroke

    /// First fill and then stroke the path, using the even-odd rule.
    case eoFillStroke
}