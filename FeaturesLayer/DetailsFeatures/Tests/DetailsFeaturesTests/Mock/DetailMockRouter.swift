//
//  File.swift
//  
//
//  Created by Francesco Stabile on 23/04/24.
//

import Foundation
import DetailsFeatures
import CoreLayer
class DetailMockRouter: Router {
    private var anchorResolver = AnchorResolver()
    var routes: [CoreLayer.Route] = []
    init() {
        self.routes = DetailRouter.allCases
    }
    
    func resolve(url: URL) -> Route? {
        if let route = anchorResolver.resolveUrl(url: url, routes: self.routes) {
            return route
        }
        return nil
    }
    
    func execute(url: URL) {
        return
    }
}
