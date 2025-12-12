import SwiftUI

struct ContentView : View {
    let astronautInstance : [String : Astronaut] = Bundle.main.getDataFromBundle(filename: "ast.json")
    let missonInstance : [misson] = Bundle.main.getDataFromBundle(filename: "missions.json")
    var body: some View{
        Text(String(astronautInstance.count))
        Text(String(missonInstance.count))
    }
}

#Preview {
    ContentView()
}
