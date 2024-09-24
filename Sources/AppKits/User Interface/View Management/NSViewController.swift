import Foundation

@MainActor
public class NSViewController: NSResponder {

    // MARK: - Creating A View Controller

    /// Returns a view controller object initialized to the nib file in the specified bundle.
    /// - Parameters:
    ///   - nibNameOrNil: The name of the nib file, without any leading path information.
    ///   - nibBundleOrNil: The bundle in which to search for the nib file. If you specify nil, this method looks for the nib file in the main bundle
    /// - Returns: The initialized NSViewController object.
    public init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
    }

    // MARK: - View Properties

    /// The view controller’s primary view.
    public var view: NSView = NSView()

    /// The localized title of the receiver’s primary view.
    public var title: String?

}