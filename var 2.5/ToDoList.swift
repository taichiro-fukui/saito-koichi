import SwiftUI

struct ToDoList: View {
    @State private var isExpanded: Bool = false
    //@State var check = false
    @EnvironmentObject var userTask: UserTask
    //@EnvironmentObject var taskDate2: TaskDate2
    @EnvironmentObject var taskLimit: TaskLimit
    @State var showingSheet = false
    @State var id = false
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                List{
                    ForEach(taskLimit.taskLimitMng.indices, id: \.self) { index in
                        Section(header: Text(taskLimit.taskLimitMng[index].limit)) {
                            let tasks = taskLimit.taskLimitMng[index]

                            ForEach(tasks.taskList.indices, id: \.self) { taskIndex in
                                HStack {
                                    Button {
                                        // データを直接更新
                                        taskLimit.taskLimitMng[index].taskList[taskIndex].check.toggle()
                                    } label: {
                                        Image(systemName: taskLimit.taskLimitMng[index].taskList[taskIndex].check ? "checkmark.square.fill" : "square")
                                    }
                                    Text(taskLimit.taskLimitMng[index].taskList[taskIndex].title)
                                        .padding()
                                }
                            }
                        }
                    }

                }
                Button(action: {
                    showingSheet = true
                }) {
                    Text("+")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color.white)
                        .background(Color.green)
                        .clipShape(Circle())
                        .padding() // Add padding to position the button
                }
                .sheet(isPresented: $showingSheet) {
                    //タスク追加機能実装前なので一時的に
                   AddTasks()
                        //.environmentObject(taskDate2)
                    // 既存のtaskDate2オブジェクトを渡す
                        .environmentObject(userTask)
                    // 既存のuserTaskオブジェクトを渡す
                        .environmentObject(UserData())
                }
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        Text("消去")
                    }
                }
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Text("非表示")
                    }
                }
            }
        }
        
    }
}



struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList()
            .environmentObject(UserData()) // Provide a mock instance of UserData
            .environmentObject(UserTask())
            .environmentObject(TaskLimit())
    }
}
