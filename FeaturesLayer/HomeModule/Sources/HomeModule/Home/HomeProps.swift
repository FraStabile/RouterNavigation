//
//  File.swift
//  
//
//  Created by Francesco Stabile on 22/04/24.
//

import Foundation
import CoreLayer
public struct HomeProps: Props,Codable {
    var name: String?
    public init(name: String? = nil) {
        self.name = name
    }
}
