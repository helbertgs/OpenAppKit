import Foundation

/// A set of methods to manage shared behaviors for your app.
@MainActor public protocol NSApplicationDelegate : NSObject {

    // MARK: - Launching Applications

    /// Tells the delegate that the app’s initialization is about to complete.
    /// - Parameters:
    ///   - application: The singleton app object.
    func applicationWillFinishLaunching(_ application: NSApplication)

    /// Tells the delegate that the app’s initialization is complete but it hasn’t received its first event.
    /// 
    /// Delegates can implement this method to perform further initialization. 
    /// This method is called after the application’s main run loop has been started but before it has processed any events. 
    /// If the application was launched by the user opening a file, the delegate’s ``application(_:openFile:)`` method is called before this method. 
    /// If you want to perform initialization before any files are opened, implement the ``applicationWillFinishLaunching(_:)`` method in your delegate, which is called before ``application(_:openFile:)``.)
    /// - Parameters:
    ///   - application: The singleton app object.
    func applicationDidFinishLaunching(_ application: NSApplication)

    // MARK: - Responding to app life-cycle events

    /// Tells the delegate that the app is about to become active.
    /// - Parameter application: Your singleton app object.
    func applicationWillBecomeActive(_ application: NSApplication)

    /// Tells the delegate that the app is now active.
    /// - Parameter application: Your singleton app object.
    func applicationDidBecomeActive(_ application: NSApplication)

    /// Tells the delegate that the app is about to become inactive and will lose focus.
    /// - Parameter application: Your singleton app object.
    func applicationWillResignActive(_ application: NSApplication)

    /// Tells the delegate that the app is no longer active and doesn’t have focus.
    /// - Parameter application: Your singleton app object.
    func applicationDidResignActive(_ application: NSApplication)

    // MARK: - Terminating Applications

    /// Returns a value that indicates if the app should terminate.
    /// - Parameter sender: Your singleton app object.
    /// - Returns: One of the values defined in ``NSApplication.TerminateReply`` constants indicating whether the application should terminate. For compatibility reasons, a return value of false is equivalent to ``NSApplication.TerminateReply.terminateCancel``, and a return value of true is equivalent to ``NSApplication.TerminateReply.terminateNow``.
    func applicationShouldTerminate(_ application: NSApplication) -> NSApplication.TerminateReply

    /// Returns a Boolean value that indicates if the app terminates once the last window closes.
    /// 
    /// If your implementation returns false, control returns to the main event loop and the application is not terminated. 
    /// If you return true, your delegate’s ``applicationShouldTerminate(_:)`` method is subsequently invoked to confirm that the application should be terminated.
    /// - Parameter application: Your singleton app object.
    /// - Returns: false if the application should not be terminated when its last window is closed; otherwise, true to terminate the application.
    func applicationShouldTerminateAfterLastWindowClosed(_ application: NSApplication) -> Bool

    /// Tells the delegate that the app is about to terminate.
    /// - Parameter application: Your singleton app object.
    func applicationWillTerminate(_ application: NSApplication)

    // MARK: - Hiding Applications
    
    /// Tells the delegate that the app is about to be hidden.
    /// - Parameter application: Your singleton app object.
    func applicationWillHide(_ application: NSApplication)
    
    /// Tells the delegate that the app is now hidden.
    /// - Parameter application: Your singleton app object.
    func applicationDidHide(_ application: NSApplication)
    
    /// Tells the delegate that the app is about to become visible.
    /// - Parameter application: Your singleton app object.
    func applicationWillUnhide(_ application: NSApplication)
    
    /// Tells the delegate that the app is now visible.
    /// - Parameter application: Your singleton app object.
    func applicationDidUnhide(_ application: NSApplication)

    // MARK: - Managing Windows

    /// Tells the delegate that the app is about to update its windows.
    /// - Parameter application: Your singleton app object.
    func applicationWillUpdate(_ application: NSApplication)

    /// Tells the delegate that the app’s windows did update.
    /// - Parameter application: Your singleton app object.
    func applicationDidUpdate(_ application: NSApplication)

