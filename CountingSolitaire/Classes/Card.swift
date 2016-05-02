//
//  Card.swift
//  CountingSolitaire
//
//  Created by Dhruval Darji on 4/24/16.
//  Copyright © 2016 Dhruval Darji. All rights reserved.
//

import Foundation
import SpriteKit

class Card : SKSpriteNode {
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    let defaultScale : CGFloat = 1.0
    let activeScale : CGFloat = 1.25
    let defaultDuration : NSTimeInterval = 0.2
    let flipDuration : NSTimeInterval = 0.1
    
    let ShouldWiggle : Bool = false;
    
    var BackTexture : SKTexture
    var FrontTexture : SKTexture
    var Suit : String = ""
    var Value : Int = 0
    var FaceUp : Bool = true
    var CardPos: CGPoint = CGPointZero
    var enlarged = false
    var dragZ : CGFloat = -1
    var Dragging = false;
    
    init(backImage: String, frontImage: String) {
        // set properties defined in super
        BackTexture = SKTexture(imageNamed: backImage)
        FrontTexture = SKTexture(imageNamed: frontImage)
                
        // call designated initializer on super
        super.init(texture: FrontTexture, color: UIColor.whiteColor(), size: Constants().HalfSize(BackTexture.size()))
        setScale(defaultScale)
        
        userInteractionEnabled = true
    }
    
    convenience init(backImage: String, frontImage: String, suit : String, value : Int) {
        self.init(backImage: backImage, frontImage: frontImage)
        Suit = suit
        Value = value
    }
    
    convenience init(backImage: String, frontImage: String, pos : CGPoint) {
        self.init(backImage: backImage, frontImage: frontImage)
        CardPos = pos
    }
    
    convenience init(backImage: String, frontImage: String, pos: CGPoint, faceUp : Bool) {
        self.init(backImage: backImage, frontImage: frontImage, pos: pos)
        FaceUp = faceUp
    }
    
    convenience init(backImage: String, frontImage: String, suit : String, value : Int, pos : CGPoint) {
        self.init(backImage: backImage, frontImage: frontImage, suit: suit, value: value)
        CardPos = pos
    }
    
    convenience init(backImage: String, frontImage: String, suit : String, value : Int, pos: CGPoint, faceUp : Bool) {
        self.init(backImage: backImage, frontImage: frontImage, suit: suit, value: value, pos: pos)
        FaceUp = faceUp
    }
    
    
    //MARK: Touch Handlers
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            touch.timestamp
            if !userInteractionEnabled {return}
            if enlarged { return }
            
            // note: removed references to touchedNode
            // 'self' in most cases is not required in Swift
            Dragging = true;
            dragZ = zPosition
            zPosition = 999
            let liftUp = SKAction.scaleTo(activeScale, duration: defaultDuration)
            runAction(liftUp)
            
            if(ShouldWiggle){
                let wiggleIn = SKAction.scaleXTo(defaultScale, duration: defaultDuration)
                let wiggleOut = SKAction.scaleXTo(activeScale, duration: defaultDuration)
                let wiggle = SKAction.sequence([wiggleIn, wiggleOut])
                let wiggleRepeat = SKAction.repeatActionForever(wiggle)
                
                // again, since this is the touched sprite
                // run the action on self (implied)
                runAction(wiggleRepeat, withKey: "wiggle")
            }
           
        }

    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if enlarged { return }
        
        for touch in touches {
            let location = touch.locationInNode(scene!)  // make sure this is scene, not self
            position = location
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if enlarged { return }
        
        for touch in touches {
            touch.timestamp; // Do something to make useless "_" warning go away.
            Dragging = false
            zPosition = dragZ
            
            let dropDown = SKAction.scaleTo(defaultScale, duration: defaultDuration)
            runAction(dropDown)
            
            removeActionForKey("wiggle")
        }
    }
    
    //MARK: Card Actions
    
    func flip() {
        let firstHalfFlip = SKAction.scaleXTo(0.0, duration: flipDuration)
        let secondHalfFlip = SKAction.scaleXTo(defaultScale, duration: flipDuration)
        
        setScale(defaultScale)
        
        if FaceUp {
            runAction(firstHalfFlip) {
                self.texture = self.BackTexture
                self.FaceUp = false
                self.runAction(secondHalfFlip)
            }
        } else {
            runAction(firstHalfFlip) {
                self.texture = self.FrontTexture
                self.FaceUp = true
                self.runAction(secondHalfFlip)
            }
        }
    }
    
}