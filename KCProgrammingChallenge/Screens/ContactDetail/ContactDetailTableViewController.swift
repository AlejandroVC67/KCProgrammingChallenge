//
//  ContactDetailTableViewController.swift
//  KCProgrammingChallenge
//
//  Created by Alejandro Villa Cardenas
//

import UIKit

final class ContactDetailTableViewController: UITableViewController {    
    // MARK: - Variables
    private let presenter: ContactDetailPresenter
    private let updateListCompletion: ((_ contact: Contact) -> Void)
    //MARK: - Init
    init(presenter: ContactDetailPresenter, updateListCompletion: @escaping (_ contact: Contact) -> Void) {
        self.presenter = presenter
        self.updateListCompletion = updateListCompletion
        super.init(nibName: nil, bundle: nil)
        setupTableView()
        setupNavbar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Functions
    private func setupTableView() {
        tableView.backgroundColor = .background
        tableView.dataSource = presenter
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.allowsSelection = false   
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(ContactDetailSummaryTableViewCell.self, forCellReuseIdentifier: ContactDetailSummaryTableViewCell.reuseIdentifier)
        tableView.register(ContactDetailItemTableViewCell.self, forCellReuseIdentifier: ContactDetailItemTableViewCell.reuseIdentifier)
    }
    
    private func setupNavbar() {
        let starIcon = UIBarButtonItem(image: presenter.getContactDetailStar(), style: .plain, target: self, action: #selector(handleUserTappingStar))
        navigationItem.rightBarButtonItem = starIcon
    }
    
    @objc private func handleUserTappingStar() {
        presenter.updateContactFavoriteStatus()
        setupNavbar()
        updateListCompletion(presenter.contact)
    }
}
