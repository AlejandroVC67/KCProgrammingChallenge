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
    
    // MARK: - Init
    init(contact: Contact) {
        self.contact = contact
    }
    
    func getContactDetailStar() -> UIImage? {
        return contact.isFavorite ? Constants.Navbar.favoriteStar : Constants.Navbar.unfavoriteStar
    }
    
    func updateContactFavoriteStatus() {
        contact.isFavorite.toggle()
    }
}

extension ContactDetailPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
