//
//  ViewController.swift
//  KCProgrammingChallenge
//
//  Created by Alejandro Villa Cardenas
//

import UIKit

final class ContactListTableViewController: UITableViewController {

    private let presenter: ContactListPresenter
    
    init(presenter: ContactListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.presenter.delegate = self
        setupTableView()
        loadContacts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        tableView.dataSource = presenter
        tableView.allowsMultipleSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    private func loadContacts() {
        presenter.getContacts()
    }
}

extension ContactListTableViewController: ContactListDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func handleError(_ error: ServiceError) {
        // TODO: Implement logic.
    }
}
