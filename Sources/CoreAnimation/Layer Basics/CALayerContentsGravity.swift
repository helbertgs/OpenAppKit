import Foundation

public enum CALayerContentsGravity: Int, Equatable, Hashable {
    //// The content is horizontally centered at the bottom-edge of the bounds rectangle.
    case bottom

    //// The content is positioned in the bottom-left corner of the bounds rectangle.
    case bottomLeft

    //// The content is positioned in the bottom-right corner of the bounds rectangle.
    case bottomRight

    //// The content is horizontally and vertically centered in the bounds rectangle.
    case center

    //// The content is vertically centered at the left-edge of the bounds rectangle.
    case left

    //// The content is resized to fit the entire bounds rectangle.
    case resize

    //// The content is resized to fit the bounds rectangle, preserving the aspect of the content. If the content does not completely fill the bounds rectangle, the content is centered in the partial axis.
    case resizeAspect

    //// The content is resized to completely fill the bounds rectangle, while still preserving the aspect of the content. The content is centered in the axis it exceeds.
    case resizeAspectFill

    //// The content is vertically centered at the right-edge of the bounds rectangle.
    case right

    //// The content is horizontally centered at the top-edge of the bounds rectangle.
    case top

    //// The content is positioned in the top-left corner of the bounds rectangle.
    case topLeft

    //// The content is positioned in the top-right corner of the bounds rectangle.
    case topRight
}