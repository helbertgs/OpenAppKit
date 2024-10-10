import Foundation

@MainActor
public struct CAAutoresizingMask: OptionSet, Sendable {

    // MARK: - Special Values

    public static let layerNotSizable = CAAutoresizingMask(rawValue: -1)

    /// The left margin between the receiver and its superview is flexible.
    public static let layerMinXMargin = CAAutoresizingMask(rawValue: 1)

    /// The receiver’s width is flexible.
    public static let layerWidthSizable = CAAutoresizingMask(rawValue: 2)

    /// The right margin between the receiver and its superview is flexible.
    public static let layerMaxXMargin = CAAutoresizingMask(rawValue: 4)

    /// The bottom margin between the receiver and its superview is flexible.
    public static let layerMinYMargin = CAAutoresizingMask(rawValue: 8)

    /// The receiver’s height is flexible.
    public static let layerHeightSizable = CAAutoresizingMask(rawValue: 16)

    /// The top margin between the receiver and its superview is flexible.
    public static let layerMaxYMargin = CAAutoresizingMask(rawValue: 32)

    // MARK: - Creating a CAAutoresizingMask

    public let rawValue: Int

    public nonisolated init(rawValue: Int) {
        self.rawValue = rawValue
    }
}