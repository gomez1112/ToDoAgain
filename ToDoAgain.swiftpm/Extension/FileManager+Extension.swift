import Foundation

extension FileManager {
    static func urlFor(_ filename: String) throws -> URL {
        try Self.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(filename)
    }
    static func decode<T: Decodable>(_ type: T.Type, from filename: String) async throws -> T {
        let data = try Data(contentsOf: urlFor(filename))
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    static func encode<T: Encodable>(_ value: T, from filename: String, encodedUsing encoder: JSONEncoder = .init()) async throws {
        let data = try encoder.encode(value)
        try data.write(to: urlFor(filename))
    }
}
