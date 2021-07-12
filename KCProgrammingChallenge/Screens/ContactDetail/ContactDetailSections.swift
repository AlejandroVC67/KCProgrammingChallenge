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
        case .homePhone, .mobilePhone, .workPhone: return "kc.contact.detail.sections.phones.title".localized
        case .address: return "kc.contact.detail.sections.address.title".localized
        case .birthdate: return "kc.contact.detail.sections.birthdate.title".localized
        case .email: return "kc.contact.detail.sections.email.title".localized
        }
    }
    
    var hint: String? {
        switch self {
        case .homePhone: return "kc.contact.detail.sections.phones.home.hint".localized
        case .mobilePhone: return "kc.contact.detail.sections.phones.mobile.hint".localized
        case .workPhone: return "kc.contact.detail.sections.phones.work.hint".localized
        default: return nil
        }
    }
}
