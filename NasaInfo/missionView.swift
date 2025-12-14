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
        let shortId : String
        let name : String
        let role : String
    }
    
    var crewMembers : [crewStruct]
    var asIn : [String : Astronaut]
    
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
                
//                    .frame(maxWidth: .infinity, maxHeight: 45 ,alignment: .leading)
//                    .glassEffect()
//                     will see you some other day
                Text(missionInstance.description)
                    .foregroundStyle(.primary.opacity(0.7))
                    .padding()
            }


                VStack(alignment: .leading) {
                    Text("Crew and Roles")
                        .padding([.top, .horizontal])
                        .font(.title)
                        .fontWidth(.expanded)
                        
                    Divider()
                    
                    ForEach(crewMembers) {
                        k in
                        NavigationLink() {
                            astDetailView(name: k.shortId, asIn : self.asIn)
                        }
                    label:
                        {
                            VStack{
                                Label{
                                    Text("\(k.name) \(k.role)")
                                        
                                }
                                icon: {
                                Spacer()
                                Image(systemName: "chevron.right")
                                }
                                
                                .foregroundStyle(.primary.opacity(0.7))
                                .fontWidth(.condensed)
                                .padding(.horizontal)
                                .padding(.vertical, 3)
                                
                            }
                        }
                        
                    }
                }
                .padding(.bottom)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
               
                
            
        }
    }
    
    init(mi : misson, asIn : [String : Astronaut]) {
        self.asIn = asIn
        self.missionInstance = mi
        self.crewMembers = mi.crew.map {
            member in
            if let astData = asIn[member.name] {
                return crewStruct(shortId: member.name, name: astData.name, role: member.role)
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

