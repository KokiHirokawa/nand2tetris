import Foundation

extension NSTextCheckingResult {
    func range(safe at: Int) -> NSRange? {
        0..<numberOfRanges ~= at ? range(at: at) : nil
    }

    func group(at: Int, base: String) -> String? {
        guard let nsrange = range(safe: at),
              let range = Range(nsrange, in: base) else {
            return nil
        }
        
        let substring = base[range]
        return String(substring)
    }
}
