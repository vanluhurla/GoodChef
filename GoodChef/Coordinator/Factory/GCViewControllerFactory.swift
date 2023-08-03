//
//  GCViewControllerFactory.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 29/05/2023.
//

import UIKit

class GCViewControllerFactory {
    
    func homeViewController(coordinator: GCHomeViewModelCoordinator?) -> UIViewController {
        let viewModel = GCHomeViewModel(coordinator: coordinator)
        let viewController = GCHomeViewController(viewModel: viewModel)
        return viewController
    }
}
