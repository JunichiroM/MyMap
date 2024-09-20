//
//  ContentView.swift
//  MyMap
//
//  Created by apple on 2024/09/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView(searchKey: "羽田空港")
        }
    }
}

#Preview {
    ContentView()
}
