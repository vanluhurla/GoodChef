//
//  GCRecipeListDataSource.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 07/08/2023.
//

import UIKit

typealias GCRecipeListDataSource = UICollectionViewDiffableDataSource<GCListSection, GCListItem>


enum GCListSection: Int {
    case allRecipes
}

enum GCListItem: Hashable {
    case allRecipes(RecipeListItem)
}

struct RecipeListItem: Hashable {
    let id = UUID()
    let title: String
    let subtilt: String
    let imageURL: String
}

