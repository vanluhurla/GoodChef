//
//  GCRecipeListViewModel.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 03/08/2023.
//

import Foundation

protocol GCRecipeListViewModelCoordinator: AnyObject {
	func navigateToRecipe(configuration: GCRecipeDetailsViewModelConfiguration)
}

struct GCRecipeListViewModelConfiguration {
    let title: String
    let recipes: [GCRecipe]
}

protocol GCRecipeListViewModelDelegate: AnyObject {
    func didRecieveRecipes()
}

class GCRecipeListViewModel: NSObject {

	var orderedRecipes: [GCRecipe] {
		configuration.recipes.sorted(by: { $0.date.compare($1.date) == .orderedDescending })
	}

	weak var delegate: GCRecipeListViewModelDelegate?
	weak var coordinator: GCRecipeListViewModelCoordinator?

	private let configuration: GCRecipeListViewModelConfiguration

	var headerTitle: String {
		configuration.title
	}

	init(coordinator: GCRecipeListViewModelCoordinator, configuration: GCRecipeListViewModelConfiguration) {
		self.configuration = configuration
		self.coordinator = coordinator
	}

	func didSelectItem(indexPath: IndexPath) {
		guard let selectedSection = GCListSection(rawValue: indexPath.section) else {
			return
		}
		switch selectedSection {
		case .allRecipes:
			return handleSelectedRecipe(indexPath: indexPath)
		}
	}
}

extension GCRecipeListViewModel {
	func loadData() {
		delegate?.didRecieveRecipes()
	}
}

// MARK: Items
extension GCRecipeListViewModel {
	func allItems() -> [GCListItem] {
		return buildItems()
	}

	func buildItems() -> [GCListItem] {
		let recipe = orderedRecipes
		let items = recipe.map { recipe in
			let item = RecipeListItem(title: recipe.title, subtitle: recipe.preparationTime, imageURL: recipe.image)
			return GCListItem.allRecipes(item)
		}
		return items
	}
}


// MARK: Action
private extension GCRecipeListViewModel {
	func handleSelectedRecipe(indexPath: IndexPath) {
		let selectedRecipe = orderedRecipes[indexPath.row]
		let configuration = GCRecipeDetailsViewModelConfiguration(recipe: selectedRecipe)
		coordinator?.navigateToRecipe(configuration: configuration)
	}
}


