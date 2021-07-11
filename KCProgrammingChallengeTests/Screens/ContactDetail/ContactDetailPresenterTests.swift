//
//  ContactDetailPresenterTests.swift
//  KCProgrammingChallengeTests
//
//  Created by Alejandro Villa Cardenas
//

import XCTest
@testable import KCProgrammingChallenge

class ContactDetailPresenterTests: XCTestCase {
    
    private enum ExpectedValues {
        static let unfavoriteStarImage = UIImage(named: "unfavoriteStar")
    }
    
    func testGetContactDetailStar() {
        // Given
        let presenter = ContactDetailPresenter(contact: createMockContact())
        
        // When
        let starImage = presenter.getContactDetailStar()
        
        // Then
        XCTAssertEqual(starImage, ExpectedValues.unfavoriteStarImage, "The image star image should be for unfavorite contacts")
    }
    
    func testUpdateContactFavoriteStatus() {
        // Given
        let presenter = ContactDetailPresenter(contact: createMockContact())

        // When
        presenter.updateContactFavoriteStatus()
        
        // Then
        XCTAssertTrue(presenter.contact.isFavorite, "The contact should be favorite.")
    }
    
    private func createMockContact() -> Contact {
        let address = Address(street: "", city: "", state: "", country: .us, zipCode: "")
        let phone = Phone(work: nil, home: nil, mobile: nil)
        let contact = Contact(name: "John", id: "0", companyName: nil, isFavorite: false, smallImageURL: "", largeImageURL: "", emailAddress: "", birthdate: "", phone: phone, address: address)
        return contact
    }
}
