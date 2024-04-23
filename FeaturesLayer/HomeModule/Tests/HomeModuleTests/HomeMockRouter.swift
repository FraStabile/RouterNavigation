//
//  File.swift
//  
//
//  Created by Francesco Stabile on 22/04/24.
//

import Foundation
import CoreLayer
import HomeModule
class HomeMockRouter : Router {
    private var anchorResolver = AnchorResolver()
    var routes: [CoreLayer.Route] = []
    init() {
        self.routes = HomeRouter.allCases
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
