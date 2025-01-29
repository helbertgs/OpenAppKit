import Foundation
import OpenCoreGraphics

public typealias NSColor = OpenCoreGraphics.CGColor

///// An object that stores color data and sometimes opacity (alpha value).
//@MainActor public struct NSColor: Equatable, Hashable, Sendable {
//
//    let red: Float
//    let green: Float
//    let blue: Float
//    let alpha: Float
//
//    public init(red: Float, green: Float, blue: Float, alpha: Float = 0) {
//        self.red = red
//        self.green = green
//        self.blue = blue
//        self.alpha = alpha
//    }
//}
//
//extension NSColor {
//    public static var clear: NSColor {
//        .init(red: 0, green: 0, blue: 0, alpha: 0)
//    }
//}
