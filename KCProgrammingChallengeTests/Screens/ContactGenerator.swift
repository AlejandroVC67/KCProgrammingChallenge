//
//  ContactGenerator.swift
//  KCProgrammingChallengeTests
//
//  Created by Alejandro Villa Cardenas
//

import Foundation
@testable import KCProgrammingChallenge

struct ContactGenerator {
    static func createMockContact(isFavorite: Bool) -> Contact {
        let address = Address(street: "", city: "", state: "", country: .us, zipCode: "")
        let phone = Phone(work: "123", home: "456", mobile: "789")
        let contact = Contact(name: "John", id: "0", companyName: nil, isFavorite: isFavorite, smallImageURL: "", largeImageURL: "", emailAddress: "", birthdate: "", phone: phone, address: address)
        return contact
    }
}
