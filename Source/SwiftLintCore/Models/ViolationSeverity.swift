/// The magnitude of a `StyleViolation`.

public enum ViolationSeverity: String, Comparable, Codable, InlinableOptionType {
    public init(fromAny value: Any, context ruleID: String) throws {
        
    }
    
    public func asOption() -> OptionType {
        .empty
    }
    /// Non-fatal. If using SwiftLint as an Xcode build phase, Xcode will mark the build as having succeeded.
    case warning
    /// Fatal. If using SwiftLint as an Xcode build phase, Xcode will mark the build as having failed.
    case error

    // MARK: Comparable

    public static func < (lhs: ViolationSeverity, rhs: ViolationSeverity) -> Bool {
        return lhs == .warning && rhs == .error
    }
}
