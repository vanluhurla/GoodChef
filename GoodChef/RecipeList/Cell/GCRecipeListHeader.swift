//
//  GCRecipeListHeader.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 27/08/2023.
//

import UIKit

class GCRecipeListHeader: UICollectionReusableView {
    static var identifier = "ReusableGCRecipeListHeader"
    
    private var cellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    private var cellStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 2.0
        stackView.backgroundColor = .clear
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private var recipeListHeaderTitleLabel: UILabel = {
        let header = UILabel()
        header.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return header
    }()
    
    func setupHeader(title: String) {
        setupUI()
        setupValues(title: title)
    }
}

private extension GCRecipeListHeader {
    func setupValues(title: String) {
        recipeListHeaderTitleLabel.text = title
    }
    
    func setupUI() {
        setupViews()
        layoutViews()
    }
    
    func setupViews() {
        addSubview(cellView)
        cellView.addSubview(cellStackView)
        cellStackView.addArrangedSubview(recipeListHeaderTitleLabel)
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellView.topAnchor.constraint(equalTo: topAnchor),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            cellStackView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            cellStackView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            cellStackView.topAnchor.constraint(equalTo: cellView.topAnchor),
            cellStackView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor)
        ])
    }
}
