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
    
    //MARK: - Init
    init(presenter: ContactDetailPresenter) {
        self.presenter = presenter
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
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    private func setupNavbar() {
        let starIcon = UIBarButtonItem(image: presenter.getContactDetailStar(), style: .plain, target: self, action: #selector(handleUserTappingStar))
        navigationItem.rightBarButtonItem = starIcon
    }
    
    @objc private func handleUserTappingStar() {
        presenter.updateContactFavoriteStatus()
        setupNavbar()
    }
}
