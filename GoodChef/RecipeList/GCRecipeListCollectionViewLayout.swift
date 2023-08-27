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
        let recipeListCardCell = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                       heightDimension: .fractionalHeight(1.0))
        let recipeListCard = NSCollectionLayoutItem(layoutSize: recipeListCardCell)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(0.27))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                     repeatingSubitem: recipeListCard,
                                                     count: 2)
        group.interItemSpacing = .fixed(10)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
        
        let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                    heightDimension: .estimated(20.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        header.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        section.boundarySupplementaryItems = [header]
        
        return section
    }
}
