import SwiftUI

struct AddTasks: View {
    @State private var limit1 = ""
    @State private var task = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var taskLimit: TaskLimit
    @State var found = false
    
    var body: some View {
        
        NavigationStack {
            List{
                Section(header: Text("期限")){
                    TextField("期限を入力してください", text: $limit1)
                        .padding()
                        .autocapitalization(.none)
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
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("完了") {
                        // Add goal only if the text fields are not empty
                        if !limit1.isEmpty && !task.isEmpty {
                            
                            for index in 0..<taskLimit.taskLimitMng.count {
                                if taskLimit.taskLimitMng[index].limit == limit1 {
                                    taskLimit.taskLimitMng[index].taskList.append(ListButton(title: task, check: false))
                                    found = true
                                }
                            }
                            if found == false{
                                taskLimit.taskLimitMng.append(TaskLimitMNG(limit: limit1, taskList: [ListButton(title: task, check: false)]))
                            }
                            
                            
                        }
                        dismiss()
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
