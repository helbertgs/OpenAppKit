import Foundation

/// This mask is used by the ``edgeAntialiasingMask`` property.
@MainActor public enum CAEdgeAntialiasingMask: CaseIterable, Equatable, Hashable {
    case left
    case right
    case bottom
    case top
}