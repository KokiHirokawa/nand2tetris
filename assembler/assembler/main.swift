import Foundation

print("Hello, World!")

// - TODO: ファイルを読み込む

// 各行を読む（改行で分割する）
// パーサーはコマンドのindexを持つ必要があるかもしれない
    // commands.forEach { }
    // forEachじゃない方がいいかも。indexを増やすかは行の内容によるため
    // 生成したバイナリコードをParserが保持しているのは少し違うかも？
    // パーサーの内部で完結するのではなく、parse関数の返り値が[CommandType]でいいのでは？
        // CommandTypeはAssociatedTypeで情報を保持する必要がある
        // この場合パーサーがコマンドのindexを保持する必要はなくすべてTranslatorに任せることができる
        // 返り値がバイナリコード本体でもいいし、プロパティに格納してもいい
        // エラー表示するときのソースコードの行数情報は消えてしまう
// どのコマンドタイプか判断する
    // 各行がどのコマンドタイプかはParserで判断して良さそう
    // A命令: シンボルテーブルを用いる
    // C命令: dest,comp,jumpから判断する
    // ラベル: 行数を用いる&シンボルテーブルに登録する
// バイナリに吐き出す
// 各行のバイナリをまとめる

// - TODO: ファイルに書き込む
