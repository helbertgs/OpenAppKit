import Foundation

/// A set of character glyphs and layout information for drawing text.
/// 
/// A glyph can represent a single character (such as ‘b’), more than one character (such as the “ﬁ” ligature), or a special character such as a space. 
/// Core Graphics retrieves the glyphs for the font from ATS (Apple Type Services) and paints the glyphs based on the relevant parameters of the current graphics state.
/// 
/// Core Graphics provides a limited, low-level interface for drawing text. 
/// For information on text-drawing functions, see ``CGContext``. 
/// For full Unicode and text-layout support, use the services provided by ``TextKit``).
@MainActor public class CGFont {

    // MARK: - Examining Font Metadata
    
    /// Returns the full name associated with a font object.
    public var name: String?

    /// Creates a font object corresponding to the font specified by a PostScript or full name.
    /// 
    /// Before drawing text in a Core Graphics context, you must set the font in the current graphics state by calling the function setFont(_:).
    /// - Parameter name: The PostScript or full name of a font.
    public init(_ name: String) {
        self.name = name
    }
}