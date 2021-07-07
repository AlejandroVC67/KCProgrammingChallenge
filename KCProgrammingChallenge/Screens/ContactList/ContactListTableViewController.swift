//
//  ViewController.swift
//  KCProgrammingChallenge
//
//  Created by Alejandro Villa Cardenas
//

import UIKit

final class ContactListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        ServiceFacade.getContacts { response in
            switch response {
            case .success(let contacts): print(contacts)
            case .failure(let error): print(error)
            }
        }
    }
}

