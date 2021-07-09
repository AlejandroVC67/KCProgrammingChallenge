//
//  ServiceRepository.swift
//  KCProgrammingChallenge
//
//  Created by Alejandro Villa Cardenas
//

import UIKit

typealias ContactsServiceResponse = (Result<[Contact], ServiceError>) -> Void

protocol ServiceRepository {
    static func getContacts(completion: @escaping ContactsServiceResponse)
}
