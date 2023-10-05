//
//  GCMainCoordinator.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 29/05/2023.
//

import UIKit

class GCMainCoordinator {
    
    let navigationController = UINavigationController()
    let viewFactory = GCViewControllerFactory()
    
    func start() {
        let homeViewController = viewFactory.homeViewController(coordinator: self)
        navigationController.pushViewController(homeViewController, animated: false)
    }
}

extension GCMainCoordinator: GCHomeViewModelCoordinator {
    func navigateToRecipeList(configuration: GCRecipeListViewModelConfiguration) {
		let recipeListViewController = viewFactory.recipeListViewController(coordinator: self, configuration: configuration)
        navigationController.pushViewController(recipeListViewController, animated: true)
    }
    
    func navigateToRecipe(configuration: GCRecipeDetailsViewModelConfiguration) {
        let recipeDetailsViewController = viewFactory.recipeDetailsViewController(configuration: configuration)
        navigationController.pushViewController(recipeDetailsViewController, animated: true)
    }
}

extension GCMainCoordinator: GCRecipeListViewModelCoordinator {
	// Already implemented by GCHomeViewModelCoordinator.
}
