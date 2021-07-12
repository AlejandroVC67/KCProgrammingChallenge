//
//  ContactListPresenterTests.swift
//  KCProgrammingChallengeTests
//
//  Created by Alejandro Villa Cardenas
//

import XCTest
@testable import KCProgrammingChallenge

class ContactListPresenterTests: XCTestCase {
    
    func testUpdateList() {
        // Given
        let contact = ContactGenerator.createMockContact(isFavorite: false)
        let presenter = ContactListPresenter()
        
        // When
        presenter.updateList(contact: contact)
        
        // Then
        guard let firstContact = presenter.contacts.first else {
            XCTFail("There should be at least one contact")
            return
        }
        XCTAssertEqual(presenter.contacts.count, 1, "Should only have 1 contact")
        XCTAssertEqual(firstContact, contact, "The contact should be the same")
    }
}
