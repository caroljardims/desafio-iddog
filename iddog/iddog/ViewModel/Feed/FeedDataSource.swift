//
//  FeedDataSource.swift
//  iddog
//
//  Created by Caroline Jardim Siqueira on 09/08/20.
//  Copyright © 2020 Caroline Jardim Siqueira. All rights reserved.
//

import Foundation
import UIKit

class FeedDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    var list = [String]()
    var viewModel: UpdateViewModelProtocol?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as DogTableViewCell
        cell.selectionStyle = .none
        let url = list[indexPath.row]
        cell.photo.loadImageUrl(url)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel?.openImage(imageUrl: list[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as CategoryCollectionViewCell
        cell.setCategory(index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            viewModel?.updateCategory(category: .husky)
            break
        case 1:
            viewModel?.updateCategory(category: .pug)
            break
        case 2:
            viewModel?.updateCategory(category: .hound)
            break
        case 3:
            viewModel?.updateCategory(category: .labrador)
            break
        default:
            return
        }
    }
    
}
