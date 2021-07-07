//
//  Phone.swift
//  KCProgrammingChallenge
//
//  Created by Alejandro Villa Cardenas
//

import Foundation

struct Phone: Codable {
    let work: String?
    let home: String?
    let mobile: String?

    enum CodingKeys: String, CodingKey {
        case work
        case home
        case mobile
    }
}
