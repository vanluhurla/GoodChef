//
//  GCHomeDataSource.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 24/06/2023.
//

import UIKit

typealias HomeDataSource = UICollectionViewDiffableDataSource<GCHomeSection, GCHomeItem>
typealias HomeSnapshot = NSDiffableDataSourceSnapshot<GCHomeSection, GCHomeItem>

enum GCHomeSection: Int {
    case featured
    case categories
    
    var sectionTitle: String {
        switch self {
        case .featured:
            return "Featured"
        case .categories:
            return "Categories"
        }
    }
}

enum GCHomeItem: Hashable {
    case featured(RecipeItem)
    case categories(CategoryItem)
}

struct RecipeItem: Hashable {
    let title: String
    let subtitle: String
    let imageURL: String
}

struct CategoryItem: Hashable {
    let category: GCRecipeCategory
}

