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

    public static func _dump() -> String {
        environment
            .sorted(by: { $0.key < $1.key })
            .map { "\($0.key): \($0.value)" }
            .joined(separator: "\n")
    }
}