    /// Returns a Boolean value that indicates if the app responds to reopen AppleEvents.
    /// - Parameter 
    ///     - application: Your singleton app object.
    ///     - Indicates whether the NSApplication object found any visible windows in your application. You can use this value as an indication of whether the application would do anything if you return true.
    /// - Returns: true if you want the application to perform its normal tasks or false if you want the application to do nothing.
    func applicationShouldHandleReopen(_ application: NSApplication, hasVisibleWindows: Bool) -> Bool

    // MARK: - Localizing Keyboard Shortcuts
    
    /// Returns a Boolean value that tells the system whether to remap menu shortcuts to support localized keyboards.
    /// - Parameter application: Your singleton app object.
    /// - Returns: true to enable automatic shortcut localization for all app-specific menus, or false to handle shortcut localization yourself.
    func applicationShouldAutomaticallyLocalizeKeyEquivalents(_ application: NSApplication) -> Bool

    // MARK: - Displaying Errors
    
    /// Returns an error for the app to display to the user.
    /// - Parameters:
    ///   - application: Your singleton app object.
    ///   - error: The error object that is used to construct the error message. Your implementation of this method can return a new NSError object or the same one in this parameter.
    /// - Returns: The error object to display.
    func application(_ application: NSApplication, willPresentError error: any Error) -> any Error

    // MARK: - Managing the Screen
    
    /// Tells the delegate about changes to the configuration of any attached displays.
    /// - Parameter application: Your singleton app object.
    func applicationDidChangeScreenParameters(_ application: NSApplication)

    // MARK: - Type Methods
    
    /// Provides the top-level entry point for the app.
    static func main()

    // MARK: - 

    /// The window to use when presenting a storyboard.
    /// This property contains the window used to present the app’s visual content on the device’s main screen.
    var window: NSWindow? { get set }
}

extension NSApplicationDelegate {

    // MARK: - Launching Applications

    /// Tells the delegate that the app’s initialization is about to complete.
    /// - Parameters:
    ///   - application: The singleton app object.
    public func applicationWillFinishLaunching(_ application: NSApplication) {
        print("\(Self.self).\(#function)")
    }

