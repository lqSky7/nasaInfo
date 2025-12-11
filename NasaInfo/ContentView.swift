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
        NavigationStack{
            List {
                ForEach(students, id: \._id){
                    i in
                    NavigationLink("Enter \(i.name) detail", value: i)
                }
                
                ForEach(0..<5){
                    k in
                    NavigationLink("View number \(k) details", value: k)
                }
            }
            .navigationTitle("MAIN SCREEN")
            .navigationDestination(for: Int.self) { l in
                    Text("Hello \(l)")
                    .navigationTitle("SIDE SCREEN 1")
            }
            .navigationDestination(for: student.self) { stu in
                Text("student details: \(stu.name), \(stu._id)")
            }
            
        }
    }
    
}

#Preview {
    ContentView()
}
