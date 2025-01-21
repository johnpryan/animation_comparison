import SwiftUI

struct ScaleEffect: View {
    @State private var scale = 1.0

    var body: some View {
        Button("Press here") {
            scale += 1
        }
        .scaleEffect(scale)
        .animation(.easeIn(duration: 0.5), value: scale)
    }
}

#Preview {
  ScaleEffect()
}

