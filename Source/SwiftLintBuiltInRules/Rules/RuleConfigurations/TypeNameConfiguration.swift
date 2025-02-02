import SwiftLintCore

 
struct TypeNameConfiguration: RuleConfiguration {
    typealias Parent = TypeNameRule

    @ConfigurationElement
    private(set) var nameConfiguration = NameConfiguration<Parent>(minLengthWarning: 3,
                                                                   minLengthError: 0,
                                                                   maxLengthWarning: 40,
                                                                   maxLengthError: 1000)
    @ConfigurationElement(key: "validate_protocols")
    private(set) var validateProtocols = true
}
