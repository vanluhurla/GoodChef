//
//  GCRecipeDetailsViewController.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 06/09/2023.
//

import UIKit

class GCRecipeDetailsViewController: UIViewController {
    
    // MARK: VIEW MODEL
    let viewModel: GCRecipeDetailsViewModel
    
    init(viewModel: GCRecipeDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
