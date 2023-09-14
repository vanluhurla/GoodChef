//
//  GCRecipeDetailsDataSource.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 14/09/2023.
//

import UIKit

typealias GCRecipeDetailsDataSource = UICollectionViewDiffableDataSource<GCListSection, GCListItem>
typealias GCRecipeDetailsSnapshot = NSDiffableDataSourceSnapshot<GCListSection, GCListItem>

enum RecipeDetailsSection: Int {
    case image
    case ingredient
    case instruction
}

enum RecipeDetailsItem: Hashable {
    case image(RecipeImageItem)
    case ingredient(RecipeIngredientItem)
    case instruction(RecipeInstructionItem)
}

struct RecipeImageItem: Hashable {
    let image: String
}

struct RecipeIngredientItem: Hashable {
    let ingredient: String
}

struct RecipeInstructionItem: Hashable {
    let instruction: String
}
