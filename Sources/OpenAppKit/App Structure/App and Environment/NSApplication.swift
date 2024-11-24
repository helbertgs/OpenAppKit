import Foundation

/// An object that manages an app’s main event loop and resources used by all of that app’s objects.
@MainActor open class NSApplication {

    // MARK: - Accessing the shared application

    /// The singleton app instance.
    public static let shared = NSApplication()

    // MARK: - Configuring your app’s behavior

    /// The delegate of the app object.
    /// The app object and app delegate work in tandem to manage the app’s overall behavior. 
    public var delegate: (any NSApplicationDelegate)?   

    // MARK: - Create a NSApplication

    public required init() {
        print("\(Self.self).\(#function)")
    }

    deinit {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Managing the Event Loop

    /// The last event object that the app retrieved from the event queue.
    /// 
    /// The shared app object receives events and forwards them to the affected NSWindow objects, which then distribute them to the objects in its view hierarchy. 
    /// Use this property to get the event that was last handled by the app.
    public var currentEvent: NSEvent?

    /// A Boolean value indicating whether the main event loop is running.
    /// The value of this property is true when the main event loop is running or false when it’s not. 
    /// Calling the ``stop(_:)`` method sets the value to false.
    public private(set) var isRunning: Bool = false

    /// Starts the main event loop.
    /// 
    /// The loop continues until a ``stop(_:)`` or ``terminate(_:)`` message is received. 
    /// Upon each iteration through the loop, the next available event from the window server is stored and then dispatched by sending it to ``NSApp`` using ``sendEvent(_:)``.
    /// 
    /// After creating the ``NSApplication`` object, the main function should load your app’s main nib file and then start the event loop by sending the ``NSApplication`` object a ``run()`` message. 
    public func run() {
        print("\(Self.self).\(#function)")
        if !isRunning {
            isRunning = true
        }

        finishLaunching()

        while isRunning {
            updateWindows()
        }
    }

    /// Activates the app, opens any files specified by the NSOpen user default, and unhighlights the app’s icon.
    /// 
    /// The ``run()`` method calls this method before it starts the event loop. When this method begins, it posts an ``willFinishLaunchingNotification`` to the default notification center.
    /// If you override ``finishLaunching()``, the subclass method should invoke the superclass method.
    public func finishLaunching() {
        print("\(Self.self).\(#function)")

        delegate?.applicationWillFinishLaunching(NSApplication.shared)
        delegate?.applicationDidFinishLaunching(NSApplication.shared) 
    }

    /// Stops the main event loop.
    /// 
    /// This method notifies the app that you want to exit the current run loop as soon as it finishes processing the current ``NSEvent`` object. 
    /// This method doesn’t forcibly exit the current run loop. 
    /// Instead it sets a flag that the app checks only after it finishes dispatching an actual event object. 
    /// For example, you could call this method from an action method responding to a button click or from one of the many methods defined by the ``NSResponder`` class. 
    /// However, calling this method from a timer or run-loop observer routine wouldn’t stop the run loop because they don’t result in the posting of an ``NSEvent`` object.
    /// 
    /// If you call this method from an event handler running in your main run loop, the app object exits out of the ``run()`` method, thereby returning control to the ``main()`` function.
    /// If you call this method from within a modal event loop, it will exit the modal loop instead of the main event loop.
    /// - Parameter sender: The object that sent this message.
    public func stop(_ sender: Any?) {
        print("\(Self.self).\(#function)")
    }

    /// Dispatches an event to other objects.
    /// 
    /// You rarely invoke ``sendEvent(_:)`` directly, although you might want to override this method to perform some action on every event. 
    /// ``sendEvent(_:)`` messages are sent from the main event loop (the ``run()`` method). 
    /// ``sendEvent(_:)`` is the method that dispatches events to the appropriate responders—NSApp handles app events, the ``NSWindow`` object indicated in the event record handles window-related events, and mouse and key events are forwarded to the appropriate NSWindow object for further dispatching.
    /// - Parameter event: The event object to dispatch.
    public func sendEvent(_ event: NSEvent) {
        print("\(Self.self).\(#function)")
    }

    /// Adds a given event to the receiver’s event queue.
    /// 
    /// This method can also be called in subthreads. 
    /// Events posted in subthreads bubble up in the main thread event queue.
    /// - Parameters:
    ///   - event: The event object to post to the queue.
    ///   - atStart: Specify true to add the event to the front of the queue; otherwise, specify false to add the event to the back of the queue.
    public func postEvent(_ event: NSEvent, atStart: Bool) {
        print("\(Self.self).\(#function)")
    }

    /// Returns the next event matching a given mask, or nil if no such event is found before a specified expiration date.
    /// 
    /// You can use this method to short circuit normal event dispatching and get your own events. 
    /// For example, you may want to do this in response to a mouse-down event in order to track the mouse while its button is down. 
    /// (In such an example, you’d pass the appropriate event types for mouse-dragged and mouse-up events to the mask parameter and specify the NSEventTrackingRunLoopMode run loop mode). 
    /// Events that don’t match one of the specified event types are left in the queue.
    /// - Parameters:
    ///   - mask: Contains one or more flags indicating the types of events to return. The constants section of the ``NSEvent`` class defines the constants you can add together to create this mask. The ``discardEvents(matching:before:)`` method also lists several of these constants.
    ///   - expiration: The expiration date for the current event request. Specifying nil for this parameter is equivalent to returning a date object using the ``distantPast`` method.
    ///   - mode: The run loop mode in which to run while looking for events. The mode you specify also determines which timers and run-loop observers may fire while the app waits for the event.
    ///   - deqFlag: Specify true if you want the event removed from the queue.
    /// - Returns: The event object whose type matches one of the event types specified by the mask parameter.
    public func nextEvent(matching mask: NSEvent.EventTypeMask, until expiration: Date?, inMode mode: RunLoop.Mode, dequeue deqFlag: Bool) -> NSEvent? {
        print("\(Self.self).\(#function)")
        return nil
    }

    /// Removes all events matching the given mask and generated before the specified event.
    /// 
    /// Use this method to ignore any events that occurred before a specific event. 
    /// For example, suppose your app has a tracking loop that you exit when the user releases the mouse button. 
    /// You could use this method, specifying NSAnyEventMask as the mask argument and the ending mouse-up event as the lastEvent argument, to discard all events that occurred while you were tracking mouse movements in your loop. 
    /// Passing the mouse-up event as lastEvent ensures that any events that might have occurred after the mouse-up event (that is, that appear in the queue after the mouse-up event) aren’t discarded.
    /// - Parameters:
    ///   - mask: Contains one or more flags indicating the types of events to discard. The constants section of the NSEvent class defines the constants you can add together to create this mask. The discussion section also lists some of the constants that are typically used.
    ///   - lastEvent: A marker event that you use to indicate which events should be discarded. Events that occurred before this event are discarded but those that occurred after it are not.
    public func discardEvents(matching mask: NSEvent.EventTypeMask, before lastEvent: NSEvent?) {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Terminating the App

    /// Terminates the receiver.
    /// 
    /// This method is typically invoked when the user chooses Quit or Exit from the app’s menu.
    /// 
    ///  When invoked, this method performs several steps to process the termination request. 
    /// First, it asks the app’s document controller (if one exists) to save any unsaved changes in its documents. 
    /// During this process, the document controller can cancel termination in response to input from the user. 
    /// If the document controller doesn’t cancel the operation, this method then calls the delegate’s ``applicationShouldTerminate(_:)`` method. 
    /// If ``applicationShouldTerminate(_:)`` returns ``NSApplication.TerminateReply.terminateCancel``, the termination process is aborted and control is handed back to the main event loop. 
    /// If the method returns ``NSApplication.TerminateReply.terminateLater``, the app runs its run loop in the modalPanel mode until the ``reply(toApplicationShouldTerminate:)`` method is called with the value true or false. 
    /// If the ``applicationShouldTerminate(_:)`` method returns ``NSApplication.TerminateReply.terminateNow``, this method posts a ``willTerminateNotification`` notification to the default notification center.
    /// 
    /// Don’t bother to put final cleanup code in your app’s ``main()`` function—it will never be executed. 
    /// If cleanup is necessary, perform that cleanup in the delegate’s ``applicationWillTerminate(_:)`` method.
    /// - Parameter sender: Typically, this parameter contains the object that initiated the termination request.
    public func terminate(_ sender: Any?) {
        print("\(Self.self).\(#function)")
        self.isRunning = false
    }

    /// Responds to ``NSTerminateLater`` once the app knows whether it can terminate.
    /// 
    /// If your app delegate returns NSTerminateLater from its ``applicationShouldTerminate(_:)`` method, your code must subsequently call this method to let the ``NSApplication`` object know whether it can actually terminate itself.
    /// - Parameter shouldTerminate: Specify true if you want the app to terminate; otherwise, specify false.
    public func reply(toApplicationShouldTerminate shouldTerminate: Bool) {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Activating and Deactivating the App

    /// Activates the receiver app, if appropriate.
    /// 
    /// Use this method to request app activation; calling this method doesn’t guarantee app activation. 
    /// For cooperative activation, the other app should call ``yieldActivation(to:)`` or equivalent before the target app invokes activate().
    /// 
    /// Invoking ``activate()`` on an already-active application cancels any pending activation yields by the receiver.
    public func activate() {
        print("\(Self.self).\(#function)")
    }

    /// Deactivates the receiver.
    /// Normally, you shouldn’t invoke this method—AppKit is responsible for proper deactivation.
    public func deactivate() {
        print("\(Self.self).\(#function)")
    }

    /// A Boolean value indicating whether this is the active app.
    /// The value of this property is true if the app is active or false if it’s not.
    public var isActive: Bool = false

    // MARK: - Managing the App's Appearance

    /// The appearance associated with the app’s windows.
    /// 
    /// When the value of this property is nil (the default), AppKit applies the current system appearance to the app’s user interface elements, including its windows, views, panels, and popovers. 
    /// Assigning an NSAppearance object to this property causes the app’s interface elements to adopt the specified appearance instead.
    /// 
    /// Individual windows and views may still override the app’s appearance to customize their own appearance.
    public var appearance: NSAppearance?

    /// The appearance that AppKit uses to draw the app’s interface.
    /// 
    /// This property always contains an NSAppearance object representing the appearance to use during drawing. 
    /// If you don’t explicitly assign a value to the appearance property, the app inherits the system’s effective appearance.
    public package(set) var effectiveAppearance: NSAppearance = NSAppearance(named: .fluent)!

    // MARK: - Managing Windows, Panels, and Menus

    /// An array of the app’s window objects.
    /// 
    /// This property contains an array of NSWindow objects corresponding to all currently existing windows for the app. 
    /// The array includes all onscreen and offscreen windows, whether or not they are visible on any space. 
    /// There is no guarantee of the order of the windows in the array.
    public package(set) var windows: [NSWindow] = []

    /// The window that currently receives keyboard events.
    /// The value of this property is nil when there is no window receiving keyboard events. 
    /// The property might be nil because the app’s storyboard file has not yet finished loading or when the receiver is not active.
    public weak var keyWindow: NSWindow? {
        didSet {
            oldValue?.becomeKey()
        }
    }

    /// The app’s main window.
    /// The value in this property is nil when the app’s storyboard or nib file has not yet finished loading. 
    /// It might also be nil when the app is inactive or hidden.
    public weak var mainWindow: NSWindow? {
        didSet {
            oldValue?.becomeMain()
        }
    }

    /// Returns the window corresponding to the specified window number.
    /// 
    /// ``window(withWindowNumber:)`` may return nil for window numbers found using ``windowNumbers(options:)`` if there is no corresponding window object owned by your app—for example, the menu bar.
    /// - Parameter windowNum: The unique window number associated with the desired NSWindow object.
    /// - Returns: The desired window object or nil if the window could not be found.
    public func window(withWindowNumber windowNum: Int) -> NSWindow? {
        windows
            .first(where: { window in
                    window.windowNumber == windowNum
                }
            )
    }

    // MARK: - Minimizing Windows

    /// Miniaturizes all the receiver’s windows.
    /// - Parameter sender: The object that sent the command.
    public func miniaturizeAll(_ sender: Any?) {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Hiding Windows

    /// A Boolean value indicating whether the app is hidden.
    /// The value of this property is true if the app is hidden or false if it is not.
    public private(set) var isHidden: Bool = false

    /// Hides all the receiver’s windows, and the next app in line is activated.
    /// 
    /// This method is usually invoked when the user chooses Hide in the app’s main menu. 
    /// When this method begins, it posts an ``willHideNotification`` to the default notification center. 
    /// When it completes successfully, it posts an ``didHideNotification``.
    /// - Parameter sender: 
    public func hide(_ sender: Any?) {
        print("\(Self.self).\(#function)")
    }

    /// Restores hidden windows to the screen and makes the receiver active.
    /// Invokes ``unhideWithoutActivation()``.
    /// - Parameter sender: The object that sent the command.
    public func unhide(_ sender: Any?) {
        print("\(Self.self).\(#function)")
    }

    /// Restores hidden windows without activating their owner (the receiver).
    /// 
    /// When this method begins, it posts an ``willUnhideNotification`` to the default notification center. 
    /// If it completes successfully, it posts an ``didUnhideNotification``.
    public func unhideWithoutActivation() {
        // print("\(Self.self).\(#function)")
    }

    // MARK: - Updating Windows

    /// Sends an update() message to each onscreen window.
    /// 
    /// This method is invoked automatically in the main event loop after each event when running in ``NSDefaultRunLoopMode`` or ``NSModalRunLoopMode``. 
    /// This method is not invoked automatically when running in ``NSEventTrackingRunLoopMode``.
    /// 
    /// When this method begins, it posts an ``willUpdateNotification`` to the default notification center. 
    /// When it successfully completes, it posts an ``didUpdateNotification``.
    public func updateWindows() {
        windows
            .forEach { window in
                window.update()
            }
    }

    /// Sets whether the receiver’s windows need updating when the receiver has finished processing the current event.
    /// This method is especially useful for making sure menus are updated to reflect changes not initiated by user actions, such as messages received from remote objects.
    /// - Parameter needUpdate: If true, the receiver’s windows are updated after an event is processed.
    public func setWindowsNeedUpdate(_ needUpdate: Bool) {
        if needUpdate {
            updateWindows()
        }
    }

    // MARK: - Accessing the Dock Tile

    /// The app’s Dock tile.
    public private(set) var dockTile: NSDockTile = .init()
    
    /// The image used for the app’s icon.
    public private(set) var applicationIconImage: NSImage!
}

extension NSApplication {
    public struct LaunchOptionsKey: Equatable, Hashable, Sendable {
    }
}

extension NSApplication {
    public enum TerminateReply: Equatable, Hashable, Sendable {
        case now
        case cancel
        case later
    }
}