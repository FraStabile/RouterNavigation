//
//  File.swift
//  
//
//  Created by Francesco Stabile on 22/04/24.
//

import Foundation
import Papyrus
@API
@Mock
public protocol RickAndMortyRepository {
    @GET("/api/character")
    func getAllChars() async throws -> RickAndMortyChars
    
    @URLForm
    @GET("/api/character/:idChar/")
    func getCharDetail(idChar: Int) async throws -> RickAndMortyChar
}
 
