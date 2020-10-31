class Translator {

    func translate(commands: [Command]) -> String {
        commands.map {
            switch $0 {
            case let .address(value):
                guard let value = Int(value) else {
                    fatalError("sorry, not implemented.")
                }

                return String(value, radix: 2)

            case let .calculation(comp, dest, jump):
                let binaryComp: String
                switch comp {
                case "0":   binaryComp = "0101010"
                case "1":   binaryComp = "0111111"
                case "-1":  binaryComp = "0111010"
                case "D":   binaryComp = "0001100"
                case "A":   binaryComp = "0110000"
                case "!D":  binaryComp = "0001101"
                case "!A":  binaryComp = "0110001"
                case "-D":  binaryComp = "0001111"
                case "-A":  binaryComp = "0110011"
                case "D+1": binaryComp = "0011111"
                case "A+1": binaryComp = "0110111"
                case "D-1": binaryComp = "0001110"
                case "A-1": binaryComp = "0110010"
                case "D+A": binaryComp = "0000010"
                case "D-A": binaryComp = "0010011"
                case "A-D": binaryComp = "0000111"
                case "D&A": binaryComp = "0000000"
                case "D|A": binaryComp = "0010101"
                case "M":   binaryComp = "1110000"
                case "!M":  binaryComp = "1110001"
                case "-M":  binaryComp = "1110011"
                case "M+1": binaryComp = "1110111"
                case "M-1": binaryComp = "1110010"
                case "D+M": binaryComp = "1000010"
                case "D-M": binaryComp = "1010011"
                case "M-D": binaryComp = "1000111"
                case "D&M": binaryComp = "1000000"
                case "D|M": binaryComp = "1010101"
                default:    fatalError("developmental error.")
                }

                let binaryDest: String
                switch dest {
                case "":    binaryDest = "000"
                case "M":   binaryDest = "001"
                case "D":   binaryDest = "010"
                case "MD":  binaryDest = "011"
                case "A":   binaryDest = "100"
                case "AM":  binaryDest = "101"
                case "AD":  binaryDest = "110"
                case "AMD": binaryDest = "111"
                default:    fatalError("developmental error.")
                }

                let binaryJump: String
                switch jump {
                case "": binaryJump = "000"
                case "JGT": binaryJump = "001"
                case "JEQ": binaryJump = "010"
                case "JGE": binaryJump = "011"
                case "JLT": binaryJump = "100"
                case "JNE": binaryJump = "101"
                case "JLE": binaryJump = "110"
                case "JMP": binaryJump = "111"
                default: fatalError("developmental error.")
                }

                return "111" + binaryComp + binaryDest + binaryJump

            case let .label(name):
                fatalError("sorry, not implemented.")
            }
        }
        .joined(separator: "\n")
    }

}
