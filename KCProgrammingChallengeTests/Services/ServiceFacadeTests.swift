//
//  ServiceFacadeTests.swift
//  KCProgrammingChallengeTests
//
//  Created by Alejandro Villa Cardenas
//

import XCTest
@testable import KCProgrammingChallenge

class ServiceFacadeTests: XCTestCase {
    
    func testGetContacts() {
        // Given
        let expectedContacts = [ContactGenerator.createMockContact(isFavorite: true)]
        ServiceFacadeMock.getContacts { response in
            switch response {
            case .success(let contacts):
                XCTAssertEqual(contacts, expectedContacts, "The contacts should be the same")
            case .failure(_):
                XCTFail("Should not fail")
            }
        }
    }
}
