import SwiftUI

struct TaskLimitMNG: Identifiable, Equatable{
    let id = UUID()//UUIDは自動でidを作成する記述
    var limit: String
    var taskList: [ListButton] = []
    //var subList: []
    
    init(limit: String,  taskList: [ListButton]) {
        self.limit = limit
        self.taskList = taskList
        //self.subList = subList
    }
}
