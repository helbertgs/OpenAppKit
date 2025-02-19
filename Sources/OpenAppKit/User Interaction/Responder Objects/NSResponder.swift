import Foundation

/// An abstract class that forms the basis of event and command processing in AppKit.
@MainActor open class NSResponder: Sendable {

    // MARK: - Changing the First Responder

    /// A Boolean value that indicates whether the responder accepts first responder status.
    /// As first responder, the receiver is the first object in the responder chain to be sent key events and action messages. 
    /// By default, this property is false. Subclasses set this property to true if the receiver accepts first responder status.
    open var acceptsFirstResponder: Bool = false

    // MARK: - Creating Responders

    /// Creates and returns a new responder object.
    public init() {
    }

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

    // MARK: - Managing the Next Responder

    /// The next responder after this one, or nil if it has none.
    /// 
    /// The next responder must be an object that inherits, directly or indirectly, from NSResponder.
    open var nextResponder: NSResponder?

    // MARK: - Responding to Mouse Events

    /// Informs the receiver that the user has pressed the left mouse button.
    /// 
    /// The default implementation forwards the message to the next responder in the responder chain.
    /// - Parameter event: An object encapsulating information about the mouse-down event.
    open func mouseDown(with event: NSEvent) {
        print("\(Self.self).\(#function)")
        nextResponder?.mouseDown(with: event)
    }

    /// Informs the receiver that the user has released the left mouse button.
    /// 
    /// The default implementation forwards the message to the next responder in the responder chain.
    /// - Parameter event: An object encapsulating information about the mouse-up event.
    open func mouseUp(with event: NSEvent) {
        print("\(Self.self).\(#function)")
        nextResponder?.mouseUp(with: event)
    }

    /// Informs the receiver that the mouse has moved.
    /// 
    /// The default implementation simply passes this message to the next responder.
    /// - Parameter event: An object encapsulating information about the mouse-moved event.
    open func mouseMoved(with event: NSEvent) {
        print("\(Self.self).\(#function)")
        nextResponder?.mouseMoved(with: event)
    }

    /// Informs the receiver that the cursor has entered a tracking rectangle.
    /// 
    /// The default implementation simply passes this message to the next responder.
    /// - Parameter event: An object encapsulating information about the mouse-entered event.
    open func mouseEntered(with event: NSEvent) {
        print("\(Self.self).\(#function)")
        nextResponder?.mouseEntered(with: event)
    }

    /// Informs the receiver that the cursor has exited a tracking rectangle.
    /// 
    /// The default implementation simply passes this message to the next responder.
    /// - Parameter event: An object encapsulating information about the mouse-exited event.
    open func mouseExited(with event: NSEvent) {
        print("\(Self.self).\(#function)")
        nextResponder?.mouseExited(with: event)
    }

    /// Informs the receiver that the user has pressed the right mouse button.
    /// 
    /// The default implementation forwards the message to the next responder in the responder chain.
    /// - Parameter event: An object encapsulating information about the mouse-down event.
    open func rightMouseDown(with event: NSEvent) {
        print("\(Self.self).\(#function)")
        nextResponder?.rightMouseDown(with: event)
    }

    /// Informs the receiver that the user has moved the mouse with the right button pressed.
    /// 
    /// The default implementation simply passes this message to the next responder.
    /// - Parameter event: An object encapsulating information about the mouse-dragged event.
    open func rightMouseDragged(with event: NSEvent) {
        print("\(Self.self).\(#function)")
        nextResponder?.rightMouseDragged(with: event)
    }

    /// Informs the receiver that the user has released the right mouse button.
    /// 
    /// The default implementation forwards the message to the next responder in the responder chain.
    /// - Parameter event: An object encapsulating information about the mouse-up event.
    open func rightMouseUp(with event: NSEvent) {
        print("\(Self.self).\(#function)")
        nextResponder?.rightMouseUp(with: event)
    }

    /// Informs the receiver that the user has pressed a mouse button other than the left or right one.
    /// 
    /// The default implementation simply passes this message to the next responder.
    /// - Parameter event: An object encapsulating information about the mouse-down event.
    open func otherMouseDown(with event: NSEvent) {
        print("\(Self.self).\(#function)")
        nextResponder?.otherMouseDown(with: event)
    }

