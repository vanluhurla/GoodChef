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
            DispatchQueue.main.async {
                if let error {
                    self?.delegate?.didRecieveErrorWithMessage(error.description)
                } else if let recipes {
                    self?.recipes = recipes
                    self?.delegate?.didRecieveRecipes()
                }
            }
        }
    }
    
    func featuredItems() -> [GCHomeItem] {
        let items = recipes.map { recipe in
            let item = FeaturedItem(title: recipe.title, subtitle: recipe.readableDate, imageURL: recipe.image)
            return GCHomeItem.featured(item)
        }
        return items
    }
    
    func categoryItems() -> [GCHomeItem] {
        let uniqueCategories = recipes.reduce(into: Set<String>()) { result, recipe in
            result.insert(recipe.category)
        }
        let categories = Array(uniqueCategories)
        let items = categories.map { category in
            let item = CategoryItem(title: category)
            return GCHomeItem.categories(item)
        }
        return items
    }
}
