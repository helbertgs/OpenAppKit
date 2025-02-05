import Foundation
import Logging

class Debug {

    private static var logger: Logger {
        var logger = Logger(label: "OpenAppKit")
        logger.logLevel = .info

        return logger
    }

    static func log(_ message: String = "", file: String = #fileID, function: String = #function, line: UInt = #line) {
        Debug.logger.debug(Logger.Message(stringLiteral: message), metadata: nil, source: nil, file: file, function: function, line: line)
    }

    static func error(_ message: String = "", file: String = #fileID, function: String = #function, line: UInt = #line) -> Never {
        Debug.logger.critical(Logger.Message(stringLiteral: message), metadata: nil, source: nil, file: file, function: function, line: line)
        return fatalError(message)
    }

    static func warning(_ message: String = "", file: String = #fileID, function: String = #function, line: UInt = #line) {
        Debug.logger.warning(Logger.Message(stringLiteral: message), metadata: nil, source: nil, file: file, function: function, line: line)
    }

    static func info(_ message: String = "", file: String = #fileID, function: String = #function, line: UInt = #line) {
        Debug.logger.info(Logger.Message(stringLiteral: message), metadata: nil, source: nil, file: file, function: function, line: line)
    }
}