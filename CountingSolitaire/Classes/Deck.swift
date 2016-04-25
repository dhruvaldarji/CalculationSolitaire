//
//  Deck.swift
//  Solitaire
//
//  Created by Dhruval Darji on 4/25/16.
//  Copyright © 2016 Dhruval Darji. All rights reserved.
//
import Foundation
import UIKit

class Deck : Pile {
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    override init() {
        
        super.init()
        
    }
    
    override func AddCard(card: Card) {
        
        Cards.first?.userInteractionEnabled = false
        super.AddCard(card)
        card.userInteractionEnabled = true;

    }
    
    func Shuffle(){
        Cards.shuffle()
        
        for(_, cards) in Cards.enumerate(){
            cards.userInteractionEnabled = false;
        }
        
        Cards.last?.userInteractionEnabled = true
    }
    
    func shuffleArray<T>(array: Array<T>) -> Array<T>
    {
        var shuffled = array;
        for (index, _) in shuffled.enumerate(){
            // Random int from 0 to index-1
            let j = Int(arc4random_uniform(UInt32(index-1)))
            
            // Swap two array elements
            // Notice '&' required as swap uses 'inout' parameters
            swap(&shuffled[index], &shuffled[j])
        }
        return shuffled
    }
    
}