import SwiftUI

struct FadeIn: View {
    @State private var widgetCount: Int = 0

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(0...widgetCount, id: \.self) { _ in
                        MyAnimatedView()
                    }
                }
                .padding()
            }
            .navigationTitle("SwiftUI Demo")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: removeWidget) {
                        Image(systemName: "minus")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addWidget) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }

    func addWidget() {
        withAnimation {
            widgetCount += 1
        }
    }
    func removeWidget() {
        withAnimation {
            widgetCount -= 1
        }
    }
}

struct MyAnimatedView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.blue)
            .aspectRatio(1, contentMode: .fill)
    }
}

#Preview {
    FadeIn()
}
