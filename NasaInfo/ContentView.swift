//
//  ContentView.swift
//  NasaInfo
//
//  Created by ca5 on 10/12/25.
//

import SwiftUI

@Observable
class pathSaver {
    var path : NavigationPath{
        didSet{
           save()
        }
    }
    let savedPath = URL.documentsDirectory.appending(path: "PATHKEY")
    init(){
        if let data = try? Data(contentsOf: savedPath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data){
                path = NavigationPath(decoded)
                return
            }
        }
        path = NavigationPath()
    }
    
    func save(){
        guard let representedData = path.codable else { return }
        do {
            let data = try JSONEncoder().encode(representedData)
            try data.write(to: savedPath)
        } catch {
            print("FAILED")
        }
    }
}

struct student : Hashable, Decodable {
    var _id = UUID()
    let name : String
    let age  : Int8
}

struct ContentView: View {
    let students  = [
        student(name: "Alice", age: 20),
        student(name: "Bob", age: 22),
        student(name: "Charlie", age: 21)
    ]
    
    @State var pathStore = pathSaver()
    
    var body: some View {
        NavigationStack(path: $pathStore.path){
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
                Button ("number append button"){
                    pathStore.path.append(55)
                }
                
                Button("GO back to home") {
                    pathStore.path = NavigationPath()
                }
                    .navigationTitle("SIDE SCREEN 1")
            }
            .navigationDestination(for: student.self) { stu in
                Button ("Append button"){
                    pathStore.path.append(student(name: "nigs", age: 12))
                }
                Button ("BACK to home button"){
                    pathStore.path = NavigationPath()
                }
                Text("student details: \(stu.name), \(stu._id)")
            }
            
        }
    }
    
}

#Preview {
    ContentView()
}