    /// Informs the receiver that the user has moved the mouse with a button other than the left or right button pressed.
    /// 
    /// The default implementation simply passes this message to the next responder.
    /// - Parameter event: An object encapsulating information about the mouse-dragged event.
    open func otherMouseDragged(with event: NSEvent) {
        print("\(Self.self).\(#function)")
        nextResponder?.otherMouseDragged(with: event)
    }

    /// Informs the receiver that the user has released a mouse button other than the left or right button.
    /// 
    /// The default implementation simply passes this message to the next responder.
    /// - Parameter event: An object encapsulating information about the mouse-up event.
    open func otherMouseUp(with event: NSEvent) {
        print("\(Self.self).\(#function)")
        nextResponder?.otherMouseUp(with: event)
    }

    // MARK: - Responding to Key Events

    /// Informs the receiver that the user has pressed a key.
    /// 
    /// The receiver can interpret event itself, or pass it to the system input manager using ``interpretKeyEvents(_:)``. 
    /// The default implementation simply passes this message to the next responder.
    /// - Parameter event: An object encapsulating information about the key-down event.
    open func keyDown(with event: NSEvent) {
        print("\(Self.self).\(#function)")
        nextResponder?.keyDown(with: event)
    }

    /// Informs the receiver that the user has released a key.
    /// 
    /// The default implementation simply passes this message to the next responder.
    /// - Parameter event: An object encapsulating information about the key-up event.
    open func keyUp(with event: NSEvent) {
        print("\(Self.self).\(#function)")
        nextResponder?.keyUp(with: event)
    }

    /// Handles a series of key events.
    /// 
    /// This method, which is invoked by subclasses from the ``keyDown(with:)`` method, sends the character input in eventArray to the system input manager for interpretation as text to insert or commands to perform. 
    /// The input manager responds to the request by sending ``insertText(_:)`` and ``doCommand(by:)`` messages back to the invoker of this method. 
    /// Subclasses shouldn’t override this method.
    /// - Parameter eventArray: An array of key-event characters to give to the system input manager.
    open func interpretKeyEvents(_ eventArray: [NSEvent]) {
        print("\(Self.self).\(#function)")
        nextResponder?.interpretKeyEvents(eventArray)
    }

    /// Clears any unprocessed key events when overridden by subclasses.
    open func flushBufferedKeyEvents() {
        print("\(Self.self).\(#function)")
        nextResponder?.flushBufferedKeyEvents()
    }

    /// Handle a key equivalent.
    /// 
    /// Override to handle key equivalents. 
    /// If the character code or codes in event match the receiver’s key equivalent, the receiver should respond to the event and return ``true``. 
    /// The default implementation does nothing and returns ``false``.
    /// - Parameter event: An event object that represents the key equivalent pressed.
    open func performKeyEquivalent(with event: NSEvent) -> Bool {
        print("\(Self.self).\(#function)")
        return nextResponder?.performKeyEquivalent(with: event) ?? false
    }

    // MARK: - Responding to Pressure Changes

    /// Indicates a pressure change as the result of a user input event on a system that supports pressure sensitivity.
    /// 
    /// This method is invoked automatically in response to user actions. event is the event that initiated the change in pressure.
    /// - Parameter event: 
    open func pressureChange(with event: NSEvent) {
        print("\(Self.self).\(#function)")
        nextResponder?.pressureChange(with: event)
    }

    // MARK: - Responding to Other Kinds of Events

    /// Informs the receiver that the mouse cursor has moved into a cursor rectangle.
    /// 
    /// Override this method to set the cursor image. 
    /// The default implementation uses cursor rectangles, if cursor rectangles are currently valid. 
    /// If they are not, it calls super to send the message up the responder chain.
    /// If the responder implements this method, but decides not to handle a particular event, it should invoke the superclass implementation of this method.
    /// - Parameter event: 
    open func cursorUpdate(with event: NSEvent) {
        print("\(Self.self).\(#function)")
        nextResponder?.cursorUpdate(with: event)
    }

    /// Informs the receiver that the user has pressed or released a modifier key (Shift, Control, and so on).
    /// 
    /// The default implementation simply passes this message to the next responder.
    /// - Parameter event: An object encapsulating information about the modifier-key event.
    open func flagsChanged(with event: NSEvent) {
        print("\(Self.self).\(#function)")
        nextResponder?.flagsChanged(with: event)
    }

