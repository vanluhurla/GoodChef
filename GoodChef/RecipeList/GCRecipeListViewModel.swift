//
//  GCRecipeListViewModel.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 03/08/2023.
//

import Foundation

struct GCRecipeListViewModelConfiguration {
    let title: String
    let recipes: [GCRecipe]
}

class GCRecipeListViewModel: NSObject {
    
    private let configuration: GCRecipeListViewModelConfiguration
    
    init(configuration: GCRecipeListViewModelConfiguration) {
        self.configuration = configuration
    }
}

