import Foundation


extension NSEvent {
    /// Constants for the types of events that responder objects can handle.
    /// These constants appear in the event’s type property. You also use them when you construct new events.
    @MainActor
    public enum EventType {

        // MARK: - Getting Mouse-Related Event Types

        /// The user pressed the left mouse button.
        case leftMouseDown

        /// The user moved the mouse while holding down the left mouse button.
        case leftMouseDragged

        /// The user released the left mouse button.
        case leftMouseUp

        /// The user pressed the right mouse button.
        case rightMouseDown

        /// The user released the right mouse button.
        case rightMouseUp

        /// The user moved the mouse while holding down the right mouse button.
        case rightMouseDragged

        /// The user pressed a tertiary mouse button.
        case otherMouseDown

        /// The user moved the mouse while holding down a tertiary mouse button.
        case otherMouseDragged

        /// The user released a tertiary mouse button.
        case otherMouseUp

        /// The user moved the mouse in a way that caused the cursor to move onscreen.
        case mouseMoved

        /// The cursor entered a well-defined area, such as a view.
        case mouseEntered

        /// The cursor exited a well-defined area, such as a view.
        case mouseExited

        
        // MARK: - Getting Keyboard Event Types

        /// The user pressed a key on the keyboard.
        case keyDown

        /// The user released a key on the keyboard.
        case keyUp

        
        // MARK: - Getting Touch-Based Events

        /// An event marking the beginning of a gesture.
        case beginGesture

        /// An event that marks the end of a gesture.
        case endGesture

        /// The user performed a pinch-open or pinch-close gesture.
        case magnify

        /// The user performed a smart-zoom gesture.
        case smartMagnify

        /// The user performed a swipe gesture.
        case swipe

        /// The user performed a rotate gesture.
        case rotate

        /// The user performed a nonspecific type of gesture.
        case gesture

        /// The user touched a portion of the touch bar.
        case directTouch

        /// The user touched a point on a tablet.
        case tabletPoint

        /// A pointing device is near, but not touching, the associated tablet.
        case tabletProximity

        /// An event that reports a change in pressure on a pressure-sensitive device.
        case pressure

        // MARK: - Getting Other Input Types

        /// The scroll wheel position changed.
        case scrollWheel

        /// The user changed the mode of a connected device.
        case changeMode

        // MARK: - Getting System Event Types

        /// An AppKit-related event occurred.
        case appKitDefined

        /// An app-defined event occurred.
        case applicationDefined

        /// An event that updates the cursor.
        case cursorUpdate

        /// The event flags changed.
        case flagsChanged

        /// An event that provides execution time to periodic tasks.
        case periodic

        /// An event that initiates a Quick Look request.
        case quickLook

        /// A system-related event occurred.
        case systemDefined
    }
}
