import Foundation

struct Parser {

    static func parse(_ source: String) -> [Command] {
        let commands = source.split(separator: "\n")
        return commands.compactMap { _parse(String($0)) }
    }

    static func _parse(_ command: String) -> Command? {
        guard !command.isEmpty else {
            return nil
        }

        let length = command.count

        if let matchOfAddress = RegexPattern.address.firstMatch(in: command, range: .init(location: 0, length: length)),
           let value = matchOfAddress.group(at: 1, base: command) {
            return .address(value: value)
        }

        if let matchOfCalculation = RegexPattern.calculation.firstMatch(in: command, range: .init(location: 0, length: length)),
           let comp = matchOfCalculation.group(at: 1, base: command),
           let dest = matchOfCalculation.group(at: 2, base: command),
           let jump = matchOfCalculation.group(at: 3, base: command) {
            return .calculation(comp: comp, dest: dest, jump: jump)
        }

        return .label(name: "unknown")
    }
}

extension Parser {
    enum RegexPattern {
        static let address = try! NSRegularExpression(pattern: #"^@([a-zA-Z0-9]+)$"#)
        static let calculation = try! NSRegularExpression(
            pattern: #"^(M|D|MD|A|AM|AD|AMD)?=([0-1AMD!-+&|]{1,3});?(JGT|JEQ|JGE|JLT|JNE|JLE|JMP)?$"#
        )
    }
}
