import SwiftUI

@main
struct GanttChartApp: App {
    //@StateObject private var taskDate2 = TaskDate2()
    @StateObject private var userTask = UserTask()
    @StateObject private var taskLimit = TaskLimit()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(UserData())
                .environmentObject(userTask)
                .environmentObject(taskLimit)
        }
    }
}
