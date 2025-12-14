import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            // Configure date decoding or key strategies here if needed
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error)")
        }
    }
}
