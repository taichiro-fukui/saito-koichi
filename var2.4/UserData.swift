//
//  UserData.swift
//  GanttChart
//
//  Created by 福井　太一朗 on 2024/10/23.
//

import SwiftUI

class UserData: ObservableObject{
   @Published var userGoal = [
        UserGoal(title: "アプリ制作", backgroundColor: Color(.sRGB, red: 1, green: 0, blue: 0)),
        UserGoal(title: "ベンチ100kg", backgroundColor: Color(.sRGB, red: 0, green: 0, blue: 1)),
        UserGoal(title: "年収1000万", backgroundColor: Color(.sRGB, red: 0.5, green: 0.5, blue: 0)),
        UserGoal(title: "年収1000万", backgroundColor: Color(.sRGB, red: 0, green: 0.5, blue: 0.5)),
        UserGoal(title: "年収1000万", backgroundColor: Color(.sRGB, red: 0.5, green: 0, blue: 0.5))
    ]
}


