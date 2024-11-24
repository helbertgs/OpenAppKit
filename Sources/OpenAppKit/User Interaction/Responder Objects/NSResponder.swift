import Foundation

/// An abstract class that forms the basis of event and command processing in AppKit.
@MainActor open class NSResponder {

    // MARK: - Changing the First Responder

    /// A Boolean value that indicates whether the responder accepts first responder status.
    /// As first responder, the receiver is the first object in the responder chain to be sent key events and action messages. 
    /// By default, this property is false. Subclasses set this property to true if the receiver accepts first responder status.
    open var acceptsFirstResponder: Bool = false

    /// Notifies the receiver that it’s about to become first responder in its NSWindow.
    /// 
    /// The default implementation returns true, accepting first responder status. 
    /// Subclasses can override this method to update state or perform some action such as highlighting the selection, or to return false, refusing first responder status.
    /// Use the ``NSWindow.makeFirstResponder(_:)`` method, not this method, to make an object the first responder. 
    /// Never invoke this method directly.
    open func becomeFirstResponder() -> Bool {
        true
    }
    
    /// Notifies the receiver that it’s been asked to relinquish its status as first responder in its window.
    /// 
    /// The default implementation returns true, resigning first responder status. 
    /// Subclasses can override this method to update state or perform some action such as unhighlighting the selection, or to return false, refusing to relinquish first responder status.
    /// Use the ``NSWindow.makeFirstResponder(_:)`` method, not this method, to make an object the first responder. 
    /// Never invoke this method directly.
    open func resignFirstResponder() -> Bool {
        true
    }

    /// Allows controls to determine when they should become first responder.
    /// 
    /// Some controls, such as ``NSTextField``, should only become first responder when the enclosing ``NSTableView``/``NSBrowser`` indicates that the view can begin editing. 
    /// It is up to the particular control that wants to be validated to call this method in its ``mouseDown(with:)`` method (or perhaps at another time) to determine if it should attempt to become the first responder or not.
    /// The ``NSTableView``, ``NSOutlineView``, and ``NSBrowser`` classes implement this to allow first responder status only if the responder is a view in a selected row. 
    /// It also delays the first responder assignment if a doubleAction may be invoked.
    /// The default implementation returns true when there is no ``nextResponder`` set, otherwise, it is forwarded up the responder chain.
    /// - Parameters:
    ///   - responder: The first responder.
    ///   - event: The event to validate. May be nil if there is no applicable event.
    /// - Returns: true if the control should become first responder, otherwise false.
    open func validateProposedFirstResponder(_ responder: NSResponder, for event: NSEvent?) -> Bool {
        true
    }
}