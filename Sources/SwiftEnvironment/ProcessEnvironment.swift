import Foundation

public enum ProcessEnvironment {
    static var environment: [String: String] = ProcessInfo.processInfo.environment

    public static subscript(key: String) -> String? {
        environment[key]
    }

    public static func require(_ key: String) throws -> String {
        guard let value = self[key] else {
            throw RequriedEnvironmentVariableError(key: key)
        }

        return value
    }

    static func dump() -> String {
        environment
            .map { "\($0.key): \($0.value)" }
            .joined(separator: "\n")
    }
}
