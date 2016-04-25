//
//  StartGameScene.swift
//  CountingSolitaire
//
//  Created by Dhruval Darji on 4/24/16.
//  Copyright © 2016 Dhruval Darji. All rights reserved.
//

import UIKit
import SpriteKit

class StartGameScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        backgroundColor = Constants().greenColor
        
        let GameTitle = SKLabelNode(fontNamed:"System")
        GameTitle.text = "Calculation Solitaire"
        GameTitle.fontSize = 50
        GameTitle.fontColor = Constants().whiteColor
        GameTitle.position = CGPointMake(size.width/2,size.height/2 + 50)
        
        self.addChild(GameTitle)

        
        let startGameButton = SKLabelNode(fontNamed:"System")
        startGameButton.text = "New Game"
        startGameButton.fontSize = 50
        startGameButton.fontColor = Constants().whiteColor
        startGameButton.position = CGPointMake(size.width/2,size.height/2 - 50)
        startGameButton.name = "StartGame"
        addChild(startGameButton)
    
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            let nodes = self.nodesAtPoint(location) as [SKNode]
            
            for node in nodes {
                if node.name == "StartGame" {
                    node.alpha = 1.0
                    StartNewGameScene()
                }
            }
        }
    }
    
    func StartNewGameScene(){
        let gameScene = BoardScene(fileNamed: "BoardScene")
        gameScene!.scaleMode = .AspectFill
        let transitionType = SKTransition.fadeWithDuration(0.75)
        view?.presentScene(gameScene!,transition: transitionType)
    }
    
}