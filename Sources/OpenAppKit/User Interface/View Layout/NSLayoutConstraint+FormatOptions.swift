import Foundation

extension NSLayoutConstraint {
    public struct FormatOptions: Equatable, Hashable, OptionSet, Sendable {
        
        // MARK: - Accessing the Raw Value

        /// The corresponding value of the raw type.
        public var rawValue: Int

        // MARK: - Constants

        /// Align all specified interface elements using NSLayoutConstraint.Attribute.left on each.
        public static let alignAllLeft = NSLayoutConstraint.FormatOptions(rawValue: 2)

        /// Align all specified interface elements using NSLayoutConstraint.Attribute.right on each.
        public static let alignAllRight = NSLayoutConstraint.FormatOptions(rawValue: 4)

        /// Align all specified interface elements using NSLayoutConstraint.Attribute.top on each.
        public static let alignAllTop = NSLayoutConstraint.FormatOptions(rawValue: 8)

        /// Align all specified interface elements using NSLayoutConstraint.Attribute.bottom on each.
        public static let alignAllBottom = NSLayoutConstraint.FormatOptions(rawValue: 16)

        /// Align all specified interface elements using NSLayoutConstraint.Attribute.leading on each.
        public static let alignAllLeading = NSLayoutConstraint.FormatOptions(rawValue: 32)

        /// Align all specified interface elements using NSLayoutConstraint.Attribute.trailing on each.
        public static let alignAllTrailing = NSLayoutConstraint.FormatOptions(rawValue: 64)

        /// Align all specified interface elements using NSLayoutConstraint.Attribute.centerX on each.
        public static let alignAllCenterX = NSLayoutConstraint.FormatOptions(rawValue: 128)

        /// Align all specified interface elements using NSLayoutConstraint.Attribute.centerY on each.
        public static let alignAllCenterY = NSLayoutConstraint.FormatOptions(rawValue: 256)

        /// Align all specified interface elements using the last baseline of each one.
        public static let alignAllLastBaseline = NSLayoutConstraint.FormatOptions(rawValue: 512)

        /// Align all specified interface elements using the first baseline of each one.
        public static let alignAllFirstBaseline = NSLayoutConstraint.FormatOptions(rawValue: 1024)

        /// Bit mask that can be combined with an NSLayoutConstraint.FormatOptions variable to yield only the alignment portion of the format options.
        public static let alignmentMask = NSLayoutConstraint.FormatOptions(rawValue: 2048)

        /// Arrange objects in order based on the normal text flow for the current user interface language. In left-to-right languages (like English), this arrangement results in the first object being placed farthest to the left, the next one to its right, and so on. In right-to-left languages (like Arabic or Hebrew), the ordering is reversed.
        public static let directionLeadingToTrailing = NSLayoutConstraint.FormatOptions(rawValue: 4096)
        /// Arrange objects in order from left to right.
        public static let directionLeftToRight = NSLayoutConstraint.FormatOptions(rawValue: 8192)

        /// Arrange objects in order from right to left.
        public static let directionRightToLeft = NSLayoutConstraint.FormatOptions(rawValue: 16384)

        /// A bit mask that can be combined with an NSLayoutConstraint.FormatOptions variable to yield only the direction portion of the format options.
        public static let directionMask = NSLayoutConstraint.FormatOptions(rawValue: 32768)

        // MARK: - Initializers

        /// Creates a new instance with the specified raw value.
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}