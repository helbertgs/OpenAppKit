import Foundation

/// An object that manages an app’s main event loop and resources used by all of that app’s objects.
@MainActor public class NSApplication {

    // MARK: - Accessing the shared application

    /// The singleton app instance.
    public static let shared = NSApplication()

    // MARK: - Configuring your app’s behavior

    /// The delegate of the app object.
    public var delegate: (any NSApplicationDelegate)?
}

extension NSApplication {
    public struct LaunchOptionsKey: Equatable, Hashable, Sendable {

    }
}

extension NSApplication {
    public enum TerminateReply: Equatable, Hashable, Sendable {
        case now
        case cancel
        case later
    }
}