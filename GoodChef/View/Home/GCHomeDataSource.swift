//
//  GCHomeDataSource.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 24/06/2023.
//

import UIKit

typealias HomeDataSource = UICollectionViewDiffableDataSource<GCHomeSection, GCHomeItem>
typealias HomeSnapshot = NSDiffableDataSourceSnapshot<GCHomeSection, GCHomeItem>

enum GCHomeSection: Int, CaseIterable {
    case featured
    case allRecipes
    case categories
    
    var sectionTitle: String {
        switch self {
        case .featured:
            return "Featured"
        case .allRecipes:
            return "All Recipes"
        case .categories:
            return "Categories"
        }
    }
}

enum GCHomeItem: Hashable {
    case featured(RecipeItem)
    case allRecipes(RecipeItem)
    case categories(CategoryItem)
}

struct RecipeItem: Hashable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageURL: String
}

struct CategoryItem: Hashable {
    let category: GCRecipeCategory
}

