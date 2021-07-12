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
        static let favoriteStarImage = UIImage(named: "favoriteStar")
    }
    
    func testGetContactDetailStar_givenUnfavoriteContact_shouldReturnUnfavoriteStar() {
        // Given
        let presenter = ContactDetailPresenter(contact: ContactGenerator.createMockContact(isFavorite: false))
        
        // When
        let starImage = presenter.getContactDetailStar()
        
        // Then
        XCTAssertEqual(starImage, ExpectedValues.unfavoriteStarImage, "The image star image should be for unfavorite contacts")
    }
    
    func testGetContactDetailStar_givenFavoriteContact_shouldReturnFavoriteStar() {
        // Given
        let presenter = ContactDetailPresenter(contact: ContactGenerator.createMockContact(isFavorite: true))
        
        // When
        let starImage = presenter.getContactDetailStar()
        
        // Then
        XCTAssertEqual(starImage, ExpectedValues.favoriteStarImage, "The image star image should be for favorite contacts")
    }
    
    func testUpdateContactFavoriteStatus() {
        // Given
        let presenter = ContactDetailPresenter(contact: ContactGenerator.createMockContact(isFavorite: false))

        // When
        presenter.updateContactFavoriteStatus()
        
        // Then
        XCTAssertTrue(presenter.contact.isFavorite, "The contact should be favorite.")
    }
}
