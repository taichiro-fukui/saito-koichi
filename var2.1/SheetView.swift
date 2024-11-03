import SwiftUI

struct SheetView: View {
    @State private var goal = ""
    @State private var color = ""
    @EnvironmentObject var userData: UserData
    @Environment(\.dismiss) var dismiss
    @State private var bgColor =
                Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("目標")) {
                    TextField("目標を入力してください", text: $goal)
                        .autocapitalization(.none)
                }
                .padding()
                
                Section(header: Text("色を選ぶ")) {
                    ColorPicker("色を選ぶ", selection: $bgColor)
                }
                .padding()
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
                        if !goal.isEmpty {
                            userData.userGoal.append(UserGoal(title: goal, backgroundColor: bgColor))
                        }
                        dismiss()
                    }
                }
            }
        }
    }
}
struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}


