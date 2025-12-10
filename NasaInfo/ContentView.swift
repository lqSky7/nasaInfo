//
//  ContentView.swift
//  NasaInfo
//
//  Created by ca5 on 10/12/25.
//

import SwiftUI

struct buttonPressedView : View {
    let test :Int
    var body : some View {
        Text("The number is \(test)")
    }
    
    init(test: Int) {
        self.test = test
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack{
            NavigationLink("TAPm"){
                buttonPressedView(test: 25)
            }
        }
    }
}

#Preview {
    ContentView()
}
