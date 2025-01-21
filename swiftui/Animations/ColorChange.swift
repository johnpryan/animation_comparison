import SwiftUI

struct WithAnimationExample: View {
    @State private var isBlue = false

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(isBlue ? Color.blue : Color.red)
                .frame(width: 200, height: 200)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 3)
                )

            Spacer()

            Button("Toggle Color") {
                withAnimation {
                    isBlue.toggle()
                }
            }
        }
        .padding()
    }
}


#Preview {
    WithAnimationExample()
}
