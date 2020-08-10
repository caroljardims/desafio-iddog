//
//  FeedViewController.swift
//  iddog
//
//  Created by Caroline Jardim Siqueira on 09/08/20.
//  Copyright © 2020 Caroline Jardim Siqueira. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, StoryboardLoadable {
    
    let viewModel = FeedViewModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }
    
    func setupView() {
        viewModel.getFeed(nil, success: { self.tableView.reloadData() }, fail: {error in})
        tableView.register(DogTableViewCell.self)
        tableView.delegate = viewModel.feedDataSource
        tableView.dataSource = viewModel.feedDataSource
        collectionView.register(CategoryCollectionViewCell.self)
        collectionView.delegate = viewModel.feedDataSource
        collectionView.dataSource = viewModel.feedDataSource
    }
    
}
