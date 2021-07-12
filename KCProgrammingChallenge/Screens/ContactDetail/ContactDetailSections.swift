//
//  ContactDetailSections.swift
//  KCProgrammingChallenge
//
//  Created by Alejandro Villa Cardenas
//

import Foundation

enum ContactDetailSections {
    case summary, homePhone, mobilePhone, workPhone, address, birthdate, email
    
    var title: String {
        switch self {
        case .summary: return ""
        case .homePhone, .mobilePhone, .workPhone: return "PHONE"
        case .address: return "ADDRESS"
        case .birthdate: return "BIRTHDATE"
        case .email: return "EMAIL"
        }
    }
    
    var hint: String? {
        switch self {
        case .homePhone: return "Home"
        case .mobilePhone: return "Mobile"
        case .workPhone: return "Work"
        default: return nil
        }
    }
}
