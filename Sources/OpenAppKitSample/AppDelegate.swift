import OpenAppKit

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow?

    func applicationDidFinishLaunching(_ application: NSApplication) {
        let contentViewController = NSViewController(nibName: nil, bundle: nil)
        let view = NSView(frame: .init(x: 0, y: 0, width: 900, height: 450))

        contentViewController.view = view

        self.window = NSWindow(contentViewController: contentViewController)
        self.window?.makeKeyAndOrderFront(nil)
    }
}
