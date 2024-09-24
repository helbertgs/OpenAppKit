import Foundation

/// An object that stores color data and sometimes opacity (alpha value).
public class NSColor {

    package let red: Float
    package let green: Float
    package let blue: Float
    package let alpha: Float

    public init(red: Float, green: Float, blue: Float, alpha: Float = 0) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
}