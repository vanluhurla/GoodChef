//
//  GCRecipeDetailsDataSource.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 14/09/2023.
//

import UIKit

typealias GCRecipeDetailsDataSource = UICollectionViewDiffableDataSource<RecipeDetailsSection, RecipeDetailsItem>
typealias GCRecipeDetailsSnapshot = NSDiffableDataSourceSnapshot<RecipeDetailsSection, RecipeDetailsItem>

enum RecipeDetailsSection: Int, CaseIterable {
    case image
    case ingredient
    case instruction

	var sectionTitle: String {
		switch self {
		case .ingredient:
			return "Ingredients"
		case .instruction:
			return "Instructions"
		case .image:
			return ""
		}
	}
}

enum RecipeDetailsItem: Hashable {
    case image(RecipeImageItem)
    case ingredient(RecipeIngredientItem)
    case instruction(RecipeInstructionItem)
}

struct RecipeImageItem: Hashable {
    let imageURL: String
}

struct RecipeIngredientItem: Hashable {
    let ingredient: String
}

struct RecipeInstructionItem: Hashable {
    let instruction: String
}
