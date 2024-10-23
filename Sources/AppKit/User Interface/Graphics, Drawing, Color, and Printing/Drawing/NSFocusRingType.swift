import Foundation

/// Constants that describe the style of the focus ring.
/// 
/// The focus ring type is used by ``NSView`` and ``NSCell`` to configure whether and how a control draws its focus ring.
@MainActor public enum NSFocusRingType {
    
    ///The default focus ring type for a view or cell.
    case `default`
    
    ///No focus ring.
    case none
    
    ///The standard Aqua focus ring.
    case exterior
}