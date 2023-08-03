//
//  GCHomeHeader.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 06/07/2023.
//

import UIKit

class GCHomeHeader: UICollectionReusableView {
    static var identifier = "ReusableGCHomeHeader"
    
    private var headerCellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    private var headerCellStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 2.0
        stackView.backgroundColor = .clear
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private var featuredHeaderTitleLabel: UILabel = {
        var header = UILabel()
        header.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return header
    }()
    
    func setupHeader(title: String) {
        setupValues(title: title)
        setupUI()
    }
}

private extension GCHomeHeader{
    func setupValues(title: String) {
        featuredHeaderTitleLabel.text = title
    }
    
    func setupUI() {
        setupViews()
        layoutViews()
    }
    
    func setupViews() {
        addSubview(headerCellView)
        headerCellView.addSubview(headerCellStackView)
        headerCellStackView.addArrangedSubview(featuredHeaderTitleLabel)
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            headerCellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerCellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerCellView.topAnchor.constraint(equalTo: topAnchor),
            headerCellView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            headerCellStackView.leadingAnchor.constraint(equalTo: headerCellView.leadingAnchor),
            headerCellStackView.trailingAnchor.constraint(equalTo: headerCellView.trailingAnchor),
            headerCellStackView.topAnchor.constraint(equalTo: headerCellView.topAnchor),
            headerCellStackView.bottomAnchor.constraint(equalTo: headerCellView.bottomAnchor)
        ])
    }
}
