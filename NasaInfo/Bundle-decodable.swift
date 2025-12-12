//
//  Bundle-decodable.swift
//  NasaInfo
//
//  Created by ca5 on 12/12/25.
//

import Foundation

extension Bundle {
    func getDataFromBundle<T:Decodable>(filename : String) -> T{
        guard let url = self.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Could not load data files locally")
        }
        guard let dataFromUrl = try? Data(contentsOf: url)
        else {
            fatalError("Could not Find valid Data") // file is corrupted/0 bytes in size.
        }
        let customDecoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        customDecoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let decodedData = try? customDecoder.decode(T.self, from: dataFromUrl)
            else {
            fatalError("Could not decode data")
        }
        return decodedData
    }
}
