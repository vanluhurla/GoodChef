//
//  GCNetworkManager.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 29/05/2023.
//

import Foundation

typealias GetRecipeListClosure = (_ recipes: [GCRecipe]?, _ error: GCNetworkError?) -> Void

class GCNetworkManager {
    func getRecipeList(completion: @escaping (_ recipes: [GCRecipe]?, _ error: GCNetworkError?) -> Void) {
        guard let url = URL(string: GCNetworkUrl.recipeList) else {
            completion(nil, GCNetworkError.urlNotFound)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data,
                  error == nil else {
                completion(nil, GCNetworkError.requestFailed)
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(.serverDateFormat)
                let recipeRecord = try decoder.decode(GCRecipeRecord.self, from: data)
                completion(recipeRecord.record.recipes, nil)
            } catch {
                completion(nil, GCNetworkError.decodingError)
            }
        }
        task.resume()
    }
}

