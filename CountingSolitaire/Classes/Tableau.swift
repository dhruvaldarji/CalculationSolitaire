//
//  Deck.swift
//  Solitaire
//
//  Created by Dhruval Darji on 4/25/16.
//  Copyright © 2016 Dhruval Darji. All rights reserved.
//
import Foundation
import UIKit

class Tableau : Pile {
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    override init() {
        
        super.init()
        
    }
    
    override func AddCard(card: Card) {
        
        super.AddCard(card)
        
        let count = self.Cards.count
        let yOffset : CGFloat = CGFloat(count) * 25.0
        card.position = CGPoint(x: self.position.x, y: self.position.y - yOffset)
        card.CardPos = self.position
        card.zPosition = self.zPosition + CGFloat(count)

    }
    
}