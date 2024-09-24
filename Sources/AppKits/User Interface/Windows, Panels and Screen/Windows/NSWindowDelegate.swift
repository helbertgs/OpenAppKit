import Foundation

/// A set of optional methods that a window’s delegate can implement to respond to events, such as window resizing, moving, exposing, and minimizing.
public protocol NSWindowDelegate: AnyObject {

    // MARK: - Sizing Windows

    /// Tells the delegate that the window is being resized (whether by the user or through one of the setFrame... methods other than ``setFrame(_:display:))``.
    /// 
    /// The frameSize contains the size (in screen coordinates) sender will be resized to. 
    /// To resize to a different size, simply return the desired size from this method; to avoid resizing, return the current size. sender’s minimum and maximum size constraints have already been applied when this method is called.
    ///
    /// While the user is resizing a window, the delegate is sent a series of ``windowWillResize(_:to:)`` messages as the window’s frame continues to change size.
    /// - Parameters:
    ///   - window: The window being resized.
    ///   - frameSize: The size to which the specified window is being resized.
    /// - Returns: A custom size to which the specified window will be resized.
    func windowWillResize(_ window: NSWindow, to frameSize: NSSize) -> NSSize

    /// Tells the delegate that the window has been resized.
    func windowDidResize(_ window: NSWindow)

    /// Tells the delegate that the window is about to be live resized.
    func windowWillStartLiveResize(_ window: NSWindow)

    /// Tells the delegate that a live resize operation on the window has ended.
    func windowDidEndLiveResize(_ window: NSWindow)

    // MARK: - Minimizing Windows

    /// Tells the delegate that the window is about to be minimized.
    func windowWillMiniaturize(_ window: NSWindow)

    /// Tells the delegate that the window has been minimized.
    func windowDidMiniaturize(_ window: NSWindow)

    /// Tells the delegate that the window has been deminimized.
    func windowDidDeminiaturize(_ window: NSWindow)

    // MARK: - Closing Windows

    /// Tells the delegate that the user has attempted to close a window or the window has received a ``performClose(_:)`` message.
    /// 
    /// This method may not always be called during window closing. Specifically, this method is not called when a user quits an application.
    /// - Returns: true to allow sender to be closed; otherwise, false.
    func windowShouldClose(_ window: NSWindow) -> Bool

    /// Tells the delegate that the window is about to close.
    func windowWillClose(_ window: NSWindow)

    // MARK: - Managing Key Status

    /// Tells the delegate that the window has become the key window.
    func windowDidBecomeKey(_ window: NSWindow)

    /// Tells the delegate that the window has resigned key window status.
    func windowDidResignKey(_ window: NSWindow)

    // MARK: - Managing Main Status

    /// Tells the delegate that the window has become main.
    func windowDidBecomeMain(_ window: NSWindow)

    /// Tells the delegate that the window has resigned main window status.
    func windowDidResignMain(_ window: NSWindow)

    // MARK: - Updating Windows

    /// Tells the delegate that the window received an ``update()`` message.
    func windowDidUpdate(_ window: NSWindow)

    // MARK: - Exposing Windows

    /// Tells the delegate that the window has been exposed.
    func windowDidExpose(_ window: NSWindow)
}

import Foundation

/// A set of optional methods that a window’s delegate can implement to respond to events, such as window resizing, moving, exposing, and minimizing.
extension NSWindowDelegate {

    // MARK: - Sizing Windows

    /// Tells the delegate that the window is being resized (whether by the user or through one of the setFrame... methods other than ``setFrame(_:display:))``.
    /// 
    /// The frameSize contains the size (in screen coordinates) sender will be resized to. 
    /// To resize to a different size, simply return the desired size from this method; to avoid resizing, return the current size. sender’s minimum and maximum size constraints have already been applied when this method is called.
    ///
    /// While the user is resizing a window, the delegate is sent a series of ``windowWillResize(_:to:)`` messages as the window’s frame continues to change size.
    /// - Parameters:
    ///   - window: The window being resized.
    ///   - frameSize: The size to which the specified window is being resized.
    /// - Returns: A custom size to which the specified window will be resized.
    func windowWillResize(_ window: NSWindow, to frameSize: NSSize) -> NSSize {
        print("\(Self.self).\(#function)")
        return frameSize
    }

    /// Tells the delegate that the window has been resized.
    func windowDidResize(_ window: NSWindow) {
        print("\(Self.self).\(#function)")
    }

    /// Tells the delegate that the window is about to be live resized.
    func windowWillStartLiveResize(_ window: NSWindow) {
        print("\(Self.self).\(#function)")
    }

    /// Tells the delegate that a live resize operation on the window has ended.
    func windowDidEndLiveResize(_ window: NSWindow) {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Minimizing Windows

    /// Tells the delegate that the window is about to be minimized.
    func windowWillMiniaturize(_ window: NSWindow) {
        print("\(Self.self).\(#function)")
    }

    /// Tells the delegate that the window has been minimized.
    func windowDidMiniaturize(_ window: NSWindow) {
        print("\(Self.self).\(#function)")
    }

    /// Tells the delegate that the window has been deminimized.
    func windowDidDeminiaturize(_ window: NSWindow) {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Closing Windows

    /// Tells the delegate that the user has attempted to close a window or the window has received a ``performClose(_:)`` message.
    /// 
    /// This method may not always be called during window closing. Specifically, this method is not called when a user quits an application.
    /// - Returns: true to allow sender to be closed; otherwise, false.
    func windowShouldClose(_ window: NSWindow) -> Bool {
        print("\(Self.self).\(#function)")
        return true
    }

    /// Tells the delegate that the window is about to close.
    func windowWillClose(_ window: NSWindow) {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Managing Key Status

    /// Tells the delegate that the window has become the key window.
    func windowDidBecomeKey(_ window: NSWindow) {
        print("\(Self.self).\(#function)")
    }

    /// Tells the delegate that the window has resigned key window status.
    func windowDidResignKey(_ window: NSWindow) {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Managing Main Status

    /// Tells the delegate that the window has become main.
    func windowDidBecomeMain(_ window: NSWindow) {
        print("\(Self.self).\(#function)")
    }

    /// Tells the delegate that the window has resigned main window status.
    func windowDidResignMain(_ window: NSWindow) {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Updating Windows

    /// Tells the delegate that the window received an ``update()`` message.
    func windowDidUpdate(_ window: NSWindow) {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Exposing Windows

    /// Tells the delegate that the window has been exposed.
    func windowDidExpose(_ window: NSWindow) {
        print("\(Self.self).\(#function)")
    }
}