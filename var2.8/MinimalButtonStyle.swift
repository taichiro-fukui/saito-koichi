import SwiftUI

struct MinimalButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(configuration.isPressed ? Color.gray.opacity(0.2) : Color.clear)
            .cornerRadius(8)
    }
}
