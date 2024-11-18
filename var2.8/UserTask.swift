import SwiftUI

class UserTask: ObservableObject{
    @Published var taskListMNG = [
        TaskListMNG(title: "用件定義を行う", check: false),
        TaskListMNG(title: "モック版を作る", check: false),
        TaskListMNG(title: "アプリの制作を完了する", check: false),
        TaskListMNG(title: "アプリのリリースを完了する", check: false)
    ]
}
