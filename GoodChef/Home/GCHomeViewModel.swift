//
//  GCHomeViewModel.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 29/05/2023.
//

import Foundation

protocol GCHomeViewModelCoordinator: AnyObject {
    func navigateToRecipeList(configuration: GCRecipeListViewModelConfiguration)
}

protocol GCHomeViewModelDelegate: AnyObject {
    func didRecieveRecipes()
    func didRecieveErrorWithMessage(_ message: String)
}

class GCHomeViewModel: NSObject {
    
    var networkManager = GCNetworkManager()
    var recipes = [GCRecipe]()
    
    weak var delegate: GCHomeViewModelDelegate?
    weak var coordinator: GCHomeViewModelCoordinator?
    
    init(coordinator: GCHomeViewModelCoordinator?) {
        self.coordinator = coordinator
    }
    
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
    
    func didSelectItem(indexPath: IndexPath) {
        guard let selectedSection = GCHomeSection(rawValue: indexPath.section) else {
            return
        }
        switch selectedSection {
        case .featured:
            print("Featured recipe selected")
        case .allRecipes:
            print("All recipes selected")
        case .categories:
            handleSelectedCategoy(indexPath: indexPath)
        }
    }
}

private extension GCHomeViewModel {
    func handleSelectedCategoy(indexPath: IndexPath) {
        guard let selectedCategory = GCRecipeCategory(rawValue: indexPath.item) else {
            return
        }
        print(selectedCategory.title)
        // Catergory selection
        // Filter recipes based on category selected
        let configuration = GCRecipeListViewModelConfiguration(title: selectedCategory.title,
                                                             recipes: []) // filtered recipes
        coordinator?.navigateToRecipeList(configuration: configuration)
    }
}
