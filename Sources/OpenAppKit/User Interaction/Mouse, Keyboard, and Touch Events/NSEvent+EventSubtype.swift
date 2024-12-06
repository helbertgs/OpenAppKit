import Foundation

extension NSEvent {
    /// Subtypes for various types of events.
    /// The event subtype contains one of these constants only when the event’s type property contains ``NSAppKitDefined``, ``NSSystemDefined``, or ``NSApplicationDefined`` or a mouse-related event type.
    /// These subtypes apply when the event type is NSEvent.EventType.appKitDefined.
    @MainActor
    public struct EventSubtype: RawRepresentable, Sendable {
        
        // MARK: - Getting AppKit Event Subtypes
        
        /// An app-activation event occurred.
        public static let applicationActivated = EventSubtype(rawValue: 1)

        /// An app-deactivation event occurred.
        public static let applicationDeactivated = EventSubtype(rawValue: 2)

        /// An event that indicates a window changed screens.
        public static let screenChanged = EventSubtype(rawValue: 3)

        /// An event that indicates a window’s contents are visible again.
        public static let windowExposed = EventSubtype(rawValue: 4)

        /// An event that indicates a window moved.
        public static let windowMoved = EventSubtype(rawValue: 5)

        /// None
        public static let none = EventSubtype(rawValue: 0)

         // MARK: - Accessing the Raw Value
        
        /// The corresponding value of the raw type.
        public let rawValue: Int

        // MARK: - Initializers

        nonisolated public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}
