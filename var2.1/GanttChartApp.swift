import SwiftUI

@main
struct GanttChartApp: App {
    //@StateObject private var taskDate2 = TaskDate2()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(UserData())
                .environmentObject(UserTask())
                //.environmentObject(TaskDate2())
        }
    }
}
