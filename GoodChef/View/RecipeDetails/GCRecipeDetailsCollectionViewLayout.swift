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
                return recipeDetails()
            case RecipeDetailsSection.ingredient.rawValue:
                return nil
            case RecipeDetailsSection.instruction.rawValue:
                return nil
            default:
                return nil
            }
        }
    }
}

private extension GCRecipeDetailsCollectionViewLayout {
    static func recipeDetails() -> NSCollectionLayoutSection? {
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
}
