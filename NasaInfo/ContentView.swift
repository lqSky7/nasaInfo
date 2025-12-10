//
//  ContentView.swift
//  NasaInfo
//
//  Created by ca5 on 10/12/25.
//

import SwiftUI

struct student : Hashable {
    let _id = UUID()
    let name : String
    let age  : Int8
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            
            List(0..<100){
                i in
                NavigationLink("Press \(i)", value: i)
            }
            .navigationDestination(for: Int.self) {
                k in
                Text("You selected \(k)")
            }
        }
    }
}

#Preview {
    ContentView()
}
