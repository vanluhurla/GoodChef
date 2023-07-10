//
//  GCStrings.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 10/07/2023.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizingFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
