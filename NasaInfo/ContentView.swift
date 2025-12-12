import SwiftUI

struct ContentView : View {
    let astronautInstance : [String : Astronaut] = Bundle.main.getDataFromBundle(filename: "ast.json")
    let missonInstance : [misson] = Bundle.main.getDataFromBundle(filename: "missions.json")
    let cols = [
        GridItem(.adaptive(minimum: 150))
    ]
    
var body: some View{
        NavigationStack{
            ScrollView {
                LazyVGrid(columns:cols) {
                        ForEach(missonInstance) {
                            mission in
                            NavigationLink {
                                Text(mission.description)
                            }
                            label: {
                                VStack{
                                    Image(mission.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                VStack{
                                    Text(mission.displayName)
                                        .foregroundStyle(.primary)
                                        .font(.headline)
                                        
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("MoonShot")
        }
    }
}

#Preview {
    ContentView()
}
