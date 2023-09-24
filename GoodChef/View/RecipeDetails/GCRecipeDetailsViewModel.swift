//
//  GCRecipeDetailsViewModel.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 06/09/2023.
//

import Foundation

struct GCRecipeDetailsViewModelConfiguration {
    let recipe: GCRecipe
}

protocol GCRecipeDetailsViewModelDelegate: AnyObject {
    func didRecieveRecipes()
}

class GCRecipeDetailsViewModel: NSObject {
    
    private let configuration: GCRecipeDetailsViewModelConfiguration
    weak var delegate: GCRecipeDetailsViewModelDelegate?
    
    init(configuration: GCRecipeDetailsViewModelConfiguration) {
        self.configuration = configuration
    }
    
    func loadData() {
        delegate?.didRecieveRecipes()
    }
}

// MARK: ITEMS
extension GCRecipeDetailsViewModel {
    func buildImageItems() -> [RecipeDetailsItem] {
        let imageItem = RecipeImageItem(imageURL: configuration.recipe.image)
        let item = RecipeDetailsItem.image(imageItem)
        return [item]
    }
}

