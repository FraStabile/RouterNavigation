//
//  HomeViewModelTest.swift
//
//
//  Created by Francesco Stabile on 23/04/24.
//

import XCTest
import HomeModule
import NetworkLayer
import Combine
final class HomeViewModelTest: XCTestCase {
    var viewModel: HomeViewModel?
    var service: RickAndMortyRepositoryMock?
    private var cancelables = Set<AnyCancellable>()
    @MainActor override func setUpWithError() throws {
        service = RickAndMortyRepositoryMock()
        
        viewModel = HomeViewModel(service: service!)
    }
    
    @MainActor func test_call_get_chars() async throws {
        service?.mockGetAllChars {
            RickAndMortyChars(info: Info(count: 1, pages: 10, next: ""), results: [Result(id: 1, name: "Bho", status: .alive, species: Species(rawValue: "") ?? .alien, type: "", gender: Gender(rawValue: "") ?? .male, origin: Location(name: "", url: ""), location: Location(name: "", url: ""), image: "", episode: [], url: "", created: "")])
        }
        viewModel?.$items
            .dropFirst()
            .sink {
                XCTAssertNotNil($0)
                XCTAssertEqual($0?.info.count, 1)
                XCTAssertEqual($0?.info.count, 10)
            }
            .store(in: &cancelables)
        
        await viewModel?.getAllChar()
    }
}
