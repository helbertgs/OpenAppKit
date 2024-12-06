import Foundation

extension NSEvent {

    @MainActor
    public struct SpecialKey: Hashable, @preconcurrency RawRepresentable {

        // MARK: - Getting Common Control Keys

        /// The backspace key.
        public static let backspace = SpecialKey(rawValue: 259)
        
        /// The carriage return key.
        public static let carriageReturn = SpecialKey(rawValue: 1)
        
        /// The newline key.
        public static let newline = SpecialKey(rawValue: 1)
        
        /// The enter key.
        public static let enter = SpecialKey(rawValue: 1)
        
        /// The delete key.
        public static let delete = SpecialKey(rawValue: 1)
        
        /// The delete forward key.
        public static let deleteForward = SpecialKey(rawValue: 1)
        
        /// The back tab key.
        public static let backTab = SpecialKey(rawValue: 1)
        
        /// The tab key.
        public static let tab = SpecialKey(rawValue: 258)
        
        // MARK: - Getting the Navigation-Related Keys

        /// The up arrow key.
        public static let upArrow = SpecialKey(rawValue: 1)
        
        /// The down arrow key.
        public static let downArrow = SpecialKey(rawValue: 1)
        
        /// The left arrow key.
        public static let leftArrow = SpecialKey(rawValue: 1)
        
        /// The right arrow key.
        public static let rightArrow = SpecialKey(rawValue: 1)
        
        /// The page up key.
        public static let pageUp = SpecialKey(rawValue: 1)
        
        /// The page down key.
        public static let pageDown = SpecialKey(rawValue: 1)
        
        /// The home key.
        public static let home = SpecialKey(rawValue: 1)
        
        /// The end key.
        public static let end = SpecialKey(rawValue: 1)
        
        /// The previous key.
        public static let prev = SpecialKey(rawValue: 1)
        
        /// The next key.
        public static let next = SpecialKey(rawValue: 1)
        
        // MARK: - Getting Special Behavior Keys

        /// The begin key.
        public static let begin = SpecialKey(rawValue: 1)
        
        /// The break key.
        public static let `break` = SpecialKey(rawValue: 1)
        
        /// The clear display key.
        public static let clearDisplay = SpecialKey(rawValue: 1)
        
        /// The clear line key.
        public static let clearLine = SpecialKey(rawValue: 1)
        
        /// The delete character key.
        public static let deleteCharacter = SpecialKey(rawValue: 1)
        
        /// The delete line key.
        public static let deleteLine = SpecialKey(rawValue: 1)
        
        /// The execute key.
        public static let execute = SpecialKey(rawValue: 1)
        
        /// The find key.
        public static let find = SpecialKey(rawValue: 1)
        
        /// The form feed key.
        public static let formFeed = SpecialKey(rawValue: 1)
        
        /// The help key.
        public static let help = SpecialKey(rawValue: 1)
        
        /// The insert key.
        public static let insert = SpecialKey(rawValue: 1)
        
        /// The insert character key.
        public static let insertCharacter = SpecialKey(rawValue: 1)
        
        /// The insert line key.
        public static let insertLine = SpecialKey(rawValue: 1)
        
        /// The line separator key.
        public static let lineSeparator = SpecialKey(rawValue: 1)
        
        /// The menu key.
        public static let menu = SpecialKey(rawValue: 1)
        
        /// The mode switch key.
        public static let modeSwitch = SpecialKey(rawValue: 1)
        
        /// The paragraph separator key.
        public static let paragraphSeparator = SpecialKey(rawValue: 1)
        
        /// The pause key.
        public static let pause = SpecialKey(rawValue: 1)
        
        /// The print key.
        public static let print = SpecialKey(rawValue: 1)
        
        /// The print screen key.
        public static let printScreen = SpecialKey(rawValue: 1)
        
        /// The redo key.
        public static let redo = SpecialKey(rawValue: 1)
        
        /// The reset key.
        public static let reset = SpecialKey(rawValue: 1)
        
        /// The scroll lock key.
        public static let scrollLock = SpecialKey(rawValue: 1)
        
        /// The select key.
        public static let select = SpecialKey(rawValue: 1)
        
        /// The stop key.
        public static let stop = SpecialKey(rawValue: 1)
        
        /// The system request key.
        public static let sysReq = SpecialKey(rawValue: 1)
        
        /// The system key.
        public static let system = SpecialKey(rawValue: 1)
        
        /// The undo key.
        public static let undo = SpecialKey(rawValue: 1)
        
        /// The user key.
        public static let user = SpecialKey(rawValue: 1)

        // MARK: - Getting the Function Keys

        /// The F1 key.
        public static let f1 = SpecialKey(rawValue: 290)
        
        /// The F2 key.
        public static let f2 = SpecialKey(rawValue: 291)
        
        /// The F3 key.
        public static let f3 = SpecialKey(rawValue: 292)
        
        /// The F4 key.
        public static let f4 = SpecialKey(rawValue: 293)
        
        /// The F5 key.
        public static let f5 = SpecialKey(rawValue: 294)
        
        /// The F6 key.
        public static let f6 = SpecialKey(rawValue: 295)
        
        /// The F7 key.
        public static let f7 = SpecialKey(rawValue: 296)
        
        /// The F8 key.
        public static let f8 = SpecialKey(rawValue: 297)
        
        /// The F9 key.
        public static let f9 = SpecialKey(rawValue: 298)
        
        /// The F10 key.
        public static let f10 = SpecialKey(rawValue: 299)
        
        /// The F11 key.
        public static let f11 = SpecialKey(rawValue: 300)
        
        /// The F12 key.
        public static let f12 = SpecialKey(rawValue: 301)
        
        /// The F13 key.
        public static let f13 = SpecialKey(rawValue: 302)
        
        /// The F14 key.
        public static let f14 = SpecialKey(rawValue: 303)
        
        /// The F15 key.
        public static let f15 = SpecialKey(rawValue: 304)
        
        /// The F16 key.
        public static let f16 = SpecialKey(rawValue: 305)
        
        /// The F17 key.
        public static let f17 = SpecialKey(rawValue: 306)
        
        /// The F18 key.
        public static let f18 = SpecialKey(rawValue: 307)
        
        /// The F19 key.
        public static let f19 = SpecialKey(rawValue: 308)
        
        /// The F20 key.
        public static let f20 = SpecialKey(rawValue: 309)
        
        /// The F21 key.
        public static let f21 = SpecialKey(rawValue: 310)
        
        /// The F22 key.
        public static let f22 = SpecialKey(rawValue: 311)
        
        /// The F23 key.
        public static let f23 = SpecialKey(rawValue: 312)
        
        /// The F24 key.
        public static let f24 = SpecialKey(rawValue: 313)
        
        /// The F25 key.
        public static let f25 = SpecialKey(rawValue: 314)
        
        // MARK: - Creating a Key with a Raw Value

        public var rawValue: Int
        
        /// Creates a key constant with the specified value.
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}
