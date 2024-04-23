//
//  File.swift
//  
//
//  Created by Francesco Stabile on 22/04/24.
//

import CoreLayer
import UIKit
import NetworkLayer
import Papyrus
public enum DetailRouter: Route, CaseIterable {
    case homeDetail
    public var basePath: String {
        "detail"
    }
    
    public var path: String {
        switch self {
        case .homeDetail:
            return "stepOne"
        }
    }
    
    
    public var presentationMode: UIModalPresentationStyle? {
        return nil
    }
    
    @MainActor public func component(params: Data?) -> UIViewController? {
        let provider = DIContainer.current.container.resolve(Provider.self)
        switch self {
        case .homeDetail:
            guard let stringPar = String(data: params!, encoding: .utf8), let params = Int(stringPar) else {
                 return nil
            }
            let service = RickAndMortyRepositoryAPI(provider: provider!)
            let viewModel = DetailsViewModel(with: params, service: service)
            let viewController = DetailsViewController()
            viewController.navigationController?.setNavigationBarHidden(false, animated: true)
            viewController.viewModel = viewModel
            return viewController
        }
    }
}
