//
//  File.swift
//  
//
//  Created by Francesco Stabile on 19/04/24.
//

import UIKit
import CoreLayer
class HomeViewController : UIViewController {
    var viewModel: HomeViewModel?
    override func viewDidLoad() {
        self.addSubSwiftUIView(HomeView(viewModel: viewModel!), to: self.view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

