//
//  astDetailView.swift
//  NasaInfo
//
//  Created by ca5 on 14/12/25.
//

import SwiftUI

struct astDetailView: View {
    let astronautName : String
//    let asIn : [String:Astronaut] // this doesn't really need to be stored tbf
    
    struct astDescAndImageNameStructure : Identifiable{
        var id = UUID()
        var imageName : String
        var description : String
    }
    var astDescAndImageNameObject : astDescAndImageNameStructure
    
    
    
    
    
    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading){
                Image(astDescAndImageNameObject.imageName)
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea(edges: .top)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .padding(.bottom)
                Text("CodeName \(astronautName)")
                    .padding()
                    .font(.title)
                    .fontWidth(.expanded)
                Text(astDescAndImageNameObject.description)
                    .foregroundStyle(.primary.opacity(0.7))
                    .padding(.horizontal)
                    .padding(.vertical, 3)
            }
            
        }
    }
    
    
    
    
    
    
    
    
    init(name: String, asIn: [String : Astronaut]){
        astronautName = name
        if let requiredAstronaut = asIn[astronautName] {
            astDescAndImageNameObject = astDescAndImageNameStructure(imageName: requiredAstronaut.id, description: requiredAstronaut.description)
        } else {
            fatalError("\(astronautName) named ast not found in appdata")
        }
        
    }
}

#Preview {
    let checki : [String: Astronaut] = Bundle.main.getDataFromBundle(filename: "ast.json")
    astDetailView(name: "duke", asIn: checki)
}
