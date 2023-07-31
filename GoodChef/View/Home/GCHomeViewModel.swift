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
        let items = recipes.filter({$0.featured })
        return buildItems(recipes: items, featured: true)
    }
    
    func allItems() -> [GCHomeItem] {
        return buildItems(recipes: recipes, featured: false)
    }
    
    func buildItems(recipes: [GCRecipe], featured: Bool) -> [GCHomeItem] {
        let orderedRecipes = recipes.sorted(by: { $0.date.compare($1.date) == .orderedDescending })
        let items = orderedRecipes.map { recipe in
            let item = RecipeItem(title: recipe.title, subtitle: recipe.preparationTime, imageURL: recipe.image)
            if featured {
                return GCHomeItem.featured(item)
            } else {
                return GCHomeItem.allRecipes(item)
            }
        }
        return items
    }
    
    func categoryItems() -> [GCHomeItem] {
        GCRecipeCategory.allCases.map { category in
            let item = CategoryItem(category: category)
            return GCHomeItem.categories(item)
        }
    }
}
