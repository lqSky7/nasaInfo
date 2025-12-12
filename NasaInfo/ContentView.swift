import SwiftUI

struct ContentView : View {
    let gview = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: gview)
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
