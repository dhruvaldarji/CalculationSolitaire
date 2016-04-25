//
//  Deck.swift
//  Solitaire
//
//  Created by Dhruval Darji on 4/25/16.
//  Copyright © 2016 Dhruval Darji. All rights reserved.
//
import Foundation
import UIKit

class Foundation : Pile {
    
    var Multiplier = 1
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(mult : Int) {
        
        super.init()
        Multiplier = mult
        
    }
    
    override func AddCard(card: Card) {
        
        super.AddCard(card)
        
        card.userInteractionEnabled = false;
        
    }
    
}