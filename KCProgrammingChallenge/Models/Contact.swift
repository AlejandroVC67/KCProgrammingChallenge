//
//  Contact.swift
//  KCProgrammingChallenge
//
//  Created by Alejandro Villa Cardenas
//

import Foundation

struct Contact: Codable {
    let name: String
    let id: String
    let companyName: String?
    let isFavorite: Bool
    let smallImageURL: String
    let largeImageURL: String
    let emailAddress: String
    let birthdate: String
    let phone: Phone
    let address: Address

    enum CodingKeys: String, CodingKey {
        case name
        case id
        case companyName
        case isFavorite
        case smallImageURL
        case largeImageURL
        case emailAddress
        case birthdate
        case phone
        case address
    }
}



