//
//  File.swift
//  
//
//  Created by Francesco Stabile on 19/04/24.
//

import CoreLayer
import UIKit
import NetworkLayer
import Papyrus
public enum HomeRouter : Route, CaseIterable {
    case dashboard, detail
    public var basePath: String {
        return "home"
    }
    
    public var path: String {
        switch self {
        case .dashboard:
            return "dashboard"
        case .detail:
            return "detail"
        }
    }
    
    public var presentationMode: UIModalPresentationStyle? {
        switch self {
        case .dashboard:
            return nil
        case .detail:
            return nil
        }
    }
    
    @MainActor
    public func component(params: Data?) -> UIViewController? {
        switch self {
        case .dashboard:
            let props = try! JSONDecoder().decode(HomeProps.self, from: (params!))
            let provider = DIContainer.current.container.resolve(Provider.self)
            let service = RickAndMortyRepositoryAPI(provider: provider!)
            let viewModel = HomeViewModel(service: service)
            let vc = HomeViewController()
            vc.viewModel = viewModel
            return vc
        case .detail:
            let viewController = UIViewController()
            viewController.view.backgroundColor = .blue
            return viewController
        }
    }
}
