import Foundation
/// Compositing operations for images.
/// 
/// These blend mode constants represent the Porter-Duff blend modes. The symbols in the equations for these blend modes are:
/// 
/// R is the premultiplied result
/// 
/// S is the source color, and includes alpha
/// 
/// D is the destination color, and includes alpha
/// 
/// Ra, Sa, and Da are the alpha components of R, S, and D
/// 
/// You can find more information on blend modes, including examples of images produced using them, and many mathematical descriptions of the modes, in PDF Reference, Fourth Edition, Version 1.5, Adobe Systems, Inc. 
/// If you are a former QuickDraw developer, it may be helpful for you to think of blend modes as an alternative to transfer modes
public enum CGBlendMode: String, Codable, Equatable, Hashable, Sendable {

    /// Paints the source image samples over the background image samples.
    case normal

    /// Multiplies the source image samples with the background image samples. This results in colors that are at least as dark as either of the two contributing sample colors.
    case multiply

    /// Multiplies the inverse of the source image samples with the inverse of the background image samples, resulting in colors that are at least as light as either of the two contributing sample colors.
    case screen

    case overlay
    case darken
    case lighten

    /// Brightens the background image samples to reflect the source image samples. Source image sample values that specify black do not produce a change.
    case colorDodge

    /// Darkens the background image samples to reflect the source image samples. Source image sample values that specify white do not produce a change.
    case colorBurn

    case softLight
    case hardLight
    case difference

    /// Produces an effect similar to that produced by CGBlendMode.difference, but with lower contrast. Source image sample values that are black don’t produce a change; white inverts the background color values.
    case exclusion

    /// Uses the luminance and saturation values of the background with the hue of the source image.
    case hue

    /// Uses the luminance and hue values of the background with the saturation of the source image. Areas of the background that have no saturation (that is, pure gray areas) don’t produce a change.
    case saturation

    /// Uses the luminance values of the background with the hue and saturation values of the source image. This mode preserves the gray levels in the image. You can use this mode to color monochrome images or to tint color images.
    case color

    /// Uses the hue and saturation of the background with the luminance of the source image. This mode creates an effect that is inverse to the effect created by CGBlendMode.color.
    case luminosity

    /// R = 0
    case clear

    /// R = S
    case copy

    /// R = S*Da
    case sourceIn

    /// R = S*(1 - Da)
    case sourceOut

    /// R = S*Da + D*(1 - Sa)
    case sourceAtop

    /// R = S*(1 - Da) + D
    case destinationOver

    /// R = D*Sa
    case destinationIn

    /// R = D*(1 - Sa)
    case destinationOut

    /// R = S*(1 - Da) + D*Sa
    case destinationAtop

    /// R = S*(1 - Da) + D*(1 - Sa). This XOR mode is only nominally related to the classical bitmap XOR operation, which is not supported by Core Graphics
    case xor

    /// R = MAX(0, 1 - ((1 - D) + (1 - S)))
    case plusDarker

    /// R = MIN(1, S + D)
    case plusLighter

}