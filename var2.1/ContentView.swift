import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userData: UserData // 環境オブジェクトとしてUserDataを使用
    @State var showingSheet = false

    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) { // ボタンを配置するためのZStack
                ScrollView {
                    ForEach(userData.userGoal) { task in
                        NavigationLink(destination: ToDoList()) {
                            Text(task.title)
                                .bold()
                                .padding()
                                .frame(width: 370, height: 200)
                                .foregroundColor(.white)
                                .background(task.backgroundColor) // 動的な背景色
                                .cornerRadius(10)
                                .padding(.bottom, 10) // アイテム間のスペースを追加
                        }
                    }
                }

                // フローティングアクションボタン（+）
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
                    SheetView()
                        .environmentObject(UserData())
                        .environmentObject(UserTask())
                        //.environmentObject(TaskDate2())
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData()) // Provide a mock instance of UserData
            .environmentObject(UserTask())
            //.environmentObject(TaskDate2())
    }
}
