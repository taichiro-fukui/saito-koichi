//
//  GanttChartApp.swift
//  GanttChart
//
//  Created by 福井　太一朗 on 2024/10/17.
//

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
