// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let rickAndMortyChar = try? JSONDecoder().decode(RickAndMortyChar.self, from: jsonData)

import Foundation

// MARK: - RickAndMortyChar
public struct RickAndMortyChar: Codable {
    public let id: Int
    public let name, status, species, type: String
    public let gender: String
    public let origin, location: Location
    public let image: String
    public let episode: [String]
    public let url: String
    public let created: String

    public init(id: Int, name: String, status: String, species: String, type: String, gender: String, origin: Location, location: Location, image: String, episode: [String], url: String, created: String) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
    
    // MARK: - Location
    public struct Location: Codable {
        public let name: String
        public let url: String

        public init(name: String, url: String) {
            self.name = name
            self.url = url
        }
    }
}


