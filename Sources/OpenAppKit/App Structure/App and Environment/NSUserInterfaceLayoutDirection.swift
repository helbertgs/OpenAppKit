import Foundation

/// Specifies the directional flow of the user interface.
/// 
/// These constants are returned by ``userInterfaceLayoutDirection``.
@MainActor
public enum NSUserInterfaceLayoutDirection: Equatable, Hashable, Sendable {

    // MARK: - Constants

    /// Layout direction is left to right.
    case leftToRight

    /// Layout direction is right to left.
    case rightToLeft
}