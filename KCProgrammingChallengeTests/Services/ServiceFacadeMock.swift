//
//  ServiceFacadeMock.swift
//  KCProgrammingChallengeTests
//
//  Created by Alejandro Villa Cardenas
//

import Foundation
@testable import KCProgrammingChallenge

class ServiceFacadeMock: ServiceRepository {
    static func getContacts(completion: @escaping ContactsServiceResponse) {
        completion(.success([ContactGenerator.createMockContact(isFavorite: true)]))
    }
}
