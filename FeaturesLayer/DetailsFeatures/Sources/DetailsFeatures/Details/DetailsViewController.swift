//
//  File.swift
//  
//
//  Created by Francesco Stabile on 22/04/24.
//

import CoreLayer
import UIKit

class DetailsViewController: UIViewController, BaseViewController {
    var viewModel: DetailsViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubSwiftUIView(DetailsView(viewModel: viewModel!), to: self.view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)

    }
}
