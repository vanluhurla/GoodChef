//
//  GCRecipeDetailsCollectionViewLayout.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 14/09/2023.
//

import UIKit

struct GCRecipeDetailsCollectionViewLayout {
    static func layout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case RecipeDetailsSection.image.rawValue:
                return recipeDetailsImage()
            case RecipeDetailsSection.ingredient.rawValue:
                return recipeDetailsText()
            case RecipeDetailsSection.instruction.rawValue:
                return recipeDetailsText()
            default:
                return nil
            }
        }
    }
}

private extension GCRecipeDetailsCollectionViewLayout {
    static func recipeDetailsImage() -> NSCollectionLayoutSection? {
        let recipeImageCellSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                         heightDimension: .fractionalWidth(1.0))
        let recipeImageCell = NSCollectionLayoutItem(layoutSize: recipeImageCellSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(200))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [recipeImageCell])
        
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)

        return section
    }

	static func recipeDetailsText() -> NSCollectionLayoutSection? {
		let recipeTextCellSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(60))
		let recipeTextCell = NSCollectionLayoutItem(layoutSize: recipeTextCellSize)


		let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(200))
		let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [recipeTextCell])


		let section = NSCollectionLayoutSection(group: group)
		section.interGroupSpacing = 1
		section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

		return section
	}
}
