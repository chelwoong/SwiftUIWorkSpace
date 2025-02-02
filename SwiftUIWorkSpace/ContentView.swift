//
//  ContentView.swift
//  SwiftUIWorkSpace
//
//  Created by woongs on 11/21/24.
//

import SwiftUI

struct ExampleItem: Identifiable {
    let id = UUID()
    let title: String
    let destination: AnyView
}

struct ContentView: View {
    
    let examples: [ExampleItem] = [
        ExampleItem(
            title: "PreferenceKey 예제",
            destination: AnyView(PreferenceKeyExample())
        ),
        ExampleItem(
            title: "Navigation 비교 예제",
            destination: AnyView(NavigationExample())
        )
    ]
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                List(examples) { example in
                    NavigationLink(example.title) {
                        example.destination
                    }
                }
                .navigationTitle("SwiftUI 워크북")
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

#Preview {
    ContentView()
}
