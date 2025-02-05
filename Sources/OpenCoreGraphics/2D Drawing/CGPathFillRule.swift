import Foundation

/// Rules for determining which regions are interior to a path, used by the ``fillPath(using:)`` and ``clip(using:)`` methods.
/// 
/// When filling a path, regions that a fill rule defines as interior to the path are painted. 
/// When clipping with a path, regions interior to the path remain visible after clipping.
public enum CGPathFillRule: String, Codable, Equatable, Hashable, Sendable {

    /// A rule that considers a region to be interior to a path based on the number of times it is enclosed by path elements.
    case evenOdd
    
    /// A rule that considers a region to be interior to a path if the winding number for that region is nonzero.
    case winding
}