//
//  File.swift
//  
//
//  Created by Francesco Stabile on 22/04/24.
//

import Foundation
import UIKit

public class AnchorResolver {
    public init() {
        
    }
    
    public func resolveUrl(url: URL, routes: [Route]) -> Route? {
        let router = routes.first { route in
            if url.host?.lowercased() == route.basePath.lowercased() {
                return url.path.lowercased().replacingOccurrences(of: "/", with: "") == route.path.lowercased()
            }
            return false
        }
        return router
    }
    
    public static func createURL(host: String, path: String, props: Codable?, open: Bool = true) -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = DIContainer.current.container.resolve(String.self, name: "AppName")
        urlComponents.host = host
        urlComponents.path = "/" + path
        
        if let props = props {
            let encoder = JSONEncoder()
            guard let propsData = try? encoder.encode(props),
                  let propsString = String(data: propsData, encoding: .utf8) else {
                fatalError("Failed to encode properties")
            }
            urlComponents.queryItems = [URLQueryItem(name: "props", value: propsString)]
        }
        
        guard let url = urlComponents.url else {
            fatalError("Failed to construct URL")
        }
        if open {
            UIApplication.shared.open(url)
        }
        return url
    }
}
