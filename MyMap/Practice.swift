//
//  Practice.swift
//  MyMap
//
//  Created by apple on 2024/09/20.
//

import SwiftUI

//struct Practice: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
enum Fruits{
    case apple
    case orange
    case banana
}

struct Practice: View {
    @State private var counter: Int = 0  // Declare a state variable
    
    var body: some View {
        
        let myLikes1: Fruits = Fruits.apple
        let myLikes2: Fruits = .orange
        
//        return print(myLikes1)
//        return print(myLikes2)
        
        VStack {
            Text("Counter: \(counter)")
                .padding()

            Button(action: {
                counter += 1   // Update the state
            }) {
                Text("Increment")
            }
        }
    }
}

#Preview {
    Practice()
}
