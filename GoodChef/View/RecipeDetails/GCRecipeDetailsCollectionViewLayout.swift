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
            return recipeDetails()
        }
    }
}

private extension GCRecipeDetailsCollectionViewLayout {
    static func recipeDetails() -> NSCollectionLayoutSection? {
        return nil
    }
}
