//
//  ProfileViewController.swift
//  MyMessages
//
//  Created by Jessie Gibson on 12/26/20.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Profile"
        

    }
    
    
    
    @objc private func didTapRegister(){
        let vc = RegisterViewController()
        vc.title = "Create Account"
        navigationController?.pushViewController(vc, animated:true)
    }
   

}
