import SwiftUI

struct ContentView : View {
    let gview = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    var body: some View {
        ScrollView(.horizontal){
            LazyHGrid(rows: gview)
            {
                ForEach(0..<1000){
                    k in
                    Text("HII")
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
