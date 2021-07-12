//
//  ContactListDelegate.swift
//  KCProgrammingChallenge
//
//  Created by Alejandro Villa Cardenas
//

import Foundation

protocol ContactListDelegate: AnyObject {
    func reloadData()
    func handleError(_ error: ServiceError)
    func handleSelection(of contact: Contact)
}
