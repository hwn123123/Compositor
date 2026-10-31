import Foundation

/// Looks up user-facing text at the point where it enters the UI. Model raw values stay in English so project files,
/// keyboard-shortcut identifiers and menu routing remain stable across languages.
nonisolated enum L10n {
    static func text(_ key: String) -> String {
        Bundle.main.localizedString(forKey: key, value: key, table: nil)
    }

    static func format(_ key: String, _ arguments: CVarArg...) -> String {
        String(format: text(key), locale: Locale.current, arguments: arguments)
    }
}

extension RawRepresentable where RawValue == String {
    nonisolated var localizedName: String { L10n.text(rawValue) }
}
