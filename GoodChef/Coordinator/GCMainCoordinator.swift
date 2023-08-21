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
        let recipeListViewController = viewFactory.recipeListViewController(configuration: configuration)
        navigationController.pushViewController(recipeListViewController, animated: true)
    }
}
