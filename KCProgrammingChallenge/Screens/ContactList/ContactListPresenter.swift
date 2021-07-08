//
//  ContactListPresenter.swift
//  KCProgrammingChallenge
//
//  Created by Alejandro Villa Cardenas
//

import UIKit

protocol ContactListDelegate: AnyObject {
    func reloadData()
    func handleError(_ error: ServiceError)
}

enum ContactListSections: CaseIterable {
    case favorite, unfavorite
}

final class ContactListPresenter: NSObject {
    
    private var contacts: [Contact] = [] {
        didSet {
            let favorites = contacts.filter { $0.isFavorite }
            let unfavorites = contacts.filter { !$0.isFavorite }
            favoriteContacts = favorites
            unfavoriteContacts = unfavorites
            delegate?.reloadData()
        }
    }
    private var favoriteContacts: [Contact] = []
    private var unfavoriteContacts: [Contact] = []
    
    private let sections: [ContactListSections] = ContactListSections.allCases
    weak var delegate: ContactListDelegate?
    
    func getContacts() {
        ServiceFacade.getContacts { [weak self] response in
            switch response {
            case .success(let contacts):
                self?.contacts = contacts
            case .failure(let error):
                self?.delegate?.handleError(error)
            }
        }
    }
}

extension ContactListPresenter: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        switch section {
        case .favorite:
            return favoriteContacts.count
        case .unfavorite:
            return unfavoriteContacts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        switch section {
        case .favorite:
            return configureFavoriteContactsCell(tableView: tableView, indexPath: indexPath)
        case .unfavorite:
            return configureUnfavoriteContactsCell(tableView: tableView, indexPath: indexPath)
        }
    }
    
    private func configureFavoriteContactsCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let contact = favoriteContacts[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = contact.name
        return cell
    }
    
    private func configureUnfavoriteContactsCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let contact = unfavoriteContacts[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = contact.name
        return cell
    }
}
