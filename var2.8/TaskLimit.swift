import SwiftUI

// タスクに関する情報
class TaskLimit: ObservableObject {
    @Published var taskLimitMng = [
        TaskLimitMNG(allTaskChecked: true,
            limit: Calendar(identifier: .gregorian).date(from: DateComponents(year: 2025, month: 12)),
            taskList: [TaskListMNG(title: "新しいタスクを追加", check: false)]
        )
    ]
}
