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
        Image(astDescAndImageNameObject.imageName)
        Text(astDescAndImageNameObject.description)
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
