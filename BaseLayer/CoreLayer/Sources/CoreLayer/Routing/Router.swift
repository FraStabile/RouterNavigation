//
//  File.swift
//  
//
//  Created by Francesco Stabile on 22/04/24.
//

import UIKit

public protocol Router {
    var routes: [Route] { get set }
    
    func resolve(
        url: URL
    ) -> Route?
    
    func execute(url: URL)
}
