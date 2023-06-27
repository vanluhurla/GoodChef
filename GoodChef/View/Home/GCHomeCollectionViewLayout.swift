//
//  GCHomeCollectionViewLayout.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 27/06/2023.
//

import UIKit

struct GCHomeCollectionViewLayout {
    static func layout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case GCHomeSection.featured.rawValue:
                return largeCardCarousel()
            case GCHomeSection.categories.rawValue:
                return nil
            default:
                return nil
            }
        }
    }
}

private extension GCHomeCollectionViewLayout {
    static func largeCardCarousel() -> NSCollectionLayoutSection? {
        let largeCardSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let largeCard = NSCollectionLayoutItem(layoutSize: largeCardSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.6))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [largeCard])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        return section
    }
}
