//
//  GCRecipeDetailsTextCell.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 28/09/2023.
//

import UIKit

class GCRecipeDetailsTextCell: UICollectionViewCell {

	static var identifier = "ReusableGCRecipeDetailsTextCell"

	private var recipeTextCellView: UIView = {
		let textView = UIView()
		textView.translatesAutoresizingMaskIntoConstraints = false
		textView.backgroundColor = .backgroundPrimary
		return textView
	}()
	private var recipeTextStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .horizontal
		stackView.backgroundColor = .clear
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	private var recipeTextLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
		label.numberOfLines = 0
		return label
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func setupCellContent(text: String) {
		setupUI()
		setupValues(text: text)

	}
}

private extension GCRecipeDetailsTextCell {
	func setupValues(text: String) {
		recipeTextLabel.text = text

	}

	func setupUI() {
		setupViews()
		layoutViews()
		stackViewIndentation()
	}

	func setupViews() {
		contentView.addSubview(recipeTextCellView)
		recipeTextCellView.addSubview(recipeTextStackView)
		recipeTextStackView.addArrangedSubview(recipeTextLabel)
	}

	func layoutViews() {
		NSLayoutConstraint.activate([
			recipeTextCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			recipeTextCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			recipeTextCellView.topAnchor.constraint(equalTo: contentView.topAnchor),
			recipeTextCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

			recipeTextStackView.leadingAnchor.constraint(equalTo: recipeTextCellView.leadingAnchor),
			recipeTextStackView.trailingAnchor.constraint(equalTo: recipeTextCellView.trailingAnchor),
			recipeTextStackView.topAnchor.constraint(equalTo: recipeTextCellView.topAnchor),
			recipeTextStackView.bottomAnchor.constraint(equalTo: recipeTextCellView.bottomAnchor)
		])
	}

	func stackViewIndentation() {
		recipeTextStackView.isLayoutMarginsRelativeArrangement = true
		recipeTextStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16,
																			leading: 16,
																			bottom: 16,
																			trailing: 16)
	}
}
