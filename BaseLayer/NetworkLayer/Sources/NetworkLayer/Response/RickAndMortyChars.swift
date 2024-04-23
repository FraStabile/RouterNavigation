//
//  File.swift
//  
//
//  Created by Francesco Stabile on 22/04/24.
//

import Foundation
public struct RickAndMortyChars: Codable {
    public let info: Info
    public let results: [Result]
    public init(info: Info, results: [Result]) {
        self.info = info
        self.results = results
    }
    
}

// MARK: - Info
public struct Info: Codable {
    public let count, pages: Int
    public let next: String
    public init(count: Int, pages: Int, next: String) {
        self.count = count
        self.pages = pages
        self.next = next
    }
}

// MARK: - Result
public struct Result: Codable {
    public let id: Int
    public let name: String
    public let status: Status
    public let species: Species
    public let type: String
    public let gender: Gender
    public let origin, location: Location
    public let image: String
    public let episode: [String]
    public let url: String
    public let created: String
    public init(id: Int, name: String, status: Status, species: Species, type: String, gender: Gender, origin: Location, location: Location, image: String, episode: [String], url: String, created: String) {
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
}

public enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
public struct Location: Codable {
    let name: String
    let url: String
    public init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}

public enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

public enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
