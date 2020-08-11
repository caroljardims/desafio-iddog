//
//  CategoryCollectionViewCell.swift
//  iddog
//
//  Created by Caroline Jardim Siqueira on 09/08/20.
//  Copyright © 2020 Caroline Jardim Siqueira. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell, NibLoadableView {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        categoryImage.layer.cornerRadius = 8
    }
    
    func setCategory(index: Int){
        switch index {
        case 0:
            categoryLabel.text = DogCategory.husky.rawValue.uppercased()
            categoryImage.image = UIImage(named: "husky")
            break
        case 1:
            categoryLabel.text = DogCategory.pug.rawValue.uppercased()
            categoryImage.image =  UIImage(named: "splashimage")
            break
        case 2:
            categoryLabel.text = DogCategory.hound.rawValue.uppercased()
            categoryImage.image = UIImage(named: "hound")
            break
        case 3:
            categoryLabel.text = DogCategory.labrador.rawValue.uppercased()
            categoryImage.image = UIImage(named: "labrador")
            break
        default:
            break
        }
    }
    
}
