//
//  GCRecipeDetailsViewModel.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 06/09/2023.
//

import Foundation

struct GCRecipeDetailsViewModelConfiguration {
    let recipe: GCRecipe
}

class GCRecipeDetailsViewModel: NSObject {
    
    private let configuration: GCRecipeDetailsViewModelConfiguration
    
    init(configuration: GCRecipeDetailsViewModelConfiguration) {
        self.configuration = configuration
    }
}

