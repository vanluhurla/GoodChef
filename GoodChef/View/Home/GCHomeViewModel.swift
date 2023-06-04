//
//  GCHomeViewModel.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 29/05/2023.
//

import Foundation

protocol GCHomeViewModelDelegate: AnyObject {
    func didRecieveRecipes()
    func didRecieveErrorWithMessage(_ message: String)
}

class GCHomeViewModel: NSObject {
    
    var networkManager = GCNetworkManager()
    var recipes = [GCRecipe]()
    
    var delegate: GCHomeViewModelDelegate?
    
    func loadData() {
        networkManager.getRecipeList { [weak self] recipes, error in
            if let error {
                self?.delegate?.didRecieveErrorWithMessage(error.description)
            } else if let recipes {
                self?.recipes = recipes
                self?.delegate?.didRecieveRecipes()
            }
        }
    }
}
