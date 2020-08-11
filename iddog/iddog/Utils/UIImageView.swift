//
//  UIImageView.swift
//  iddog
//
//  Created by Caroline Jardim Siqueira on 11/08/20.
//  Copyright © 2020 Caroline Jardim Siqueira. All rights reserved.
//

import Foundation
import UIKit
import Nuke

extension UIImageView {
    func loadImageUrl(_ imageUrl: String) {
        let request = ImageRequest(url: URL(string: imageUrl)!)
        Nuke.loadImage(with: request, into: self)
    }
}
