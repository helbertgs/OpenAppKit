import Foundation

/// A set of optional methods that you can use to respond to drawing failures and manage incremental loads.
@MainActor
public protocol NSImageDelegate : AnyObject {

    // MARK: - Responding to Drawing Failure

    /// Tells the delegate that the image object is unable, for whatever reason, to lock focus on its image or draw in the specified rectangle.
    /// 
    /// The delegate can do one of the following:
    /// - Return another NSImage object to draw in the sender’s place.
    /// - Draw the image itself and return nil.
    /// - Simply return nil to indicate that sender should give up on the attempt at drawing the image.
    /// - Parameters:
    ///   - sender: The NSImage object that encountered the problem.
    ///   - rect: The rectangle that the image object was attempting to draw.
    /// - Returns: An NSImage to draw in place of the one in sender, or nil if the delegate wants to draw the image itself.
    func imageDidNotDraw(_ sender: NSImage, in rect: NSRect) -> NSImage?
}