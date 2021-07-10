//
//  ViewController.swift
//  KCProgrammingChallenge
//
//  Created by Alejandro Villa Cardenas
//

import UIKit

final class ContactListTableViewController: UITableViewController {
    // MARK: - Variables
    private let presenter: ContactListPresenter
    
    //MARK: - Init
    init(presenter: ContactListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.presenter.delegate = self
        setupTableView()
        setupView()
        loadContacts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    private func setupView() {
        title = "Contacts"
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .background
        tableView.dataSource = presenter
        tableView.delegate = presenter
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(ContactListTableViewCell.self, forCellReuseIdentifier: ContactListTableViewCell.reuseIdentifier)
    }
    
    private func loadContacts() {
        presenter.getContacts()
    }
}

//MARK: - ContactListDelegate Extension
extension ContactListTableViewController: ContactListDelegate {
    func handleSelection(of contact: Contact) {
        let presenter = ContactDetailPresenter(contact: contact)
        let contactDetailViewController = ContactDetailTableViewController(presenter: presenter)
        navigationController?.pushViewController(contactDetailViewController, animated: true)
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func handleError(_ error: ServiceError) {
        // TODO: Implement logic.
    }
}
