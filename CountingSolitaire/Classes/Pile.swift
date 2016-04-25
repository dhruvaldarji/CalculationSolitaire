//
//  Pile.swift
//  Solitaire
//
//  Created by Dhruval Darji on 4/24/16.
//  Copyright © 2016 Dhruval Darji. All rights reserved.
//

import Foundation
import SpriteKit

class Pile : SKSpriteNode {
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    var Cards : [Card] = []
    
    var BaseTexture : SKTexture = SKTexture(imageNamed: Constants().pile_base)
    
    
    init() {
        // call designated initializer on super
        super.init(texture: BaseTexture, color: UIColor.whiteColor(), size: Constants().HalfSize(BaseTexture.size()))
    }
    
    init(baseImage : String) {
        self.BaseTexture = SKTexture(imageNamed: baseImage)
        
        // call designated initializer on super
        super.init(texture: BaseTexture, color: UIColor.whiteColor(), size: Constants().HalfSize(BaseTexture.size()))
    }
    
    convenience init(baseImage : String, pos : CGPoint) {
        // call designated initializer on super
        self.init(baseImage: baseImage)
        position = pos
    }
    
    func GetTop() -> Card {
        let card = self.Cards.removeLast()
        Cards.first?.userInteractionEnabled = true
        return card
    }
    
    func GetCard(card: Card) -> Card {
        let index = self.Cards.indexOf(card)
        let card = self.Cards.removeAtIndex(index!)
        Cards.first?.userInteractionEnabled = true
        return card
    }

    
    func GetAtIndex(index : Int) -> Card {
        let card = self.Cards.removeAtIndex(index)
        Cards.first?.userInteractionEnabled = true
        return card
    }
    
    func AddCard(card: Card) {
        // Set current head drag to false.
        Cards.first?.userInteractionEnabled = false

        // Move card to position
        card.position = self.position
        card.CardPos = self.position
        card.zPosition = self.zPosition + CGFloat(Cards.count + 1)
        
        // Add to parent
//        card.removeFromParent()
//        self.addChild(card)
        Cards.append(card)
        
        // Set new head's drag to true;
        Cards.first?.userInteractionEnabled = true
    }

    
}