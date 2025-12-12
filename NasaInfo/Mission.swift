//
//  mission.swift
//  NasaInfo
//
//  Created by ca5 on 12/12/25.
//

import Foundation

struct misson : Identifiable, Codable {
    struct crewrole : Codable {
        var name: String
        var role: String
    }
    var id : Int
    var description: String
    var crew : [crewrole]
    var launchDate: String?
    
    var displayName : String { "Apollo \(id)" }
    var imageName : String { "apollo\(id)" }
}
