//
//  Bundle-decodable.swift
//  NasaInfo
//
//  Created by ca5 on 12/12/25.
//

import Foundation

extension Bundle {
    func getDataFromBundle(filename : String) -> [String : Astronaut]{
        guard let url = self.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Could not load data files locally")
        }
        guard let dataFromUrl = try? Data(contentsOf: url)
        else {
            fatalError("Could not Find valid Data") // file is corrupted/0 bytes in size.
        }
        
        guard let decodedData = try? JSONDecoder().decode([String: Astronaut].self, from: dataFromUrl)
            else {
            fatalError("Could not decode data")
        }
        return decodedData
    }
}
