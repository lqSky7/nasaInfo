//
//  missionView.swift
//  NasaInfo
//
//  Created by ca5 on 12/12/25.
//

import SwiftUI

struct missionView: View {
    let missionInstance : misson
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
                
            }.padding(.horizontal, 3)
        }
    }
}

#Preview {
    let missions: [misson] = Bundle.main.getDataFromBundle(filename: "missions.json")

    missionView(missionInstance: missions[0])
        .preferredColorScheme(.dark)
}
