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
    
    static func fetch(with components: [String], queryItems: [String : Any], completion: @escaping () -> Void) {
        
        let urlComponents = components.joined(separator: "/")
        
    }
}
