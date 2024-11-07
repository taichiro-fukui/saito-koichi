import SwiftUI

class TaskLimit: ObservableObject{
    @Published var taskLimitMng = [
        TaskLimitMNG(limit: "2025-12-13", taskList: [ListButton(title: "新しいタスクを追加", check: false)])
    ]
}
