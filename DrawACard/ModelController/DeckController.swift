//
//  DeckController.swift
//  DrawACard
//
//  Created by Jason Goodney on 9/3/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import Foundation

class DeckController {
    
    static let baseURL = "https://deckofcardsapi.com/api/deck/"
    
    static func fetch(at endpoint: String, completion: @escaping () -> Void) {
        
        guard let url = URL(string: DeckController.baseURL)?.appendingPathComponent(endpoint) else {
            print("Error at url path")
            completion(); return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let urlSession = URLSession.shared
        let dataTask = urlSession.dataTask(with: urlRequest) { (data, response, error) in
            
            if let error = error {
                print("Error at data task: \(error)")
                completion(); return
            }
            
            guard let data = data else {
                print("Did not recieve any data")
                completion(); return
            }
        }
        
    }
}
