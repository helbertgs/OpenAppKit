import Foundation

/// An object that stores color data and sometimes opacity (alpha value).
@MainActor public struct NSColor: Equatable, Hashable, Sendable {

    let red: Float
    let green: Float
    let blue: Float
    let alpha: Float

    public init(red: Float, green: Float, blue: Float, alpha: Float = 0) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
}