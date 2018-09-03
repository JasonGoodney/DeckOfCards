//
//  Deck+Card.swift
//  DrawACard
//
//  Created by Jason Goodney on 9/3/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import Foundation

struct Deck: Decodable {
    // This propert is on the top level of the JSON
    // MARK: - Properties
    let cards: [Card]
}

struct Card: Decodable {
    let suit: String
    let value: String
    let image: String
}

