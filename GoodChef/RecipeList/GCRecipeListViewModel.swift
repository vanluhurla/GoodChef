//
//  GCRecipeListViewModel.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 03/08/2023.
//

import Foundation

struct GCRecipeListViewModelConfiguration {
    let title: String
    let recipes: [GCRecipe]
}

protocol GCRecipeListViewModelDelegate: AnyObject {
    func didRecieveRecipes()
}

class GCRecipeListViewModel: NSObject {
    
    weak var delegate: GCRecipeListViewModelDelegate?
    
    private let configuration: GCRecipeListViewModelConfiguration
    
    init(configuration: GCRecipeListViewModelConfiguration) {
        self.configuration = configuration
    }
    
    func loadData() {
        delegate?.didRecieveRecipes()
    }
    
    func buildItems() -> [GCListItem] {
        let recipe = configuration.recipes
        let items = recipe.map { recipe in
            let item = RecipeListItem(title: recipe.title, subtitle: recipe.preparationTime, imageURL: recipe.image)
            return GCListItem.allRecipes(item)
        }
        return items
    }
}


