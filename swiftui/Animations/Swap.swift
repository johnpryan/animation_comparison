import SwiftUI

struct Swap: View {
    @Namespace private var namespace
    @State private var isSwapped = false // State to track swap status

    var body: some View {
        VStack {
                if (!isSwapped) {
                    MyCard(color: .blue, namespace: namespace, id: "cardA") {
                        Text("Card A")
                    }
                    
                    MyCard(color: isSwapped ? .blue : .orange, namespace: namespace, id: "cardB") {
                        Text("Card B")
                    }
                } else {
                    MyCard(color: .orange, namespace: namespace, id: "cardB") {
                        Text("Card B")
                    }
                    MyCard(color: .blue, namespace: namespace, id: "cardA") {
                        Text("Card A")
                    }
                }
            
            Button(action: {
                withAnimation(.easeInOut(duration: 0.5)) {
                    isSwapped.toggle()
                }
            }, label: {
                Image(systemName: "arrow.up.arrow.down")
            })
        }
    }
}

struct MyCard<Content: View>: View {
    let color: Color
    let namespace: Namespace.ID
    let id: String
    let content: () -> Content

    var body: some View {
        content()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(color)
            .cornerRadius(20)
            .padding(8)
            .matchedGeometryEffect(id: id, in: namespace)
    }
}

#Preview {
   Swap()
}
