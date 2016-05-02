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
    
    var F1Label = SKLabelNode(fontNamed:"System")
    var F2Label = SKLabelNode(fontNamed:"System")
    var F3Label = SKLabelNode(fontNamed:"System")
    var F4Label = SKLabelNode(fontNamed:"System")


    let Tableau1 = Tableau()
    let Tableau2 = Tableau()
    let Tableau3 = Tableau()
    let Tableau4 = Tableau()
    
    
    let Timer = SKLabelNode(fontNamed:"System")
    
    var startTime = NSTimeInterval()
    var gameTimer = NSTimer()
    
    var win = false;
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */

        DrawPiles(view)

//        DrawScore(view)
//
        DrawTimer(view)
        
        DrawQuit(view)
        
        DrawPileCounts(view)
        
        DrawCards(view)
        
        myDeck.Shuffle()
        fixDeckZIndex()
        
        SetFoundationCards()
        
        let aSelector : Selector = #selector(BoardScene.updateTime)
        gameTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate()
        
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
    
    func updateTime() {
        
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        //Find the difference between current time and start time.
        
        var elapsedTime: NSTimeInterval = currentTime - startTime
        
        //calculate the minutes in elapsed time.
        
        let hours = UInt8(elapsedTime / 3600.0)
        
        elapsedTime -= (NSTimeInterval(hours) * 3600.0)
        
        //calculate the minutes in elapsed time.
        
        let minutes = UInt8(elapsedTime / 60.0)
        
        elapsedTime -= (NSTimeInterval(minutes) * 60)
        
        //calculate the seconds in elapsed time.
        
        let seconds = UInt8(elapsedTime)
        
        elapsedTime -= NSTimeInterval(seconds)
        
        //find out the fraction of milliseconds to be displayed.
        
//        let fraction = UInt8(elapsedTime * 100)
        
        //add the leading zero for minutes, seconds and millseconds and store them as string constants
        
        let strHours = String(format: "%02d", hours)
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
//        let strFraction = String(format: "%02d", fraction)
        
        //concatenate minuets, seconds and milliseconds as assign it to the UILabel
        
        Timer.text = "\(strHours):\(strMinutes):\(strSeconds)"
        
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
        
        UpdatePileCounts()
        
        CheckForWin()

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
        
        pileRect = getRect(Tableau1)
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
        let movePile : Pile = returnPileByIndex(movePosition);
        
        // If moving to origin, ignore and return.
        if(movePosition == returnPosition){
            card.position = card.CardPos;
            return
        }
        
        // If on a tableau and attempting to move to another tableau, ignore and return.
        else if(returnPosition >= 5 && movePosition >= 5 && movePile.Cards.count > 0){
            card.position = card.CardPos;
            return
        }
        
        if let pile = movePile as? Foundation {
            // pile is a Foundation. Do something with pile
            if(pile.Cards.count < 13){
                if(card.Value == pile.NextValue){
                    pile.AddCard(returnPile.GetCard(card))
                    return
                }
            }
            else {
                card.position = card.CardPos
                return
            }
            
        }
        else if let pile = movePile as? Tableau {
            // pile is a Tableau. Do something with pile
            // Don't let the player add more than 10 cards to a pile. (So it doesn't go off the screen.)
            if(pile.Cards.count < 10){
                if(!pile.HasCard(card)){
                    pile.AddCard(returnPile.GetCard(card))
                    return
                }
            }
            else {
                card.position = card.CardPos
                return
            }

        }
        else {
            card.position = card.CardPos
            return
        }
        
        // If we get this far, something weird happened. Return to origin.
        card.position = card.CardPos
    }
    
    func getRect(pile : Pile) -> CGRect {
        var rect = CGRect(origin: Tableau1.position, size: Tableau1.size)
        let origin = rect.origin
        let size = rect.size
        
        rect.origin.y = origin.y - CGFloat(pile.Cards.count * 15)
        rect.size.height = size.height + CGFloat(pile.Cards.count * 30)
        
        return rect
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
        
        Foundation1.position = CGPointMake(300, 525)
        Foundation1.name = "F1"
        addChild(Foundation1)
        
        Foundation2.position = CGPointMake(450, 525)
        Foundation2.name = "F2"
        addChild(Foundation2)
        
        Foundation3.position = CGPointMake(600, 525)
        Foundation3.name = "F3"
        addChild(Foundation3)
        
        Foundation4.position = CGPointMake(750, 525)
        Foundation4.name = "F4"
        addChild(Foundation4)
        
        
        // Tableaus
        
        Tableau1.position = CGPointMake(300, 350)
        Tableau1.name = "T1"
        addChild(Tableau1)
        
        Tableau2.position = CGPointMake(450, 350)
        Tableau2.name = "T2"
        addChild(Tableau2)
        
        Tableau3.position = CGPointMake(600, 350)
        Tableau3.name = "T3"
        addChild(Tableau3)
        
        Tableau4.position = CGPointMake(750, 350)
        Tableau4.name = "T4"
        addChild(Tableau4)
        
        // Deck
        
        myDeck.position = CGPointMake(100, 525)
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
    
    func DrawPileCounts(view: SKView){
        F1Label.text = "0"
        F1Label.fontSize = 30
        F1Label.fontColor = Constants().whiteColor
        F1Label.position = CGPointMake(300, 625)
        F1Label.name = "F1Label"
        self.addChild(F1Label)
        
        F2Label.text = "0"
        F2Label.fontSize = 30
        F2Label.fontColor = Constants().whiteColor
        F2Label.position = CGPointMake(450, 625)
        F2Label.name = "F2Label"
        self.addChild(F2Label)

        F3Label.text = "0"
        F3Label.fontSize = 30
        F3Label.fontColor = Constants().whiteColor
        F3Label.position = CGPointMake(600, 625)
        F3Label.name = "F3Label"
        self.addChild(F3Label)

        F4Label.text = "0"
        F4Label.fontSize = 30
        F4Label.fontColor = Constants().whiteColor
        F4Label.position = CGPointMake(750, 625)
        F4Label.name = "F4Label"
        self.addChild(F4Label)


    }
    
    func UpdatePileCounts(){
        if(Foundation1.Cards.count < 13){
            F1Label.text = Constants().StringValue(Foundation1.NextValue);
        }
        else {
            F1Label.text = "✔"
        }
        
        if(Foundation2.Cards.count < 13){
            F2Label.text = Constants().StringValue(Foundation2.NextValue);
        }
        else {
            F2Label.text = "✔"
        }
        
        if(Foundation3.Cards.count < 13){
            F3Label.text = Constants().StringValue(Foundation3.NextValue);
        }
        else {
            F3Label.text = "✔"
        }
        
        if(Foundation4.Cards.count < 13){
            F4Label.text = Constants().StringValue(Foundation4.NextValue);
        }
        else {
            F4Label.text = "✔"
        }

    }
    
    func CheckForWin(){
        if(win || (Foundation1.Cards.count == 13 && Foundation2.Cards.count == 13 && Foundation3.Cards.count == 13 && Foundation4.Cards.count == 13)){
            win = true;
            
            // Stop Timer
            gameTimer.invalidate()
            
            // Display Win Label
            let WinLabel = SKLabelNode(fontNamed:"System")
            WinLabel.text = "You Win!"
            WinLabel.fontSize = 65
            WinLabel.fontColor = Constants().whiteColor
            WinLabel.position = CGPointMake(525, 175)
            WinLabel.name = "WinLabel"
            self.addChild(WinLabel)

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
        TimerLabel.position = CGPointMake(875, 550)
        TimerLabel.name = "TimerLabel"
        self.addChild(TimerLabel)
        
        Timer.text = "00:00:00"
        Timer.fontSize = 25
        Timer.fontColor = Constants().whiteColor
        Timer.position = CGPointMake(935, 525)
        Timer.name = "Timer"
        self.addChild(Timer)

    }
    
    func DrawQuit(view: SKView){
        let QuitButton = SKLabelNode(fontNamed:"System")
        QuitButton.text = "Quit Game"
        QuitButton.fontSize = 35
        QuitButton.fontColor = Constants().whiteColor
        QuitButton.position = CGPointMake(900, 300)
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
