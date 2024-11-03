import SwiftUI

struct ToDoList: View {
    @State private var isExpanded: Bool = false
    //@State var check = false
    @EnvironmentObject var userTask: UserTask
    //@EnvironmentObject var taskDate2: TaskDate2
    @State var showingSheet = false
    @State var id = false
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            List{
                ForEach(userTask.listButton.indices, id: \.self) { index in
                    HStack {
                        Button {
                            // 再描画を確実に促す
                            userTask.objectWillChange.send()
                            userTask.listButton[index].check.toggle()
                        } label: {
                            Image(systemName: userTask.listButton[index].check ? "checkmark.square.fill" : "square")
                        }
                    Text(userTask.listButton[index].title)
                        .padding()
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
                //タスク追加機能追加前なので一時的に
                SheetView()
                    //.environmentObject(taskDate2)
                // 既存のtaskDate2オブジェクトを渡す
                    .environmentObject(userTask)
                // 既存のuserTaskオブジェクトを渡す
                    .environmentObject(UserData())
            }
            
        }
        
    }
}



struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList()
            .environmentObject(UserData()) // Provide a mock instance of UserData
            .environmentObject(UserTask())
            //.environmentObject(TaskDate2())
    }
}
