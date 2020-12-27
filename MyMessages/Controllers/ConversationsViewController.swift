//
//  ViewController.swift
//  MyMessages
//
//  Created by Jessie Gibson on 12/26/20.
//

import UIKit

class ConversationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var chatTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatTable.register(UITableViewCell.self, forCellReuseIdentifier:"cell")
        chatTable.delegate = self
        chatTable.dataSource = self
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

