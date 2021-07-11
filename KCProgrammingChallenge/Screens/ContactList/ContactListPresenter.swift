//
//  ContactListPresenter.swift
//  KCProgrammingChallenge
//
//  Created by Alejandro Villa Cardenas
//

import UIKit

final class ContactListPresenter: NSObject {
    // MARK: - Constants
    private enum Constants {
        static let favoriteContactsHeaderTitle = "FAVORITE CONTACTS"
        static let unfavoriteContactsHeaderTitle = "OTHER CONTACTS"
    }
    
    // MARK: - Variables
    private(set) var contacts: [Contact] = [] {
        didSet {
            contacts.sortByName()
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
    
    func updateList(contact: Contact) {
        contacts.removeAll(where: { $0.id == contact.id })
        contacts.append(contact)
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
        let isLast = indexPath.row + 1 == favoriteContacts.count
        return getContactsCell(tableView: tableView, indexPath: indexPath, contact: contact, hideSeparator: isLast)
    }
    
    private func configureUnfavoriteContactsCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let contact = unfavoriteContacts[indexPath.row]
        return getContactsCell(tableView: tableView, indexPath: indexPath, contact: contact)
    }
    
    private func getContactsCell(tableView: UITableView, indexPath: IndexPath, contact: Contact, hideSeparator: Bool = false) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactListTableViewCell.reuseIdentifier, for: indexPath) as? ContactListTableViewCell else {
            return UITableViewCell()
        }
        
        let company = contact.companyName ?? ""
        cell.configureCell(name: contact.name, company: company, isFavorite: contact.isFavorite, thumbnailPath: contact.smallImageURL, hideSeparator: hideSeparator)
        return cell
    }
}

//MARK: - UITableViewDelegate Extension
extension ContactListPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = sections[indexPath.section]
        var contact: Contact
        switch section {
        case .favorite:
            contact = favoriteContacts[indexPath.row]
        case .unfavorite:
            contact = unfavoriteContacts[indexPath.row]
        }
        delegate?.handleSelection(of: contact)
    }
}
