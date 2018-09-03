//
//  CardDetailViewController.swift
//  DrawACard
//
//  Created by Jason Goodney on 9/3/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class CardDetailViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var suitLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func drawCardButtonTapped(_ sender: Any) {
        updateViews()
    }
    
    func updateViews() {
        DeckController.shared.fetchCard(count: 1) { (cards) in
            guard let card = cards?.first else { return }
            guard let imageURL = URL(string: card.image) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self.cardImageView.image = UIImage(data: imageData)
                self.suitLabel.text = "\(card.suit)"
                self.valueLabel.text = "\(card.value)"
            }
        }
    }
    
}
