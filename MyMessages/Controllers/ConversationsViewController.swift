//
//  ViewController.swift
//  MyMessages
//
//  Created by Jessie Gibson on 12/26/20.
//

import UIKit
import FirebaseAuth

class ConversationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var chatTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        chatTable.register(UITableViewCell.self, forCellReuseIdentifier:"cell")
        chatTable.delegate = self
        chatTable.dataSource = self
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        cell.textLabel?.text = "Jessie Gibson "
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //Show chat messages.
        let vc = ChatViewController()
        vc.title = "Chat"
        navigationController?.pushViewController(vc, animated: true)
    }
}

