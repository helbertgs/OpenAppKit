import CoreGraphics
import Foundation

/// An object you use to specify attributes to create and style a drop shadow during drawing operations.
/// 
/// When you create shadows, the system draws them in the default user coordinate space, where coordinates are independent from the pixel values of any particular device. 
/// Rotations, translations, and other transformations of the current transformation matrix (CTM) don’t affect the shadow or the apparent position of the shadow’s light source.
/// 
/// A shadow has two positional parameters: an x-offset and a y-offset. 
/// Express these values with a single size data type (``CGSize`` in iOS, ``NSSize`` in macOS), using the units of the default user coordinate space. 
/// Positive values for these offsets extend down and to the right from the user’s perspective.
/// 
/// In addition to its positional parameters, a shadow also contains a blur radius, which specifies how much the system blurs a drawn object’s image mask before compositing the image onto the destination. 
/// A value of 0 produces no blur. Larger values produce an increasingly large blurred shadow.
/// 
/// You can use an NSShadow object in one of two ways. 
/// First, you can set it, like a color or a font, where NSShadow attributes apply to everything you draw until you apply another shadow or restore a previous graphics state. 
/// Second, you can use an NSShadow instance as the value for the shadow text attribute, so the system applies the shadow to the glyphs corresponding to the characters bearing this attribute.
@MainActor public class NSShadow: @preconcurrency Equatable, @preconcurrency Hashable {

     // MARK: -  Managing a shadow
    
    /// The shadow’s relative position, which you specify with horizontal and vertical offset values.
    /// 
    /// This property contains the horizontal and vertical offset values that you specify using the width and height fields of the ``CGSize`` or ``NSSize`` data type. 
    /// These offsets use the default user coordinate space and are not affected by custom transformations. 
    /// Positive offset values extend down and to the right from the user’s perspective.
    public var shadowOffset: CoreGraphics.CGSize

    /// The blur radius of the shadow.
    /// 
    /// This property contains the shadow’s blur radius, as measured in the default user coordinate space. 
    /// A value of 0 produces no blur, while larger values produce an increasingly large blurred shadow. 
    /// This value must not be negative. The default value is 0.
    public var shadowBlurRadius: Float

    /// The color of the shadow.
    /// 
    /// The default shadow color is black with an alpha of 1/3. 
    /// If you set this property to nil, the shadow is not drawn. 
    /// The color you specify must be convertible to an RGBA color and may contain alpha information.
    public var shadowColor: NSColor

    // MARK: - Creating a shadow
    
    /// Creates a shadow object with default values.
    public init(shadowOffset: CoreGraphics.CGSize, shadowBlurRadius: Float = 0, shadowColor: NSColor = NSColor(red: 0, green: 0, blue: 0, alpha: 0.33)) {
        self.shadowOffset = shadowOffset
        self.shadowBlurRadius = shadowBlurRadius
        self.shadowColor = shadowColor
    }
     
    // MARK: - Setting a shadow

    /// Sets the shadow of subsequent drawing operations to the current shadow.
    /// 
    /// The shadow attributes of the receiver are used until another shadow is set or until the graphics state is restored.
    public func set() {
        fatalError("not implemented yet")
    }
}

extension NSShadow {
    public static func == (_ lhs: NSShadow, _ rhs: NSShadow) -> Bool {
        lhs.shadowBlurRadius == rhs.shadowBlurRadius &&
        lhs.shadowColor == rhs.shadowColor && 
        lhs.shadowOffset == rhs.shadowOffset
    }
}

extension NSShadow {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(shadowBlurRadius)
        hasher.combine(shadowColor)
        hasher.combine(shadowOffset)
    }
}