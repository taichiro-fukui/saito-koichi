import SwiftUI

struct ListButton: Identifiable, Equatable{//このプロトコルをつけた構造体はidというプロパティが必要
    
    let id = UUID()//UUIDは自動でidを作成する記述
    var title: String
    var check: Bool
    //var subList: []
    
    init(title: String,  check: Bool) {
        self.title = title
        self.check = check
        //self.subList = subList
    }
}