//
//  GCRecipeListCollectionViewLayout.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 23/08/2023.
//

import UIKit

struct GCRecipeListCollectionViewLayout {
    static func layout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
            recipeList()
        }
    }
}

private extension GCRecipeListCollectionViewLayout {
    static func recipeList() -> NSCollectionLayoutSection? {
        let recipeListCardCell = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let recipeListCard = NSCollectionLayoutItem(layoutSize: recipeListCardCell)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalHeight(0.25))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [recipeListCard])
        
        let section = NSCollectionLayoutSection(group: group)
        let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(20.0))
        
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 40, trailing: 10)
        return section
    }
}
