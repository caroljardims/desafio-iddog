//
//  ViewController.swift
//  iddog
//
//  Created by Caroline Jardim Siqueira on 09/08/20.
//  Copyright © 2020 Caroline Jardim Siqueira. All rights reserved.
//

import UIKit


class SingUpViewController: UIViewController {
    
    let viewModel = UserViewModel()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = "MainView"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        viewModel.checkUserToken(isLogged: {logged in
            if (logged) { self.gotoFeed() }
        })
    }
    
    @IBAction func enterEmailAction(_ sender: Any) {
        guard let emailText = self.emailTextField.text else {
            self.presentSimpleAlert("Ops!", "Insira um e-mail para entrar.")
            return
        }
        
        self.viewModel.signup(
            email: emailText,
            success: {
                self.gotoFeed()
        },
            fail: {error in
                self.presentSimpleAlert("Ops!", error)
        })
    }
    
    func gotoFeed(){
        let feed: FeedViewController = UIStoryboard.loadViewController()
        self.present(feed, animated: true, completion: nil)
    }
    
    func presentSimpleAlert(_ title: String?, _ message: String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
}


