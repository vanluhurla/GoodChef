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
    
	func recipeListViewController(coordinator: GCRecipeListViewModelCoordinator, configuration: GCRecipeListViewModelConfiguration) -> UIViewController {
		let viewModel = GCRecipeListViewModel(coordinator: coordinator, configuration: configuration)
        let viewController = GCRecipeListViewController(viewModel: viewModel)
        return viewController
    }
    
    func recipeDetailsViewController(configuration: GCRecipeDetailsViewModelConfiguration) -> UIViewController {
        let viewModel = GCRecipeDetailsViewModel(configuration: configuration)
        let viewController = GCRecipeDetailsViewController(viewModel: viewModel)
        return viewController
    }
}


