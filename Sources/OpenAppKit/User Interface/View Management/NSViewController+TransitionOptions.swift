import Foundation

extension NSViewController {
    @MainActor
    public enum TransitionOptions: Equatable, Hashable {

        /// A transition animation that fades the new view in and simultaneously fades the old view out. You can combine this animation option with any of the “slide” options in this enumeration.
        case crossfade
        /// A transition animation that slides the old view up while the new view comes into view from the bottom. In other words, both views slide up.
        case slideUp
        /// A transition animation that slides the old view down while the new view slides into view from the top. In other words, both views slide down.
        case slideDown
        /// A transition animation that slides the old view to the left while the new view slides into view from the right. In other words, both views slide to the left.
        case slideLeft
        /// A transition animation that slides the old view to the right while the new view slides into view from the left. In other words, both views slide to the right.
        case slideRight
        /// A transition animation that reflects the user interface layout direction (userInterfaceLayoutDirection) in a “forward” manner, as follows:
        case slideForward
        /// A transition animation that reflects the user interface layout direction (userInterfaceLayoutDirection) in a “backward” manner, as follows
        case slideBackward
        /// A transition animation that allows user interaction during the transition.
        case allowUserInteraction
    }
}