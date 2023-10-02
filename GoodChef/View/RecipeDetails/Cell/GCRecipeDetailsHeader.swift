//
//  GCRecipeDetailsHeader.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 02/10/2023.
//

import UIKit

class GCRecipeDetailsHeader: UICollectionViewCell {

	static var identifier = "ReusableGCRecipeDetailsHeader"

	private var headerCellView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .clear
		return view
	}()
	private var headerCellStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .horizontal
		stackView.spacing = 2.0
		stackView.backgroundColor = .clear
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	private var recipeDetailsHeaderLabel: UILabel = {
		let header = UILabel()
		header.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
		return header
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func setupHeader(text: String) {
		setupUI()
		setupValues(text: text)
	}
}

extension GCRecipeDetailsHeader {
	func setupValues(text: String) {
		recipeDetailsHeaderLabel.text = text
	}

	func setupUI() {
		setupViews()
		layoutViews()
		stackViewIndentation()
	}

	func setupViews() {
		contentView.addSubview(headerCellView)
		headerCellView.addSubview(headerCellStackView)
		headerCellStackView.addArrangedSubview(recipeDetailsHeaderLabel)
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

	func stackViewIndentation() {
		headerCellStackView.isLayoutMarginsRelativeArrangement = true
		headerCellStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
	}
}
