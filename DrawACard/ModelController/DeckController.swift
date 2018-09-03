//
//  DeckController.swift
//  DrawACard
//
//  Created by Jason Goodney on 9/3/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import Foundation

class DeckController {
    
    static let shared = DeckController(); private init() {}
    
    private let baseURLString = "https://deckofcardsapi.com/api/deck"
    
    func fetchCard(count: Int, completion: @escaping ([Card]?) -> Void) {
        
        guard let baseURL = URL(string: baseURLString) else {
            fatalError("Bad base url")
        }
        
        // Build a URL workshop
        let newURL = baseURL.appendingPathComponent("new").appendingPathComponent("draw")
        var components = URLComponents(url: newURL, resolvingAgainstBaseURL: true)
        let queryItems = URLQueryItem(name: "count", value: "\(count)")
        components?.queryItems = [queryItems]
        guard let url = components?.url else { return  }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("Error at data task \(#function): \(error) \(error.localizedDescription)")
                completion([])
                return
            }
            
            if let _ = response { completion([]); return }
            
            guard let data = data else {
                print("Did not recieve any data")
                completion([])
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let cards = try decoder.decode(Deck.self, from: data).cards
                completion(cards)
                return
            } catch let error {
                print("😳\nThere was an error in \(#function): \(error)\n\n\(error.localizedDescription)\n👿")
                completion([])
                return
            }
        }.resume()
    }
}
