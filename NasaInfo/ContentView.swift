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
                                missionView(mi: mission, asIn: astronautInstance)
                            }
                            label: {
                                VStack{
                                    Image(mission.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding()
                                VStack{
                                    Text(mission.displayName)
                                        .foregroundStyle(Color.primary.opacity(0.8))
                                        .font(.headline)
                                    Text(mission.formattedLaunchDate)
                                        .foregroundStyle(Color.primary.opacity(0.5))
                                        
                                        
                                }
                                
                            }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 29)
                                        .stroke(Color.primary.opacity(0.4), lineWidth: 0.9)
                                )
                        }
                    }
                }.padding([.horizontal, .bottom])
            }
            .navigationTitle("MoonShot")
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
