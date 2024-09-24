import Foundation

/// Creates the application object and the application delegate and sets up the event cycle.
/// - Parameters:
///   - argc: The count of arguments in argv.
///   - argv: A variable list of arguments.
///   - principalClassName: The name of the ``NSApplication`` class or subclass. If you specify nil, ``NSApplication`` is assumed.
///   - delegateClassName: The name of the class from which the application delegate is instantiated. If principalClassName designates a subclass of ``NSApplication``, you may designate the subclass as the delegate; the subclass instance receives the application-delegate messages.
/// - Returns: Even though an integer return type is specified, this function never returns.
@MainActor  @discardableResult public func NSApplicationMain<T>(
    _ argc: Int32, 
    _ argv: UnsafeMutablePointer<UnsafeMutablePointer<Int8>?>, 
    _ principalClassName: String?, 
    _ delegateClassName: T.Type?) -> Int32 where T: NSApplicationDelegate {
        print("\(#function)")
        if let delegateClassName {
            NSApplication.shared.delegate = delegateClassName.init()
            NSApplication.shared.run()
        }

        return 0
}