//
//  ContactDetailPresenter.swift
//  KCProgrammingChallenge
//
//  Created by Alejandro Villa Cardenas
//

import UIKit

final class ContactDetailPresenter: NSObject {
    //MARK: - Constants
    private enum Constants {
        enum Navbar {
            static let favoriteStar = UIImage(named: "favoriteStar")
            static let unfavoriteStar = UIImage(named: "unfavoriteStar")
        }
    }
    
    // MARK: - Variables
    private(set) var contact: Contact
    private var sections: [ContactDetailSections] = [.summary]
    
    // MARK: - Init
    init(contact: Contact) {
        self.contact = contact
        super.init()
        setupSections()
    }
    
    //MARK: - Internal functions
    func getContactDetailStar() -> UIImage? {
        return contact.isFavorite ? Constants.Navbar.favoriteStar : Constants.Navbar.unfavoriteStar
    }
    
    func updateContactFavoriteStatus() {
        contact.isFavorite.toggle()
    }
    
    //MARK: - Private functions
    private func setupSections() {
        if let homePhone = contact.phone.home,
           !homePhone.isEmpty {
            sections.append(.homePhone)
        }
        if let mobilePhone = contact.phone.mobile,
           !mobilePhone.isEmpty {
            sections.append(.mobilePhone)
        }
        if let workPhone = contact.phone.work,
           !workPhone.isEmpty {
            sections.append(.workPhone)
        }
        sections.append(contentsOf: [.address, .birthdate, .email])
    }
}

//MARK: - UITableViewDataSource Extension
extension ContactDetailPresenter: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        let information: String
        switch section {
        case .summary:
            return configureDetailSummaryCell(tableView, indexPath: indexPath)
        case .homePhone:
            information = contact.phone.home ?? ""
        case .mobilePhone:
            information = contact.phone.mobile ?? ""
        case .workPhone:
            information = contact.phone.work ?? ""
        case .address:
            information = String(format: "kc.contact.detail.sections.address.format".localized, contact.address.street, contact.address.city, contact.address.state, contact.address.zipCode, contact.address.country.rawValue)
        case .birthdate:
            information = contact.birthdate
        case .email:
            information = contact.emailAddress
        }
        return configureInformationCell(tableView, indexPath: indexPath, title: section.title, information: information, hint: section.hint)
    }
    
    private func configureDetailSummaryCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactDetailSummaryTableViewCell.reuseIdentifier) as? ContactDetailSummaryTableViewCell else {
            return UITableViewCell()
        }
        let company = contact.companyName ?? ""
        cell.configureCell(name: contact.name, company: company, profileImagePath: contact.largeImageURL)
        return cell
    }
    
    private func configureInformationCell(_ tableView: UITableView, indexPath: IndexPath, title: String, information: String, hint: String? = nil) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactDetailItemTableViewCell.reuseIdentifier) as? ContactDetailItemTableViewCell else {
            return UITableViewCell()
        }
        cell.configureCell(title: title, information: information, hint: hint)
        return cell
    }
}
