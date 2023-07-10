//
//  GCRecipeCategory.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 10/07/2023.
//

import UIKit

enum GCRecipeCategory: String, CaseIterable {
    case breakfast, lunch, dinner, dessert, snacks, drinks, bakery
    
    var title: String {
        self.rawValue.capitalizingFirstLetter()
    }
    
    var image: UIImage? {
        UIImage(named: "category_icon_\(self.rawValue)")
    }
}
