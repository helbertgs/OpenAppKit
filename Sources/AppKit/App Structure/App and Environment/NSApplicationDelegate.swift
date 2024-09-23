import Foundation

/// A set of methods to manage shared behaviors for your app.
@MainActor public protocol NSApplicationDelegate {

    // MARK: - Launching Applications

    /// Tells the delegate that the launch process has begun but that state restoration hasn’t occured.
    /// - Parameters:
    ///   - application: The singleton app object.
    ///   - launchOptions: A dictionary indicating the reason the app was launched (if any). The contents of this dictionary may be empty in situations where the user launched the app directly.
    func application(_ application: NSApplication, willFinishLaunchingWithOptions launchOptions: [NSApplication.LaunchOptionsKey : Any]?) -> Bool

    /// Tells the delegate that the launch process is almost done and the app is almost ready to run.
    /// - Parameters:
    ///   - application: The singleton app object.
    ///   - launchOptions: A dictionary indicating the reason the app was launched (if any). The contents of this dictionary may be empty in situations where the user launched the app directly.
    func application(_ application: NSApplication, didFinishLaunchingWithOptions launchOptions: [NSApplication.LaunchOptionsKey : Any]?) -> Bool

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
}

extension NSApplicationDelegate {
    /// Provides the top-level entry point for the app.
    public static func main() {
        let _ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, nil)
    }
}