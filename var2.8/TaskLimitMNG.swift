import SwiftUI

struct TaskLimitMNG: Identifiable, Equatable{
    let id = UUID()//UUIDは自動でidを作成する記述
    var allTaskChecked: Bool
    var limit: Date?
    var taskList: [TaskListMNG] = []
    //var subList: []
    
    func isSameYearMonthDay(date1: Date?, date2: Date?) -> Bool {
        guard let date1 = date1, let date2 = date2 else {
            return false
        }
        let calendar = Calendar(identifier: .gregorian)
        let components1 = calendar.dateComponents([.year, .month, .day], from: date1)
        let components2 = calendar.dateComponents([.year, .month, .day], from: date2)
        
        return components1.year == components2.year &&
               components1.month == components2.month &&
               components1.day == components2.day
    }

    
    init(allTaskChecked: Bool, limit: Date?,  taskList: [TaskListMNG]) {
        self.allTaskChecked = allTaskChecked
        self.limit = limit
        self.taskList = taskList
        
    }
}