    /// Tells the delegate that the app’s initialization is complete but it hasn’t received its first event.
    /// 
    /// Delegates can implement this method to perform further initialization. 
    /// This method is called after the application’s main run loop has been started but before it has processed any events. 
    /// If the application was launched by the user opening a file, the delegate’s ``application(_:openFile:)`` method is called before this method. 
    /// If you want to perform initialization before any files are opened, implement the ``applicationWillFinishLaunching(_:)`` method in your delegate, which is called before ``application(_:openFile:)``.)
    /// - Parameters:
    ///   - application: The singleton app object.
    public func applicationDidFinishLaunching(_ application: NSApplication) {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Responding to app life-cycle events

    /// Tells the delegate that the app is about to become active.
    /// - Parameter application: Your singleton app object.
    public func applicationWillBecomeActive(_ application: NSApplication) {
        print("\(Self.self).\(#function)")
    }

    /// Tells the delegate that the app is now active.
    /// - Parameter application: Your singleton app object.
    public func applicationDidBecomeActive(_ application: NSApplication) {
        print("\(Self.self).\(#function)")
    }

    /// Tells the delegate that the app is about to become inactive and will lose focus.
    /// - Parameter application: Your singleton app object.
    public func applicationWillResignActive(_ application: NSApplication) {
        print("\(Self.self).\(#function)")
    }

    /// Tells the delegate that the app is no longer active and doesn’t have focus.
    /// - Parameter application: Your singleton app object.
    public func applicationDidResignActive(_ application: NSApplication) {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Terminating Applications

    /// Returns a value that indicates if the app should terminate.
    /// - Parameter sender: Your singleton app object.
    /// - Returns: One of the values defined in ``NSApplication.TerminateReply`` constants indicating whether the application should terminate. For compatibility reasons, a return value of false is equivalent to ``NSApplication.TerminateReply.terminateCancel``, and a return value of true is equivalent to ``NSApplication.TerminateReply.terminateNow``.
    public func applicationShouldTerminate(_ application: NSApplication) -> NSApplication.TerminateReply {
        print("\(Self.self).\(#function)")
        return .now
    }

    /// Returns a Boolean value that indicates if the app terminates once the last window closes.
    /// 
    /// If your implementation returns false, control returns to the main event loop and the application is not terminated. 
    /// If you return true, your delegate’s ``applicationShouldTerminate(_:)`` method is subsequently invoked to confirm that the application should be terminated.
    /// - Parameter application: Your singleton app object.
    /// - Returns: false if the application should not be terminated when its last window is closed; otherwise, true to terminate the application.
    public func applicationShouldTerminateAfterLastWindowClosed(_ application: NSApplication) -> Bool {
        print("\(Self.self).\(#function)")
        return true
    }

    /// Tells the delegate that the app is about to terminate.
    /// - Parameter application: Your singleton app object.
    public func applicationWillTerminate(_ application: NSApplication) {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Hiding Applications
    
    /// Tells the delegate that the app is about to be hidden.
    /// - Parameter application: Your singleton app object.
    public func applicationWillHide(_ application: NSApplication) {
        print("\(Self.self).\(#function)")
    }
    
    /// Tells the delegate that the app is now hidden.
    /// - Parameter application: Your singleton app object.
    public func applicationDidHide(_ application: NSApplication) {
        print("\(Self.self).\(#function)")
    }
    
    /// Tells the delegate that the app is about to become visible.
    /// - Parameter application: Your singleton app object.
    public func applicationWillUnhide(_ application: NSApplication) {
        print("\(Self.self).\(#function)")
    }
    
    /// Tells the delegate that the app is now visible.
    /// - Parameter application: Your singleton app object.
    public func applicationDidUnhide(_ application: NSApplication) {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Managing Windows

    /// Tells the delegate that the app is about to update its windows.
    /// - Parameter application: Your singleton app object.
    public func applicationWillUpdate(_ application: NSApplication) {
        print("\(Self.self).\(#function)")
    }

    /// Tells the delegate that the app’s windows did update.
    /// - Parameter application: Your singleton app object.
    public func applicationDidUpdate(_ application: NSApplication) {
        print("\(Self.self).\(#function)")
    }

    /// Returns a Boolean value that indicates if the app responds to reopen AppleEvents.
    /// - Parameter 
    ///     - application: Your singleton app object.
    ///     - Indicates whether the NSApplication object found any visible windows in your application. You can use this value as an indication of whether the application would do anything if you return true.
    /// - Returns: true if you want the application to perform its normal tasks or false if you want the application to do nothing.
    public func applicationShouldHandleReopen(_ application: NSApplication, hasVisibleWindows: Bool) -> Bool {
        print("\(Self.self).\(#function)")
        return false
    }

    // MARK: - Localizing Keyboard Shortcuts
    
    /// Returns a Boolean value that tells the system whether to remap menu shortcuts to support localized keyboards.
    /// - Parameter application: Your singleton app object.
    /// - Returns: true to enable automatic shortcut localization for all app-specific menus, or false to handle shortcut localization yourself.
    public func applicationShouldAutomaticallyLocalizeKeyEquivalents(_ application: NSApplication) -> Bool {
        print("\(Self.self).\(#function)")
        return false
    }

    // MARK: - Displaying Errors
    
    /// Returns an error for the app to display to the user.
    /// - Parameters:
    ///   - application: Your singleton app object.
    ///   - error: The error object that is used to construct the error message. Your implementation of this method can return a new NSError object or the same one in this parameter.
    /// - Returns: The error object to display.
    public func application(_ application: NSApplication, willPresentError error: any Error) -> any Error {
        print("\(Self.self).\(#function)")
        return error
    }

    // MARK: - Managing the Screen
    
    /// Tells the delegate about changes to the configuration of any attached displays.
    /// - Parameter application: Your singleton app object.
    public func applicationDidChangeScreenParameters(_ application: NSApplication) {
        print("\(Self.self).\(#function)")
    }
}

extension NSApplicationDelegate {
    /// Provides the top-level entry point for the app.
    public static func main() {
        print("\(Self.self).\(#function)")
        let _ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, Self.self)
    }
}