    /// Informs the receiver that a tablet-point event has occurred.
    /// 
    /// Tablet events are represented by NSEvent objects of type NSTabletPoint. 
    /// They describe the current state of a transducer (that is, a pointing device) that is in proximity to its tablet, reflecting changes such as location, pressure, tilt, and rotation. 
    /// See the NSEvent reference for the methods that allow you to extract this and other information from event. 
    /// The default implementation of NSResponder passes the message to the next responder.
    /// - Parameter event: An object encapsulating information about the tablet-point event.
    open func tabletPoint(with event: NSEvent) {
        print("\(Self.self).\(#function)")
        nextResponder?.tabletPoint(with: event)
    }

    /// Displays context-sensitive help for the receiver if help has been registered.
    /// 
    /// ``NSWindow`` invokes this method automatically when the user clicks for help and help has been registered using ``setContextHelp(_:for:)``. Otherwise, ``NSWindow`` passes the message to the next responder. 
    /// Subclasses are not required to override this method.
    /// - Parameter eventPtr: An object encapsulating information about the help-request event.
    open func helpRequested(_ eventPtr: NSEvent) {
        print("\(Self.self).\(#function)")
        nextResponder?.helpRequested(eventPtr)
    }

    /// Informs the receiver that the mouse’s scroll wheel has moved.
    /// 
    /// The default implementation forwards the message to the next responder in the responder chain.
    /// - Parameter event: An object encapsulating information about the scroll wheel event.
    open func scrollWheel(with event: NSEvent) {
        print("\(Self.self).\(#function)")
        nextResponder?.scrollWheel(with: event)
    }

    /// Informs the responder that performed a double-tap on the side of an Apple Pencil.
    /// 
    /// The default implementation passes the event to the next responder.
    /// - Parameter event: An object encapsulating information about the change-mode event.
    open func changeMode(with event: NSEvent) {
        print("\(Self.self).\(#function)")
        nextResponder?.changeMode(with: event)
    }

    // MARK: - Presenting and Customizing Error Information

    /// Presents an error alert to the user as an application-modal dialog.
    /// 
    /// The alert displays information found in the NSError object error; this information can include error description, recovery suggestion, failure reason, and button titles (all localized). 
    /// The method returns true if error recovery succeeded and false otherwise. 
    /// For error recovery to be attempted, an recovery-attempter object (that is, an object conforming to the NSErrorRecoveryAttempting informal protocol) must be associated with error.
    /// 
    /// The default implementation of this method sends ``willPresentError(_:)`` to self. 
    /// By doing this, NSResponder gives subclasses an opportunity to customize error presentation. 
    /// It then forwards the message, passing any customized error object, to the next responder; if there is no next responder, it passes the error object to NSApp, which displays a document-modal error alert. 
    /// When the user dismisses the alert, any recovery attempter associated with the error object is given a chance to recover from the error. 
    /// See the class description for the precise route up the responder chain (plus document and controller objects) this message might travel.
    /// 
    /// It is not recommended that you attempt to override this method. 
    /// If you wish to customize the error presentation, override ``willPresentError(_:)`` instead.
    /// - Parameter error: An object containing information about an error.
    open func presentError(_ error: any Error) -> Bool {
        print("\(Self.self).\(#function)")
        return nextResponder?.presentError(willPresentError(error)) ?? false
    }

    /// Returns a custom version of the supplied error object that’s more suitable for presentation in alert sheets and dialogs.
    /// 
    /// When overriding this method, you can examine error and, if its localized description or recovery information is unhelpfully generic, return an error object with more specific localized text. 
    /// If you do this, always use the domain and error code of the NSError object to distinguish between errors whose presentation you want to customize and those you don’t. 
    /// Don’t make decisions based on the localized description, recovery suggestion, or recovery options because parsing localized text is problematic.
    /// 
    /// The default implementation of this method returns error unchanged.
    /// - Parameter error: 
    /// - Returns: 
    open func willPresentError(_ error: any Error) -> any Error {
        print("\(Self.self).\(#function)")
        return nextResponder?.willPresentError(error) ?? error
    }

    // MARK: - Terminating the Responder Chain

    /// Handles the case where an event or action message falls off the end of the responder chain.
    /// 
    /// The default implementation beeps if eventSelector is ``keyDown(with:)``.
    /// - Parameter eventSelector: A selector identifying the action or event message.
    open func noResponder(for eventSelector: Selector) {
        print("\(Self.self).\(#function)")
        nextResponder?.noResponder(for: eventSelector)
    }
}