//
//  ViewController.swift
//  MyMessages
//
//  Created by Jessie Gibson on 12/26/20.
//

import UIKit
import FirebaseAuth

class ConversationsViewController: UIViewController  {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        
    }
    
    override func viewDidAppear(_ animated:Bool){
        super.viewDidAppear(animated)
    }
    
    private func validateAuth() {
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated:false)
        }
    }

    
}

