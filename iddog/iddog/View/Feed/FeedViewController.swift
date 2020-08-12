//
//  FeedViewController.swift
//  iddog
//
//  Created by Caroline Jardim Siqueira on 09/08/20.
//  Copyright © 2020 Caroline Jardim Siqueira. All rights reserved.
//

import UIKit

protocol UpdateFeedViewController {
    func reloadData()
    func openImage(imageUrl: String)
    
}

class FeedViewController: UIViewController, StoryboardLoadable {
    
    let viewModel = FeedViewModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }
    
    @IBAction func leaveButton(_ sender: Any) {
        self.dismiss()
    }
    
    func dismiss(){
        self.viewModel.clearUserDefaults()
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupView() {
        self.view.accessibilityIdentifier = "FeedView"
        viewModel.feedViewUpdate = self
        viewModel.getFeed(nil, success: {
            self.reloadData()
        }, fail: {error in
            let alert = UIAlertController(title: "Ops", message: error, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .default) { (_) in
                self.dismiss()
            }
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        })
        tableView.register(DogTableViewCell.self)
        tableView.delegate = viewModel.feedDataSource
        tableView.dataSource = viewModel.feedDataSource
        collectionView.register(CategoryCollectionViewCell.self)
        collectionView.delegate = viewModel.feedDataSource
        collectionView.dataSource = viewModel.feedDataSource
        
        collectionView.clipsToBounds = false
        collectionView.layer.shadowColor = UIColor.black.cgColor
        collectionView.layer.shadowOpacity = 0.5
        collectionView.layer.shadowOffset = CGSize(width: 0, height: 4)
        collectionView.layer.shadowRadius = 3
    }
    
}

extension FeedViewController: UpdateFeedViewController {
    func reloadData() {
        self.categoryLabel.text = self.viewModel.dogCategory?.rawValue.capitalized
        self.tableView.reloadData()
        self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0),
                                   at: .top,
                                   animated: true)
    }
    
    func openImage(imageUrl: String) {
        let feed: FullImageViewController = UIStoryboard.loadViewController()
        feed.imageUrl = imageUrl
        self.present(feed, animated: true, completion: nil)
    }
}
