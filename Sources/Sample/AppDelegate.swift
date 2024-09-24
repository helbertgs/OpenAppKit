import AppKit

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow?

    func applicationDidFinishLaunching(_ application: NSApplication) {
        self.window = NSWindow(contentViewController: .init(nibName: nil, bundle: nil))
        self.window?.makeKeyAndOrderFront(nil)
    }
}