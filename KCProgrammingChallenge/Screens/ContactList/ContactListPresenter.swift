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
    // MARK: - Constants
    private enum Constants {
        static let favoriteContactsHeaderTitle = "FAVORITE CONTACTS"
        static let unfavoriteContactsHeaderTitle = "OTHER CONTACTS"
    }
    
    // MARK: - Variables
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
    
    // MARK: - Functions
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

//MARK: - UITableViewDataSource Extension
extension ContactListPresenter: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
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
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = sections[section]
        return section == .favorite ? Constants.favoriteContactsHeaderTitle : Constants.unfavoriteContactsHeaderTitle
    }
    
    private func configureFavoriteContactsCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let contact = favoriteContacts[indexPath.row]
        return getContactsCell(tableView: tableView, indexPath: indexPath, contact: contact)
    }
    
    private func configureUnfavoriteContactsCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let contact = unfavoriteContacts[indexPath.row]
        return getContactsCell(tableView: tableView, indexPath: indexPath, contact: contact)
    }
    
    private func getContactsCell(tableView: UITableView, indexPath: IndexPath, contact: Contact) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactListTableViewCell.reuseIdentifier, for: indexPath) as? ContactListTableViewCell else {
            return UITableViewCell()
        }
        let thubmnailURL = URL(string: contact.smallImageURL)
        cell.configureCell(name: contact.name, company: contact.companyName, isFavorite: contact.isFavorite, thumbnailURL: thubmnailURL)
        return cell
    }
}
