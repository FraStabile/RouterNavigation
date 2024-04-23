//
//  File.swift
//
//
//  Created by Francesco Stabile on 22/04/24.
//

import UIKit

public protocol Route {
    var basePath: String { get }
    var path: String { get }
    var presentationMode: UIModalPresentationStyle? { get }
    func component(params: Data?) -> UIViewController?
}

