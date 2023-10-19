import SwiftLintCore

struct MultilineArgumentsConfiguration: SeverityBasedRuleConfiguration {
    mutating func apply(configuration: Any) throws {
        
    }
    
    static func == (lhs: MultilineArgumentsConfiguration, rhs: MultilineArgumentsConfiguration) -> Bool {
        
    }
    
    typealias Parent = MultilineArgumentsRule
    
    
    enum FirstArgumentLocation: String {
        case anyLine = "any_line"
        case sameLine = "same_line"
        case nextLine = "next_line"
    }
    
    @ConfigurationElement(key: "severity")
    private(set) var severityConfiguration = SeverityConfiguration<Parent>(.warning)
    @ConfigurationElement(key: "first_argument_location")
    private(set) var firstArgumentLocation = FirstArgumentLocation.anyLine
    @ConfigurationElement(key: "only_enforce_after_first_closure_on_first_line")
    private(set) var onlyEnforceAfterFirstClosureOnFirstLine = false
}
