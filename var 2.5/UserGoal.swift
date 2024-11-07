import SwiftUI

struct UserGoal: Identifiable, Equatable{//このプロトコルをつけた構造体はidというプロパティが必要
    let id = UUID()//UUIDは自動でidを作成する記述
    var title: String
    var backgroundColor: Color
    init(title: String,  backgroundColor: Color) {
        self.title = title
        self.backgroundColor = backgroundColor
    }
}
