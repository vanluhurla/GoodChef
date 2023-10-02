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

	var headerTitle: String {
		configuration.recipe.title
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

	func buildIngredientItems() -> [RecipeDetailsItem] {
		let ingredients = configuration.recipe.ingredients
		let items = ingredients.map { ingredient in
			let ingredientItem = RecipeIngredientItem(ingredient: ingredient)
			let item = RecipeDetailsItem.ingredient(ingredientItem)
			return item
		}
		return items
	}

	func buildInstructionItems() -> [RecipeDetailsItem] {
		let instructions = configuration.recipe.instructions
		let items = instructions.map { instruction in
			let instructionItem = RecipeInstructionItem(instruction: instruction)
			let item = RecipeDetailsItem.instruction(instructionItem)
			return item
		}
		return items
	}
}

