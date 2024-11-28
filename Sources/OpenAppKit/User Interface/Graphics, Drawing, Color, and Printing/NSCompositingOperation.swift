import Foundation

/// Constants that describe compositing operators in terms of source and destination images, each having an opaque and transparent region.
public enum NSCompositingOperation {

    // MARK: - Operations for Compositing

    /// Transparency everywhere.
    case clear

    /// The source image.
    case copy

    /// The source image wherever it is opaque, and the destination image elsewhere.
    case sourceOver

    /// The source image wherever both images are opaque, and transparent elsewhere.
    case sourceIn

    /// The source image wherever it is opaque and the destination image is transparent, and transparent elsewhere.
    case sourceOut

    /// The source image wherever both images are opaque, the destination image wherever it is opaque but the source image is transparent, and transparent elsewhere
    case sourceAtop

    /// The destination image wherever it is opaque, and the source image elsewhere.
    case destinationOver

    /// The destination image wherever both images are opaque, and transparent elsewhere.
    case destinationIn

    /// The destination image wherever it is opaque and the source image is transparent, and transparent elsewhere.
    case destinationOut

    /// The destination image wherever both images are opaque, the source image wherever it is opaque and the destination image is transparent, and transparent elsehwere.
    case destinationAtop

    /// Exclusive OR of the source and destination images.
    case xor

    /// The sum of the source and destination images, with color values approach 0 as a limit.
    case plusDarker

    /// The sum of the source and destination images, with color values approach 1 as a limit.
    case plusLighter

    /// The source color is multiplied by the destination color.
    case multiply

    /// Multiplies the complement of the destination and source color values, and then complements the result.
    case screen

    /// Source colors overlay the destination.
    case overlay

    /// Use the darker of the source and destination colors.
    case darken

    /// Use the lighter of the source and destination colors.
    case lighten

    /// Brightens the destination to reflect the source.
    case colorDodge

    /// Darkens the destination color to reflect the source.
    case colorBurn

    /// Darkens or lightens colors, with the effect of shining a diffused spotlight on the destination.
    case softLight

    /// Multiplies or screens colors, with the effect of shining a spotlight on the destination.
    case hardLight

    /// Subtracts the darker value from the lighter value.
    case difference

    /// Subtracts the darker value from the lighter value, except lower in contrast.
    case exclusion

    /// Uses the hue of the source and the saturation and luminosity of the destination.
    case hue

    /// Uses the saturation value of the source and the hue and luminosity of the destination.
    case saturation

    /// Uses the hue and saturation of the source and the luminosity of the destination.
    case color

    /// Uses the luminosity of the source and the hue and saturation of the destination.
    case luminosity 
}