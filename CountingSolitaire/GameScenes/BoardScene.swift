//
//  GameScene.swift
//  CountingSolitaire
//
//  Created by Dhruval Darji on 4/24/16.
//  Copyright (c) 2016 Dhruval Darji. All rights reserved.
//

import SpriteKit

class BoardScene: SKScene {
    
    let myDeck = Deck()
    
    let Foundation1 = Foundation(mult: 1)
    let Foundation2 = Foundation(mult: 2)
    let Foundation3 = Foundation(mult: 3)
    let Foundation4 = Foundation(mult: 4)

    let Tableau1 = Tableau()
    let Tableau2 = Tableau()
    let Tableau3 = Tableau()
    let Tableau4 = Tableau()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */

        DrawPiles(view)

        DrawScore(view)

        DrawTimer(view)
        
        DrawQuit(view)
        
        DrawCards(view)
        
        myDeck.Shuffle()
        fixDeckZIndex()
        
        SetFoundationCards()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            let nodes = self.nodesAtPoint(location) as [SKNode]
            
            for node in nodes {
                if node.name == "Quit" {
                    node.alpha = 1.0
                    MenuScene()
                }
            }
        }

    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch ends */
    }

    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        for(_, card) in myDeck.Cards.enumerate(){
            if(card.position != myDeck.position && !card.Dragging){
                calculatePileRects(card)
            }
        }
        
        for(_, card) in Tableau1.Cards.enumerate(){
            if(card.position != Tableau1.position && !card.Dragging){
                calculatePileRects(card)
            }
        }

        
        for(_, card) in Tableau2.Cards.enumerate(){
            if(card.position != Tableau2.position && !card.Dragging){
                calculatePileRects(card)
            }
        }

        
        for(_, card) in Tableau3.Cards.enumerate(){
            if(card.position != Tableau3.position && !card.Dragging){
                calculatePileRects(card)
            }
        }

        
        for(_, card) in Tableau4.Cards.enumerate(){
            if(card.position != Tableau4.position && !card.Dragging){
                calculatePileRects(card)
            }
        }

    }
    
    func calculatePileRects(card: Card) {
        let pos = CGPoint(x: card.position.x + card.size.width/2, y: card.position.y + card.size.height/2)
        
        var returnPosition : Int = -1
        var movePosition : Int = -1
        
        var pileRect = CGRect(origin: myDeck.position, size: myDeck.size)
        if(myDeck.Cards.contains(card)){
            returnPosition = 0
        }
        if(pileRect.contains(pos)){
            movePosition = 0
        }
        
        pileRect = CGRect(origin: Foundation1.position, size: Foundation1.size)
        if(Foundation1.Cards.contains(card)){
            returnPosition = 1
        }
        if(pileRect.contains(pos)){
            movePosition = 1
        }
        
        pileRect = CGRect(origin: Foundation2.position, size: Foundation2.size)
        if(Foundation2.Cards.contains(card)){
            returnPosition = 2
        }
        if(pileRect.contains(pos)){
            movePosition = 2
        }
                
        pileRect = CGRect(origin: Foundation3.position, size: Foundation3.size)
        if(Foundation3.Cards.contains(card)){
            returnPosition = 3
        }
        if(pileRect.contains(pos)){
            movePosition = 3
        }
        
        pileRect = CGRect(origin: Foundation4.position, size: Foundation4.size)
        if(Foundation4.Cards.contains(card)){
            returnPosition = 4
        }
        if(pileRect.contains(pos)){
            movePosition = 4
        }
        
        pileRect = CGRect(origin: Tableau1.position, size: Tableau1.size)
        if(Tableau1.Cards.contains(card)){
            returnPosition = 5
        }
        if(pileRect.contains(pos)){
            movePosition = 5
        }
        
        pileRect = CGRect(origin: Tableau2.position, size: Tableau2.size)
        if(Tableau2.Cards.contains(card)){
            returnPosition = 6
        }
        if(pileRect.contains(pos)){
            movePosition = 6
        }
        
        pileRect = CGRect(origin: Tableau3.position, size: Tableau3.size)
        if(Tableau3.Cards.contains(card)){
            returnPosition = 7
        }
        if(pileRect.contains(pos)){
            movePosition = 7
        }
        
        pileRect = CGRect(origin: Tableau4.position, size: Tableau4.size)
        if(Tableau4.Cards.contains(card)){
            returnPosition = 8
        }
        if(pileRect.contains(pos)){
            movePosition = 8
        }
        
        let returnPile : Pile = returnPileByIndex(returnPosition);
        
        if(movePosition == returnPosition){
            card.position = card.CardPos;
            return
        }
        
        switch movePosition {
//        case 0: // Deck
//            card.position = myDeck.position
//            break;
        case 1: // F1
            if(card.Value == (Foundation1.Cards.last?.Value)! + Foundation1.Multiplier){
                Foundation1.AddCard(returnPile.GetCard(card))
                return
            }
        case 2: // F2
            if(card.Value == (Foundation2.Cards.last?.Value)! + Foundation2.Multiplier){
                Foundation2.AddCard(returnPile.GetCard(card))
                return
            }
        case 3: // F3
            if(card.Value == (Foundation3.Cards.last?.Value)! + Foundation3.Multiplier){
                Foundation3.AddCard(returnPile.GetCard(card))
                return
            }
        case 4: // F4
            if(card.Value == (Foundation4.Cards.last?.Value)! + Foundation4.Multiplier){
                Foundation4.AddCard(returnPile.GetCard(card))
                return
            }
        case 5: // T1
            if(!Tableau1.HasCard(card)){
                Tableau1.AddCard(returnPile.GetCard(card))
                return
            }
        case 6: // T2
            if(!Tableau2.HasCard(card)){
                Tableau2.AddCard(returnPile.GetCard(card))
                return
            }
        case 7: // T3
            if(!Tableau3.HasCard(card)){
                Tableau3.AddCard(returnPile.GetCard(card))
                return
            }
        case 8: // T4
            if(!Tableau4.HasCard(card)){
                Tableau4.AddCard(returnPile.GetCard(card))
                return
            }
        default:
            card.position = card.CardPos
        }
        card.position = card.CardPos
    }
    
    func returnPileByIndex(index : Int) -> Pile {
        switch index {
        case 0: // Deck
            return myDeck
        case 1: // F1
            return Foundation1
        case 2: // F2
            return Foundation2
        case 3: // F3
            return Foundation3
        case 4: // F4
            return Foundation4
        case 5: // T1
            return Tableau1
        case 6: // T2
            return Tableau2
        case 7: // T3
            return Tableau3
        case 8: // T4
            return Tableau4
        default:
            return myDeck
        }
    }
    
    func fixDeckZIndex(){
        for (index, card) in myDeck.Cards.enumerate(){
            card.zPosition = myDeck.zPosition + CGFloat(1 + index)
        }
    }
    
    func MenuScene(){
        let gameScene = StartGameScene(size: view!.bounds.size)
        gameScene.scaleMode = .AspectFill
        let transitionType = SKTransition.fadeWithDuration(0.75)
        view?.presentScene(gameScene, transition: transitionType)
    }

    
    func DrawPiles(view: SKView) {
        
        // Foundations
        
        Foundation1.position = CGPointMake(300, 575)
        Foundation1.name = "F1"
        addChild(Foundation1)
        
        Foundation2.position = CGPointMake(450, 575)
        Foundation2.name = "F2"
        addChild(Foundation2)
        
        Foundation3.position = CGPointMake(600, 575)
        Foundation3.name = "F3"
        addChild(Foundation3)
        
        Foundation4.position = CGPointMake(750, 575)
        Foundation4.name = "F4"
        addChild(Foundation4)
        
        
        // Tableaus
        
        Tableau1.position = CGPointMake(300, 400)
        Tableau1.name = "T1"
        addChild(Tableau1)
        
        Tableau2.position = CGPointMake(450, 400)
        Tableau2.name = "T2"
        addChild(Tableau2)
        
        Tableau3.position = CGPointMake(600, 400)
        Tableau3.name = "T3"
        addChild(Tableau3)
        
        Tableau4.position = CGPointMake(750, 400)
        Tableau4.name = "T4"
        addChild(Tableau4)
        
        // Deck
        
        myDeck.position = CGPointMake(100, 575)
        myDeck.name = "D"
        addChild(myDeck)
        
    }
    
    func DrawCards(view : SKView){
        // Add Cards to the Deck
        for card in DefaultDeck().Cards {
            let thisCard = Card(backImage: Constants().cardBack, frontImage: card.ImageName, suit: card.Suit, value: card.Value)
            thisCard.name = card.ImageName
            myDeck.AddCard(thisCard)
            addChild(thisCard)
        }

    }
    
    func DrawScore(view : SKView){
        let ScoreLabel = SKLabelNode(fontNamed:"System")
        ScoreLabel.text = "Score:"
        ScoreLabel.fontSize = 35
        ScoreLabel.fontColor = Constants().whiteColor
        ScoreLabel.position = CGPointMake(875, 600)
        ScoreLabel.name = "ScoreLabel"
        self.addChild(ScoreLabel)
        
        let Score = SKLabelNode(fontNamed:"System")
        Score.text = "000000"
        Score.fontSize = 20
        Score.fontColor = Constants().whiteColor
        Score.position = CGPointMake(925, 575)
        ScoreLabel.name = "Score"
        self.addChild(Score)


    }
    
    func DrawTimer(view : SKView){
        let TimerLabel = SKLabelNode(fontNamed:"System")
        TimerLabel.text = "Timer:"
        TimerLabel.fontSize = 35
        TimerLabel.fontColor = Constants().whiteColor
        TimerLabel.position = CGPointMake(875, 425)
        TimerLabel.name = "TimerLabel"
        self.addChild(TimerLabel)
        
        let Timer = SKLabelNode(fontNamed:"System")
        Timer.text = "00:00:00"
        Timer.fontSize = 20
        Timer.fontColor = Constants().whiteColor
        Timer.position = CGPointMake(935, 400)
        Timer.name = "Timer"
        self.addChild(Timer)

    }
    
    func DrawQuit(view: SKView){
        let QuitButton = SKLabelNode(fontNamed:"System")
        QuitButton.text = "Quit Game"
        QuitButton.fontSize = 35
        QuitButton.fontColor = Constants().whiteColor
        QuitButton.position = CGPointMake(900, 200)
        QuitButton.name = "Quit"
        self.addChild(QuitButton)
    }
    
    func SetFoundationCards(){
        var Foundations : [Int] = [1,2,3,4]
        var found = 0;
        let deck = myDeck.Cards
        for (index, card) in deck.enumerate(){
            switch card.Value {
            case 1:
                if(Foundations.contains(1)){
                    Foundations.removeAtIndex(Foundations.indexOf(1)!)
                    Foundation1.AddCard(myDeck.GetAtIndex(index-found))
                    found += 1;
                }
                break;
            case 2:
                if(Foundations.contains(2)){
                    Foundations.removeAtIndex(Foundations.indexOf(2)!)
                    Foundation2.AddCard(myDeck.GetAtIndex(index-found))
                    found += 1;
                }
                break;
            case 3:
                if(Foundations.contains(3)){
                    Foundations.removeAtIndex(Foundations.indexOf(3)!)
                    Foundation3.AddCard(myDeck.GetAtIndex(index-found))
                    found += 1;
                }
                break;
            case 4:
                if(Foundations.contains(4)){
                    Foundations.removeAtIndex(Foundations.indexOf(4)!)
                    Foundation4.AddCard(myDeck.GetAtIndex(index-found))
                    found += 1;
                }
                break;
            default:
                break;
            }
            
            if(Foundations.isEmpty){
                break;
            }
        }
        
    }
    
}
