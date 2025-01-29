import Foundation

extension NSEvent {
    /// Flags that represent key states in an event object.
    @MainActor
    public struct ModifierFlags: Equatable, Hashable, OptionSet, Sendable {

        public let rawValue: Int

        // MARK: - Event Modifier Flags

        /// The Shift key has been pressed.
        public static let shift = ModifierFlags(rawValue: 0x0001)

        /// The Control key has been pressed.
        public static let control = ModifierFlags(rawValue: 0x0002)

        /// The Option or Alt key has been pressed.
        public static let option = ModifierFlags(rawValue: 0x0004)

        /// The Command key has been pressed.
        public static let command = ModifierFlags(rawValue: 0x0008)
        
        /// The Caps Lock key has been pressed.
        public static let capsLock = ModifierFlags(rawValue: 0x0010)

        /// A key in the numeric keypad or an arrow key has been pressed.
        public static let numericPad = ModifierFlags(rawValue: 0x0020)

        /// The Help key has been pressed.
        public static let help = ModifierFlags(rawValue: 0x0040)

        /// A function key has been pressed.
        public static let function = ModifierFlags(rawValue: 0x0080)

        /// Device-independent modifier flags are masked.
        public static let deviceIndependentFlagsMask = ModifierFlags(rawValue: 0x0100)

        /// Default value
        public static let none = ModifierFlags([])

        nonisolated public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}
