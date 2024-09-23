import Foundation

/// An object that contains information about an input action, such as a mouse click or a key press.
public class NSEvent {
}

extension NSEvent {
    /// Flags that represent key states in an event object.
    public struct ModifierFlags: OptionSet, Sendable {

        // MARK: - Event Modifier Flags

        /// The Caps Lock key has been pressed.
        public static let capsLock = ModifierFlags(rawValue: 1)

        /// The Shift key has been pressed.
        public static let shift = ModifierFlags(rawValue: 2)

        /// The Control key has been pressed.
        public static let control = ModifierFlags(rawValue: 4)

        /// The Option or Alt key has been pressed.
        public static let option = ModifierFlags(rawValue: 8)

        /// The Command key has been pressed.
        public static let command = ModifierFlags(rawValue: 16)

        /// A key in the numeric keypad or an arrow key has been pressed.
        public static let numericPad = ModifierFlags(rawValue: 32)

        /// The Help key has been pressed.
        public static let help = ModifierFlags(rawValue: 64)

        /// A function key has been pressed.
        public static let function = ModifierFlags(rawValue: 128)

        /// Device-independent modifier flags are masked.
        public static let deviceIndependentFlagsMask = ModifierFlags(rawValue: 256)

        // MARK: - Accessing the Raw Value
        
        /// The corresponding value of the raw type.
        public var rawValue: Int

        // MARK: - Initializers

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}