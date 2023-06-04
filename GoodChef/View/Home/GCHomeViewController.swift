//
//  GCHomeViewController.swift
//  GoodChef
//
//  Created by Vanessa Hurla on 29/05/2023.
//

import UIKit

class GCHomeViewController: UIViewController {
    
    let viewModel: GCHomeViewModel
    
    init(viewModel: GCHomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        viewModel.loadData()
        
    }
}

//MARK: VIEW MODEL DELEGATE

extension GCHomeViewController: GCHomeViewModelDelegate {
    func didRecieveRecipes() {
        print("DID RECEIVE RECIPES: \(viewModel.recipes.count)")
    }

    func didRecieveErrorWithMessage(_ message: String) {
        print("DID RECEIVE ERROR: \(message)")
    }
}
