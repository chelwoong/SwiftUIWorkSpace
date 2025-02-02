//
//  PreferenceKey.swift
//  SwiftUIWorkSpace
//
//  Created by woongs on 11/24/24.
//

import SwiftUI

struct PreferenceKeyExample: View {
    @State private var red = 0
    @State private var orange = 0
    @State private var yellow = 0
    @State private var green = 0
    
    var body: some View {
        VStack {
            Text("Red \(red)")
                .preference(key: MyPreferenceKey.self, value: 100)
            VStack {
                Text("Orange \(orange)")
                VStack {
                    Text("Yellow \(yellow)")
                    VStack {
                        Text("Green \(green)")
                    }
                    .padding()
                    .background(Color.green)
                    .preference(key: MyPreferenceKey.self, value: 10)
                    .onPreferenceChange(MyPreferenceKey.self) { value in
                        self.green = value
                    }
                }
                .padding()
                .background(Color.yellow)
                .onPreferenceChange(MyPreferenceKey.self) { value in
                    self.yellow = value
                }
            }
            .padding()
            .background(Color.orange)
            .preference(key: MyPreferenceKey.self, value: 30)
            .onPreferenceChange(MyPreferenceKey.self) { value in
                self.orange = value
            }
        }
        .padding()
        .background(Color.red)
        .onPreferenceChange(MyPreferenceKey.self) { value in
            self.red = value
        }
    }
}

struct MyPreferenceKey: PreferenceKey {
    
    static var defaultValue: Int = 0
    
    static func reduce(value: inout Int, nextValue: () -> Int) {
        value += nextValue()
    }
}

#Preview {
    PreferenceKeyExample()
}
