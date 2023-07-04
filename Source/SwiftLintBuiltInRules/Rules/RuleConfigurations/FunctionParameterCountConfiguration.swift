import SwiftLintCore

struct FunctionParameterCountConfiguration: RuleConfiguration, Equatable {
    typealias Parent = FunctionParameterCountRule

    @ConfigurationElement
    private(set) var severityConfiguration = SeverityLevelsConfiguration<Parent>(warning: 5, error: 8)
    @ConfigurationElement(key: "ignores_default_parameters")
    private(set) var ignoresDefaultParameters = true

    mutating func apply(configuration: Any) throws {
        if let configurationArray = [Int].array(of: configuration),
            configurationArray.isNotEmpty {
            let warning = configurationArray[0]
            let error = (configurationArray.count > 1) ? configurationArray[1] : nil
            severityConfiguration = SeverityLevelsConfiguration(warning: warning, error: error)
        } else if let configDict = configuration as? [String: Any], configDict.isNotEmpty {
            for (string, value) in configDict {
                switch (string, value) {
                case ("error", let intValue as Int):
                    severityConfiguration.error = intValue
                case ("warning", let intValue as Int):
                    severityConfiguration.warning = intValue
                case ($ignoresDefaultParameters, let boolValue as Bool):
                    ignoresDefaultParameters = boolValue
                default:
                    throw Issue.unknownConfiguration(ruleID: Parent.identifier)
                }
            }
        } else {
            throw Issue.unknownConfiguration(ruleID: Parent.identifier)
        }
    }
}
