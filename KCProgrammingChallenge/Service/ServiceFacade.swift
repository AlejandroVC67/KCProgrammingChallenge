//
//  ServiceFacade.swift
//  KCProgrammingChallenge
//
//  Created by Alejandro Villa Cardenas
//

import UIKit

struct ServiceFacade: ServiceRepository {
    private enum Constants {
        static let baseUrl = "https://s3.amazonaws.com/technical-challenge/v3/contacts.json"
    }
    
    static func getContacts(completion: @escaping ContactsServiceResponse) {
        guard let url = URL(string: Constants.baseUrl) else {
            completion(.failure(.badUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.get.rawValue
        
        let task = URLSession.shared.dataTask(with: request) { (data, _, _) in
            guard let data = data else {
                completion(.failure(.dataError))
                return
            }
            do {
                let users = try JSONDecoder().decode([Contact].self, from: data)
                completion(.success(users))
            } catch {
                print(error)
                completion(.failure(.unableToParse))
            }
        }
        task.resume()
    }
}
