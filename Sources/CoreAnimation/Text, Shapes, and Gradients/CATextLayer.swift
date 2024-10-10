import CoreGraphics
import Foundation

/// A layer that provides simple text layout and rendering of plain or attributed strings.
@MainActor public class CATextLayer: CALayer {

    // MARK: - Getting and Setting the Text
    
    /// The text to be rendered by the receiver.
    /// 
    /// The text must be an instance of String or AttributedString. 
    /// Defaults to nil.
    public var string: Any?

    // MARK: - Text Visual Properties

    /// The font used to render the receiver’s text.
    /// 
    /// Defaults to Helvetica.
    /// The font property is only used when the string property is not an AttributedString.
    public var font = CoreGraphics.CGFont("Helvetica")

    /// The font size used to render the receiver’s text.
    /// 
    /// Defaults to 36.0.
    /// The fontSize property is only used when the string property is not an AttributedString.
    public var fontSize: Float = 36

    /// The color used to render the receiver’s text.
    /// 
    /// Defaults to opaque white.
    /// The foregroundColor property is only used when the string property is not an AttributedString.
    public var foregroundColor: CoreGraphics.CGColor? = .white

    // MARK: - Text Alignment and Truncation

    /// Determines whether the text is wrapped to fit within the receiver’s bounds.
    /// 
    /// Defaults to false.
    public var isWrapped: Bool = false

    /// Determines how individual lines of text are horizontally aligned within the receiver’s bounds.
    /// 
    /// Defaults to natural.
    public var alignmentMode: CATextLayerAlignmentMode = .natural

    /// Determines how the text is truncated to fit within the receiver’s bounds.
    /// 
    /// Defaults to none.
    public var truncationMode: CATextLayerTruncationMode = .none
}

extension CATextLayer {
    @MainActor public enum CATextLayerAlignmentMode: Equatable, Hashable, Sendable {
        /// Text is visually center aligned.
        case center
        /// Text is justified.
        case justified
        /// Text is visually left aligned.
        case left
        /// Use the natural alignment of the text’s script.
        case natural
        /// Text is visually right aligned.
        case right
    }
}

extension CATextLayer {
    @MainActor public enum CATextLayerTruncationMode: Equatable, Hashable, Sendable {
        /// Each line is displayed so that the beginning fits in the container and the missing text is indicated by some kind of ellipsis glyph.
        case end
        /// Each line is displayed so that the beginning and end fit in the container and the missing text is indicated by some kind of ellipsis glyph in the middle.
        case middle
        /// If the isWrapped property is true, the text is wrapped to the receiver’s bounds, otherwise the text is clipped to the receiver’s bounds.
        case none
        /// Each line is displayed so that the end fits in the container and the missing text is indicated by some kind of ellipsis glyph.
        case start
    }
}