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
    let students  = [
        student(name: "Alice", age: 20),
        student(name: "Bob", age: 22),
        student(name: "Charlie", age: 21)
    ]
    var body: some View {
        NavigationStack {
            
            List(students, id: \._id){
                i in
                NavigationLink("Select \(i.name)", value: i)
            }
            .navigationDestination(for: student.self) {
                k in
                Text("You selected \(k._id) and the name is \(k.name) and age is \(k.age)")
            }
        }
    }
}

#Preview {
    ContentView()
}
