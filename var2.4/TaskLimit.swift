//
//  TaskLimit.swift
//  GanttChart
//
//  Created by 福井　太一朗 on 2024/11/03.
//

import SwiftUI

class TaskLimit: ObservableObject{
    @Published var taskLimitMng = [
        TaskLimitMNG(limit: "2025-12-13", taskList: [ListButton(title: "あ", check: false)])
    ]
}
