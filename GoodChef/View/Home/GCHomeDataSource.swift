//
//  GCHomeDataSource.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 24/06/2023.
//

import UIKit

typealias HomeDataSource = UICollectionViewDiffableDataSource<GCHomeSection, GCHomeItem>
typealias HomeSnapshot = NSDiffableDataSourceSnapshot<GCHomeSection, GCHomeItem>

enum GCHomeSection: Int {
    case featured
    case categories
}

enum GCHomeItem: Hashable {
    case featured(FeaturedItem)
    case categories(CategoryItem)
}

struct FeaturedItem: Hashable {
    let title: String
    let subtitle: String
    let imageURL: String
}

struct CategoryItem: Hashable {
    let title: String
}

