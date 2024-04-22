//
//  AppRouter.swift
//  BaseProjectUIKit
//
//  Created by Francesco Stabile on 22/04/24.
//

import UIKit
import CoreLayer
import HomeModule
import DetailsFeatures
class AppRouter : Router {
    private var anchorResolver = AnchorResolver()
    private var navController: UINavigationController?
    var routes: [CoreLayer.Route] = []
    init(navController: UINavigationController?) {
        self.navController = navController
        routes = HomeRouter.allCases
        routes.append(DetailRouter.homeDetail)
    }
    
    func resolve(url: URL) -> Route? {
        if let route = anchorResolver.resolveUrl(url: url, routes: self.routes) {
            return route
        }
        return nil
    }
    
    func execute(url: URL) {
        let props = url.getProps()
        guard let route = self.resolve(url: url), let controller = route.component(params: props) else {
            return
        }
        
        if route.presentationMode != nil {
            self.navController?.present(controller, animated: true)
        } else {
            self.navController?.pushViewController(controller, animated: true)
        }
    }
}
