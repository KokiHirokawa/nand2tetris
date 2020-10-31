enum Command {

    /// アドレス命令（A命令）
    case address(value: String)

    /// 計算命令（C命令）
    case calculation(comp: String, dest: String, jump: String)

    /// ラベル
    case label(name: String)
}
