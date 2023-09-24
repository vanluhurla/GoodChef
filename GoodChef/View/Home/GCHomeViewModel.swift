//
//  GCHomeViewModel.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 29/05/2023.
//

import Foundation

protocol GCHomeViewModelCoordinator: AnyObject {
    func navigateToRecipeList(configuration: GCRecipeListViewModelConfiguration)
    func navigateToRecipe(configuration: GCRecipeDetailsViewModelConfiguration)
}

protocol GCHomeViewModelDelegate: AnyObject {
    func didRecieveRecipes()
    func didRecieveErrorWithMessage(_ message: String)
}

class GCHomeViewModel: NSObject {
    
    var networkManager = GCNetworkManager()
    var recipes = [GCRecipe]()
    var orderedRecipes: [GCRecipe] {
        recipes.sorted(by: { $0.date.compare($1.date) == .orderedDescending })
    }
    
    weak var delegate: GCHomeViewModelDelegate?
    weak var coordinator: GCHomeViewModelCoordinator?
    
    init(coordinator: GCHomeViewModelCoordinator?) {
        self.coordinator = coordinator
    }
    
    func didSelectItem(indexPath: IndexPath) {
        guard let selectedSection = GCHomeSection(rawValue: indexPath.section) else {
            return
        }
        switch selectedSection {
        case .featured:
            handleSelectedFeaturedRecipe(indexPath: indexPath)
        case .allRecipes:
            handleSelectedRecipe(indexPath: indexPath)
        case .categories:
            handleSelectedCategoy(indexPath: indexPath)
        }
    }
}
    
// MARK: API
extension GCHomeViewModel {
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
}

// MARK: Recipe filters
private extension GCHomeViewModel {
    func filterRecipes(category: GCRecipeCategory) -> [GCRecipe] {
        orderedRecipes.filter({ $0.category == category.title})
    }
    
    func filterFeaturedRecipes() -> [GCRecipe] {
        orderedRecipes.filter({ $0.featured})
    }
    
    func filterAllRecipes() -> [GCRecipe] {
        orderedRecipes
    }
}
    
// MARK: Items(Hashable)
    extension GCHomeViewModel {
        func allItems() -> [GCHomeItem] {
            return buildItems(recipes: orderedRecipes, featured: false)
        }
        
        func featuredItems() -> [GCHomeItem] {
            let items = orderedRecipes.filter({$0.featured })
            return buildItems(recipes: items, featured: true)
        }
        
        func categoryItems() -> [GCHomeItem] {
            GCRecipeCategory.allCases.map { category in
                let item = CategoryItem(category: category)
                return GCHomeItem.categories(item)
            }
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
    }
    
// MARK: Actions
private extension GCHomeViewModel {
    func handleSelectedCategoy(indexPath: IndexPath) {
        guard let selectedCategory = GCRecipeCategory(rawValue: indexPath.item) else {
            return
        }
        var filteredRecipes = filterRecipes(category: selectedCategory)
        let configuration = GCRecipeListViewModelConfiguration(title: selectedCategory.title,
                                                             recipes: filteredRecipes)
        coordinator?.navigateToRecipeList(configuration: configuration)
    }
    
    func handleSelectedFeaturedRecipe(indexPath: IndexPath) {
        let filteredRecipes = filterFeaturedRecipes()
        let selectedRecipe = filteredRecipes[indexPath.row]
        let configuration = GCRecipeDetailsViewModelConfiguration(recipe: selectedRecipe)
        coordinator?.navigateToRecipe(configuration: configuration)
    }
    
    func handleSelectedRecipe(indexPath: IndexPath) {
        let filteredRecipes = filterAllRecipes()
        let selectedRecipe = filteredRecipes[indexPath.row]
        let configuration = GCRecipeDetailsViewModelConfiguration(recipe: selectedRecipe)
        coordinator?.navigateToRecipe(configuration: configuration)
        
    }
}
