import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userData: UserData
    @State var showingSheet = false
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    ForEach(userData.userGoal) { task in
                        Text(task.title)
                            .bold()
                            .padding()
                            .frame(width: 370, height: 200)
                            .foregroundColor(Color.white)
                            .background(task.backgroundColor) // Use dynamic color
                            .cornerRadius(10)
                            .padding(.bottom, 10) // Adds spacing between items
                    }
                }
                
                // Floating action button (+)
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
                        .position(x: 350, y: 700)
                        .sheet(isPresented: $showingSheet, content: {
                                   SheetView()
                               })

                }
                .toolbar {
                    ToolbarItem {
                        Text("＋")
                    }
                }
            }
        }
    }
    
    // Helper function to convert backgroundColor string to SwiftUI Color
    func colorFromName(_ colorName: String) -> Color {
        switch colorName {
        case "purple":
            return Color.purple
        case "red":
            return Color.red
        case "blue":
            return Color.blue
        default:
            return Color.gray // Fallback color
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData()) // Provide a mock instance of UserData
    }
}
