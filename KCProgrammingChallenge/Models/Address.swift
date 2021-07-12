//
//  Address.swift
//  KCProgrammingChallenge
//
//  Created by Alejandro Villa Cardenas
//

import Foundation

struct Address: Codable {
    let street: String
    let city: String
    let state: String
    let country: Country
    let zipCode: String

    enum CodingKeys: String, CodingKey {
        case street
        case city
        case state
        case country
        case zipCode
    }
}
