//
//  GCNetworkError.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 29/05/2023.
//

import Foundation

enum GCNetworkError: Error {
    case urlNotFound
    case requestFailed
    case decodingError
    
    var description: String {
        switch self {
        case .urlNotFound:
            return "URL not found"
        case .requestFailed:
            return "Request failed"
        case .decodingError:
            return "Decoding error"
        }
    }
}


