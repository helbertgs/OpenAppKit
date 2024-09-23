import Foundation

/// An object wrapper, or container, for an Interface Builder nib file.
public class NSNib {

    public typealias Name = String

    /// Returns an NSNib object initialized to the nib file in the specified bundle.
    /// 
    /// The NSNib object looks for the nib file in the bundle's language-specific project directories first, followed by the Resources directory.
    /// 
    /// After the nib file has been loaded, the NSNib object uses the bundle’s resource map to locate additional resources referenced by the nib. 
    /// If you specified nil for the bundle parameter, the NSNib object looks for those resources in the bundle associated with the class of the nib file’s owner instead. 
    /// If the nib file does not have an owner, the NSNib object looks for additional resources in the application’s main bundle.
    /// 
    /// - Parameters:
    ///   - nibName: The name of the nib file, without any leading path information. Inclusion of the .nib extension on the nib file name is optional.
    ///   - bundle: The bundle in which to search for the nib file. If you specify nil, this method looks for the nib file in the main bundle.
    /// - Returns: The initialized NSNib object or nil if there were errors during initialization or the nib file could not be located.
    public init?(nibNamed nibName: Name, bundle: Bundle?) {
    }

    /// Initializes an instance with nib data and specified bundle for locating resources.
    /// - Parameters:
    ///   - nibData: The nib data.
    ///   - bundle: The bundle for locating resources. If nil, the main application bundle is used.
    /// - Returns: The initialized NSNib object or nil if there were errors during initialization.
    public init(nibData: Data, bundle: Bundle?) {
    }

    // MARK - 

    /// Instantiates objects in the nib file with the specified owner.
    /// 
    /// Unlike legacy methods, the objects adhere to standard Cocoa memory management rules; it is necessary to keep a strong reference to the objects or the array to prevent the nib contents from being deallocated.
    /// - Parameters:
    ///   - owner: The object to set as the Nib’s owner (File’s Owner).
    ///   - topLevelObjects: On return, an array containing the top-level objects of the nib.
    /// - Returns: true if the nib is instantiated; otherwise false.
    func instantiate(withOwner owner: Any?, topLevelObjects: Any?) -> Bool {
        true
    }
}