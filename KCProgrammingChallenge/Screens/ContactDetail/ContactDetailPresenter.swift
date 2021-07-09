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
    private var contact: Contact
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
        if let _ = contact.phone.home {
            sections.append(.homePhone)
        }
        if let _ = contact.phone.mobile {
            sections.append(.mobilePhone)
        }
        if let _ = contact.phone.work {
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
        return UITableViewCell()
    }
}
