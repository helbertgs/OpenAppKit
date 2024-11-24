import Foundation

/// A set of components that define a color, with a color space specifying how to interpret them.
/// 
/// CGColor is the fundamental data type used internally by Core Graphics to represent colors. 
/// CGColor objects, and the functions that operate on them, provide a fast and convenient way of managing and setting colors directly, especially colors that are reused (such as black for text).
/// 
/// A color object contains a set of components (such as red, green, and blue) that uniquely define a color, and a color space that specifies how those components should be interpreted.
/// 
/// Color objects provide a fast and convenient way to manage and set colors, especially colors that are used repeatedly. 
/// Drawing operations use color objects for setting fill and stroke colors, managing alpha, and setting color with a pattern.
@MainActor
public struct CGColor: Equatable, Hashable, Sendable {

    // MARK: - Getting System Colors

    /// The black color in the Generic gray color space.
    public static let black = CGColor(red: 0, green: 0, blue: 0, alpha: 1)

    /// The white color in the Generic gray color space.
    public static let white = CGColor(red: 1, green: 1, blue: 1, alpha: 1)

    /// The clear color in the Generic gray color space.
    public static let clear = CGColor(red: 0, green: 0, blue: 0, alpha: 0)

    // MARK: - Examining a Color
    
    /// Returns the value of the alpha component associated with a color.
    /// An alpha intensity value in the range [0,1]. 
    /// The value represents the opacity of the color.
    public let alpha: Float

    /// Returns the value of the red component associated with a color.
    /// A red value in the range [0,1]. 
    public let red: Float

    /// Returns the value of the green component associated with a color.
    /// A green value in the range [0,1]. 
    public let green: Float

    /// Returns the value of the blue component associated with a color.
    /// An blue value in the range [0,1].
    public let blue: Float

    /// Creates a color in the Generic RGB color space.
    /// - Parameters:
    ///   - red: A red component value (0.0 - 1.0).
    ///   - green: A green component value (0.0 - 1.0).
    ///   - blue: A blue component value (0.0 - 1.0).
    ///   - alpha: An alpha value (0.0 - 1.0).
    /// - Returns: A color object.
    public init(red: Float, green: Float, blue: Float, alpha: Float) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }

    /// Creates a color in the Generic gray color space.
    /// - Parameters:
    ///   - gray: A grayscale value (0.0 - 1.0).
    ///   - alpha: An alpha value (0.0 - 1.0).
    /// - Returns: A color object.
    public init(gray: Float, alpha: Float) {
        self.red = gray
        self.green = gray
        self.blue = gray
        self.alpha = alpha
    }
}