//
//  File.swift
//
//
//  Created by Francesco Stabile on 22/04/24.
//

import Foundation
import CoreLayer
import NetworkLayer
import Papyrus
@MainActor
class DetailsViewModel: BaseViewModel, ObservableObject {
    var props: Int?
    var service: RickAndMortyRepository?
    
    @Published var model: RickAndMortyChar?
    required init(
        with props: Int?,
        service: RickAndMortyRepository?
    ) {
        self.props = props
        self.service = service
    }
    
    func getItem() async {
        do {
            let result = try await service?.getCharDetail(idChar: props ?? 1)
            model = result
        } catch {
            if let error = error as? PapyrusError {
                print("Error making request \(error.request): \(error.message). Response was: \(error.response)")
            }
        }
    }
    
}
