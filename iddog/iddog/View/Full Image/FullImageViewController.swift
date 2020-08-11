//
//  FullImageViewController.swift
//  iddog
//
//  Created by Caroline Jardim Siqueira on 10/08/20.
//  Copyright © 2020 Caroline Jardim Siqueira. All rights reserved.
//

import UIKit

class FullImageViewController: UIViewController, StoryboardLoadable {
    
    var imageUrl: String?
    
    @IBOutlet weak var photo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        guard let imageUrl = imageUrl else { return }
        self.photo.loadImageUrl(imageUrl)
    }
    
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
