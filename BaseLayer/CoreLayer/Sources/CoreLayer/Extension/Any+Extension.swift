//
//  File.swift
//
//
//  Created by Francesco Stabile on 23/04/24.
//

import Foundation
public class Utils {
    
    public init() { }
    public func toData(data: Any?) -> Data? {
        do {
            let data = try JSONSerialization.data(withJSONObject: data as Any, options: [])
            return data
        }
        catch {
            print(error)
            return nil
        }
    }
    
    func dataFromQueryItem(name: String, value: String?) -> Data? {
        // Creazione di un dizionario contenente il nome e il valore del query item
        var queryDictionary = [String: String]()
        queryDictionary[name] = value ?? ""

        // Conversione del dizionario in un Data
        guard let data = try? JSONSerialization.data(withJSONObject: queryDictionary, options: []) else {
            print("Errore durante la conversione del query item in data.")
            return nil
        }

        return data
    }
    
    public func dataFromQueryItem(_ queryItem: NSURLQueryItem) -> Data? {
        // Creazione di un dizionario contenente i valori di queryItem
        var queryDictionary = [String: String]()
        queryDictionary[queryItem.name] = queryItem.value ?? ""

        // Conversione del dizionario in un Data
        guard let data = try? JSONSerialization.data(withJSONObject: queryDictionary, options: []) else {
            print("Errore durante la conversione del query item in data.")
            return nil
        }

        return data
    }
}
