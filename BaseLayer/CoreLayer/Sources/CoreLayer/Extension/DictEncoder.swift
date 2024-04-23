//
//  File.swift
//  
//
//  Created by Francesco Stabile on 22/04/24.
//

import Foundation

public class DictionaryEncoder {
    private let jsonEncoder = JSONEncoder()
    public init() {
        
    }
    
    /// Encodes given Encodable value into an array or dictionary
    public func encode<T>(_ value: T) throws -> Any where T: Encodable {
        let jsonData = try jsonEncoder.encode(value)
        return try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)
    }
}

public class DictionaryDecoder {
    private let jsonDecoder = JSONDecoder()
    
    public init() {
        
    }
    /// Decodes given Decodable type from given array or dictionary
    public func decode<T>(_ type: T.Type, from json: Any) throws -> T where T: Decodable {
        let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
        return try jsonDecoder.decode(type, from: jsonData)
        
    }
}
