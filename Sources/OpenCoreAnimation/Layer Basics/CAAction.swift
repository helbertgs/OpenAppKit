import Foundation

/// An interface that allows instances to respond to actions triggered by a Core Animation layer change.
/// 
/// When queried with an action identifier (a key path, an external action name, or a predefined action identifier) 
/// a layer returns the appropriate action object–which must implement the ``CAAction`` protocol–and sends it a ``run(forKey:object:arguments:)`` message.
public protocol CAAction {
    /// Called to trigger the action specified by the identifier.
    /// - Parameters:
    ///   - event: The identifier of the action. The identifier may be a key or key path relative to anObject, an arbitrary external action, or one of the action identifiers defined in ``CALayer``.
    ///   - anObject: The layer on which the action should occur.
    ///   - dict: A dictionary containing parameters associated with this event. May be nil.
    func run(forKey event: String, object anObject: Any,arguments dict: [AnyHashable : Any]?)
}