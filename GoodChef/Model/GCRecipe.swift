//
//  GCRecipe.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 29/05/2023.
//

import Foundation

struct GCRecipeRecord: Codable {
    let record: GCRecipeList
}

struct GCRecipeList: Codable {
    let recipes: [GCRecipe]
}

struct GCRecipe: Codable {
    let image: String
    let title: String
    let date: Date
    let ingredients: [String]
    let instructions: [String]
}
