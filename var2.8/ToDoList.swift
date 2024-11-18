import SwiftUI

struct ToDoList: View {
    @State private var isExpanded: Bool = false
    @EnvironmentObject var userTask: UserTask
    @EnvironmentObject var taskLimit: TaskLimit
    @State var showingSheet = false
    @State var hiddenButton = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            List {
                HStack {
                    Button(action: {
                        DispatchQueue.main.async {
                            hiddenButton.toggle() // 非表示モードの切り替え
                          
                        }
                    }) {
                        Text(hiddenButton ? "表示" : "非表示") // ボタンテキストの変更
                            .foregroundColor(.blue)
                            .padding()
                            
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 1)
                    )
                    .buttonStyle(.plain)
                    
                    Spacer()
                    Button(action: {
                        DispatchQueue.main.async {
                            deleteCheckedTasks()
                  
                        }
                    }) {
                        Text("削除")
                            .foregroundColor(.red)
                            .padding()
                            
                            
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.red, lineWidth: 1)
                    )
                    .buttonStyle(.plain)
                    
                }
                
                displayTaskList(hidden: hiddenButton)
            }
            
            Button(action: {
                showingSheet = true
            }) {
                Text("+")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .clipShape(Circle())
                    .padding()
            }
            .sheet(isPresented: $showingSheet) {
                AddTasks()
                    .environmentObject(userTask)
            }
        }
    }
    
    func deleteCheckedTasks() {
        // 各セクション内のチェック済みタスクを削除
        for (sectionIndex, _) in taskLimit.taskLimitMng.enumerated() {
            taskLimit.taskLimitMng[sectionIndex].taskList.removeAll { $0.check }
        }
        for index in taskLimit.taskLimitMng.indices.reversed() {
            if taskLimit.taskLimitMng[index].taskList.isEmpty {
                taskLimit.taskLimitMng.remove(at: index)
            }
        }

    }
    
    func displayTaskList(hidden: Bool) -> some View {
        ForEach(taskLimit.taskLimitMng.indices, id: \.self) { index in
            // taskLimit.taskLimitMng[index]を直接使用
            if hidden == true {
                if(taskLimit.taskLimitMng[index].allTaskChecked){
                    Section(header: Text(formatDate(taskLimit.taskLimitMng[index].limit))) {
                    ForEach(taskLimit.taskLimitMng[index].taskList.indices, id: \.self) { taskIndex in
                        
                        
                        // hidden が true の場合はチェックが外れたタスクのみ表示
                            if !hidden || !taskLimit.taskLimitMng[index].taskList[taskIndex].check {
                                HStack {
                                    Button(action: {
                                    // チェック状態をトグル
                                        taskLimit.taskLimitMng[index].taskList[taskIndex].check.toggle()
                                        //仮
                                        taskLimit.taskLimitMng[index].allTaskChecked = false
                                        for checkIndex in 0..<taskLimit.taskLimitMng[index].taskList.count {
                                            if(taskLimit.taskLimitMng[index].taskList[checkIndex].check == false){
                                                taskLimit.taskLimitMng[index].allTaskChecked = true
                                                break
                                            }
                                        }

                                    
                                    }) {
                                        Image(systemName: taskLimit.taskLimitMng[index].taskList[taskIndex].check ? "checkmark.square.fill" : "square")
                                            .frame(width: 20, height: 20)
                                            .buttonStyle(MinimalButtonStyle())
                                            .foregroundColor(.blue)
                                            
                                    }
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                                    .buttonStyle(.plain)
                                    
                           
                                    
                                    TextField(taskLimit.taskLimitMng[index].taskList[taskIndex].title, text:$taskLimit.taskLimitMng[index].taskList[taskIndex].title)
                                    .padding()
                                    
                                    Spacer()
                                    
                                    Button {
                                        print("あ")
                                    } label: {
                                        Label("", systemImage: "ellipsis.circle.fill")// 修正: 正しいシステムイメージ名
                                            .buttonStyle(MinimalButtonStyle())
                                            .bold()
                                            .padding()
                                            .frame(width: 35, height: 35)
                                            .foregroundColor(.blue)
                                    }
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                                    .buttonStyle(.plain)
                                }
                            }
                        }
                    }
                }
            } else {
                Section(header: Text(formatDate(taskLimit.taskLimitMng[index].limit))) {
                    ForEach(taskLimit.taskLimitMng[index].taskList.indices, id: \.self) { taskIndex in
                        if !hidden || !taskLimit.taskLimitMng[index].taskList[taskIndex].check {
                            HStack {
                                Button(action: {
                                    // チェック状態をトグル
                                    taskLimit.taskLimitMng[index].taskList[taskIndex].check.toggle()
                                    //仮
                                    taskLimit.taskLimitMng[index].allTaskChecked = false
                                    for checkIndex in 0..<taskLimit.taskLimitMng[index].taskList.count {
                                        if(taskLimit.taskLimitMng[index].taskList[checkIndex].check == false){
                                            taskLimit.taskLimitMng[index].allTaskChecked = true
                                            break
                                        }
                                    }
                                }) {
                                    Image(systemName: taskLimit.taskLimitMng[index].taskList[taskIndex].check ? "checkmark.square.fill" : "square")
                                        .frame(width: 20, height: 20)
                                        .buttonStyle(MinimalButtonStyle())
                                        .foregroundColor(.blue)
                                        
                                }
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.white, lineWidth: 1)
                                )
                                .buttonStyle(.plain)
                                TextField(taskLimit.taskLimitMng[index].taskList[taskIndex].title, text:$taskLimit.taskLimitMng[index].taskList[taskIndex].title)
                                    .padding()
                                
                                Spacer()
                                
                                Button {
                                    print("あ")
                                } label: {
                                    Label("", systemImage: "ellipsis.circle.fill") // 修正: 正しいシステムイメージ名
                                        .buttonStyle(MinimalButtonStyle())
                                        .bold()
                                        .padding()
                                        .frame(width: 35, height: 35)
                                        .foregroundColor(.blue)
                                }
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.white, lineWidth: 1)
                                )
                                .buttonStyle(.plain)
                            }
                        }
                    }
                }
            }
        }
    }
    func taskDisplay(index: Int, hidden: Bool){
        ForEach(taskLimit.taskLimitMng[index].taskList.indices, id: \.self) { taskIndex in
            if !hidden || !taskLimit.taskLimitMng[index].taskList[taskIndex].check {
                HStack {
                    Button(action: {
                        // チェック状態をトグル
                        taskLimit.taskLimitMng[index].taskList[taskIndex].check.toggle()
                        //仮
                        taskLimit.taskLimitMng[index].allTaskChecked = false
                        for checkIndex in 0..<taskLimit.taskLimitMng[index].taskList.count {
                            if(taskLimit.taskLimitMng[index].taskList[checkIndex].check == false){
                                taskLimit.taskLimitMng[index].allTaskChecked = true
                                break
                            }
                        }
                    }) {
                        Image(systemName: taskLimit.taskLimitMng[index].taskList[taskIndex].check ? "checkmark.square.fill" : "square")
                            //.frame(width: 20, height: 20)
                            
                    }
                    TextField(taskLimit.taskLimitMng[index].taskList[taskIndex].title, text:$taskLimit.taskLimitMng[index].taskList[taskIndex].title)
                        .padding()
                }
            }
        }
    }
    
    
    func formatDate(_ date: Date?) -> String {
        guard let date = date else { return "No Date" }
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        formatter.dateFormat = "yyyy-M-d(EEEEE)"
        return formatter.string(from: date)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList()
            .environmentObject(UserData())
            .environmentObject(UserTask())
            .environmentObject(TaskLimit())
    }
}
