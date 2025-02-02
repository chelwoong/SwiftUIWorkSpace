import SwiftUI

struct NavigationExample: View {
    var body: some View {
        TabView {
            NavigationViewDemo()
                .tabItem {
                    Label("NavigationView", systemImage: "1.circle")
                }
            
            NavigationStackDemo()
                .tabItem {
                    Label("NavigationStack", systemImage: "2.circle")
                }
        }
    }
}

struct NavigationViewDemo: View {
    var body: some View {
        NavigationView {
            List(1...5, id: \.self) { item in
                NavigationLink("항목 \(item)") {
                    Text("NavigationView의 상세 화면 \(item)")
                }
            }
            .navigationTitle("NavigationView 예제")
        }
    }
}

struct NavigationStackDemo: View {
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                List(1...5, id: \.self) { item in
                    NavigationLink("항목 \(item)") {
                        Text("NavigationStack의 상세 화면 \(item)")
                    }
                }
                .navigationTitle("NavigationStack 예제")
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

#Preview {
    NavigationExample()
} 
