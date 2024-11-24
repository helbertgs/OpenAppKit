import Foundation

@MainActor public struct NSUserInterfaceItemIdentifier: @preconcurrency RawRepresentable, Sendable {
    
    /// The corresponding value of the raw type.
    public let rawValue: String

    /// Creates a new instance with the specified raw value.
    /// - Parameter rawValue: The corresponding value of the raw type.
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}