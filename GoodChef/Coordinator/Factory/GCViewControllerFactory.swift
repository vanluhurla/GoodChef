//
//  GCViewControllerFactory.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 29/05/2023.
//

import UIKit

class GCViewControllerFactory {
    
    func homeViewController() -> UIViewController {
        let viewModel = GCHomeViewModel()
        let viewController = GCHomeViewController(viewModel: viewModel)
        return viewController
    }
}
