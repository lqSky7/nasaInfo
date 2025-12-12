import SwiftUI

struct ContentView : View {
    let astronautInstance = Bundle.main.getDataFromBundle(filename: "ast.json")
    var body: some View{
        Text(String(astronautInstance.count))
    }
}

#Preview {
    ContentView()
}
