//
//  missionView.swift
//  NasaInfo
//
//  Created by ca5 on 12/12/25.
//

import SwiftUI

struct missionView: View {
    let missionInstance : misson
    struct crewStruct : Identifiable {
        var id = UUID()
        let name : String
        let role : String
    }
    var crewMembers : [crewStruct]
    
    
    var body: some View {
        ScrollView{
            VStack{
                Image(missionInstance.imageName)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal){
                        width, axis in
                        return width*0.6
                    }
            }
            VStack(alignment: .leading) {
                Text("Mission Highlights")
                    .padding()
                    .font(.title)
                    .fontWidth(.expanded)
                Text(missionInstance.description)
                    .foregroundStyle(.primary.opacity(0.7))
                    .padding()
                
                Text("Crew and Roles")
                    .padding()
                    .font(.title)
                    .fontWidth(.expanded)
                ForEach(crewMembers) {
                    k in
                    Text("\(k.name)")
                        .foregroundStyle(.primary.opacity(0.7))
                        .padding()
                }
                
            }.padding(.horizontal, 3)
        }
    }
    
    init(mi : misson, asIn : [String : Astronaut]) {
        self.missionInstance = mi
        self.crewMembers = mi.crew.map {
            member in
            if let astData = asIn[member.name] {
                return crewStruct(name: astData.name, role: member.role)
            }
            else {
                fatalError("Failed to find \(member.name) in app data")
            }
        }
        
    }
}

#Preview {
    let testMissionLoader: [misson] = Bundle.main.getDataFromBundle(filename: "missions.json")
    let astr: [String : Astronaut] = Bundle.main.getDataFromBundle(filename: "ast.json")
    missionView(mi: testMissionLoader[0], asIn: astr)
        .preferredColorScheme(.dark)
}

