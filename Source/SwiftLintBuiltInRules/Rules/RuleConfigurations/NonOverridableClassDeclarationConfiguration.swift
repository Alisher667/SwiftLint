import SwiftLintCore

  // swiftlint:disable:next type_name
struct NonOverridableClassDeclarationConfiguration: SeverityBasedRuleConfiguration {
    typealias Parent = NonOverridableClassDeclarationRule

    
    enum FinalClassModifier: String {
        case finalClass = "final class"
        case `static` = "static"
    }

    @ConfigurationElement(key: "severity")
    private(set) var severityConfiguration = SeverityConfiguration<Parent>.warning
    @ConfigurationElement(key: "final_class_modifier")
    private(set) var finalClassModifier = FinalClassModifier.finalClass
}
