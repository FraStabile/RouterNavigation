//
//  File.swift
//
//
//  Created by Francesco Stabile on 19/04/24.
//

import Foundation
import CoreLayer
import Swinject
import UIKit
import NetworkLayer
import Papyrus

@MainActor
public class HomeViewModel: BaseViewModel, ObservableObject {
    public var props: HomeProps?
    private var service: RickAndMortyRepository?
    @Published public var items: RickAndMortyChars?
    public init(props: HomeProps? = nil, service: RickAndMortyRepository) {
        self.props = props
        self.service = service
    }
    
    
    public func getAllChar() async {
        Task {
            do {
                let result = try await service?.getAllChars()
                items = result
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    public func nextTapped(item: Int) {
        _ = AnchorResolver.createURL(
            host: "detail",
            path: "stepOne",
            props: item
        )
    }
}
