import Foundation

@propertyWrapper
public struct EnvironmentVariable<T> {
    public struct RequriedEnvironmentVariableError: LocalizedError {
        let key: String

        public var errorDescription: String? {
            "Missing required environment variable: \(key)"
        }
    }

    public struct Required {
        let key: String
        let value: T?

        public func require() throws -> T {
            guard let value else {
                throw RequriedEnvironmentVariableError(key: key)
            }

            return value
        }
    }

    let key: String
    let transform: (String) -> T?

    public var wrappedValue: T? {
        ProcessEnvironment[key].flatMap(transform)
    }

    public var projectedValue: Required {
        Required(key: key, value: wrappedValue)
    }

    public init(_ key: String, transform: @escaping (String) -> T?) {
        self.key = key
        self.transform = transform
    }
}

public extension EnvironmentVariable<String> {
    init(_ key: String) {
        self.init(key, transform: { $0 })
    }
}
