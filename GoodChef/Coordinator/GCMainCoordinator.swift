//
//  GCMainCoordinator.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 29/05/2023.
//

import UIKit

class GCMainCoordinator {
    
    let navigationController: UINavigationController
    let viewFactory = GCViewControllerFactory()
    
    init() {
        let homeViewController = viewFactory.homeViewController()
        navigationController = UINavigationController(rootViewController: homeViewController)
    }
}
