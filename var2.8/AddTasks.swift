import SwiftUI

struct AddTasks: View {
    @State private var limit1 = ""
    @State private var task = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var taskLimit: TaskLimit
    @State private var date = Date()
    
    var body: some View {
        
        NavigationStack {
            List{
                Section(header: Text("期限")){
                    DatePicker("期限を入力", selection: $date, displayedComponents: [.date])
                        .datePickerStyle(.compact) // 必要に応じてスタイルを設定
                        .environment(\.locale, Locale(identifier: "ja_JP")) // 日本語ロケールを設定

                }
                Section(header: Text("タスク")){
                    TextField("タスクを入力してください", text: $task)
                        .padding()
                        .autocapitalization(.none)
                }
                
            }
            .navigationTitle("新しい目標")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("キャンセル") {
                        dismiss()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("完了") {
                        var found = false // `found`フラグを初期化
                        
                        // `task`が空でないことを確認
                        if !task.isEmpty {
                            
                            for index in 0..<taskLimit.taskLimitMng.count {
                                

                                if taskLimit.taskLimitMng[index].isSameYearMonthDay(date1: taskLimit.taskLimitMng[index].limit, date2: date) {
                                    taskLimit.taskLimitMng[index].taskList.append(TaskListMNG(title: task, check: false))
                                    taskLimit.taskLimitMng[index].allTaskChecked = true
                                    found = true
                                    break
                                }
                            }
                            
                            // 一致する日付が見つからなかった場合
                            if !found {
                                var isNotMax = false
                                for index in 0..<taskLimit.taskLimitMng.count {
                                    if(taskLimit.taskLimitMng[index].limit ?? Date() > date){
                                        taskLimit.taskLimitMng.insert(TaskLimitMNG(allTaskChecked: true,limit: date, taskList: [TaskListMNG(title: task, check: false)]), at: index)
                                        isNotMax = true
                                        break
                                    }
                                }
                                if !isNotMax {
                                    taskLimit.taskLimitMng.append(TaskLimitMNG(allTaskChecked: true, limit: date, taskList: [TaskListMNG(title: task, check: false)]))
                                }

                                //taskLimit.taskLimitMng.append(TaskLimitMNG(limit: date, taskList: [ListButton(title: task, check: false)]))
                               
                            }
                        }
                        
                        dismiss() // ダイアログを閉じる
                    }

                }
            }
        }
    }
}

struct AddTasks_Previews: PreviewProvider {
    static var previews: some View {
        AddTasks()
            .environmentObject(TaskLimit())
    }
}
