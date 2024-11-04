//
//  Task.swift
//  GanttChart
//
//  Created by 福井　太一朗 on 2024/10/24.
//

import SwiftUI

class UserTask: ObservableObject{
    @Published var listButton = [
        ListButton(title: "用件定義を行う", check: false),
        ListButton(title: "モック版を作る", check: false),
        ListButton(title: "アプリの制作を完了する", check: false),
        ListButton(title: "アプリのリリースを完了する", check: false)
    ]
}

