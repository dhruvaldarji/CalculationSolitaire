//
//  Constants.swift
//  CountingSolitaire
//
//  Created by Dhruval Darji on 4/24/16.
//  Copyright © 2016 Dhruval Darji. All rights reserved.
//

import UIKit

class Constants {
    let greenColor = UIColor(red: 30.0/255.0, green: 181.0/255.0, blue: 88.0/255.0, alpha: 1.0)
    
    let whiteColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
    
    let cardBack : String = "cardBack_blue1"
    
    let pile_base : String = "pile_base"
    
    let sizeModifier : CGFloat = 0.8
    
    let ClubsA : CardDetails = CardDetails(imageName: "cardClubsA", suit: "Clubs", value: 1)
    let Clubs2 : CardDetails = CardDetails(imageName: "cardClubs2", suit: "Clubs", value: 2)
    let Clubs3 : CardDetails = CardDetails(imageName: "cardClubs3", suit: "Clubs", value: 3)
    let Clubs4 : CardDetails = CardDetails(imageName: "cardClubs4", suit: "Clubs", value: 4)
    let Clubs5 : CardDetails = CardDetails(imageName: "cardClubs5", suit: "Clubs", value: 5)
    let Clubs6 : CardDetails = CardDetails(imageName: "cardClubs6", suit: "Clubs", value: 6)
    let Clubs7 : CardDetails = CardDetails(imageName: "cardClubs7", suit: "Clubs", value: 7)
    let Clubs8 : CardDetails = CardDetails(imageName: "cardClubs8", suit: "Clubs", value: 8)
    let Clubs9 : CardDetails = CardDetails(imageName: "cardClubs9", suit: "Clubs", value: 9)
    let Clubs10 : CardDetails = CardDetails(imageName: "cardClubs10", suit: "Clubs", value: 10)
    let ClubsJ : CardDetails = CardDetails(imageName: "cardClubsJ", suit: "Clubs", value: 11)
    let ClubsQ : CardDetails = CardDetails(imageName: "cardClubsQ", suit: "Clubs", value: 12)
    let ClubsK : CardDetails = CardDetails(imageName: "cardClubsK", suit: "Clubs", value: 13)
    
    let DiamondsA : CardDetails = CardDetails(imageName: "cardDiamondsA", suit: "Diamonds", value: 1)
    let Diamonds2 : CardDetails = CardDetails(imageName: "cardDiamonds2", suit: "Diamonds", value: 2)
    let Diamonds3 : CardDetails = CardDetails(imageName: "cardDiamonds3", suit: "Diamonds", value: 3)
    let Diamonds4 : CardDetails = CardDetails(imageName: "cardDiamonds4", suit: "Diamonds", value: 4)
    let Diamonds5 : CardDetails = CardDetails(imageName: "cardDiamonds5", suit: "Diamonds", value: 5)
    let Diamonds6 : CardDetails = CardDetails(imageName: "cardDiamonds6", suit: "Diamonds", value: 6)
    let Diamonds7 : CardDetails = CardDetails(imageName: "cardDiamonds7", suit: "Diamonds", value: 7)
    let Diamonds8 : CardDetails = CardDetails(imageName: "cardDiamonds8", suit: "Diamonds", value: 8)
    let Diamonds9 : CardDetails = CardDetails(imageName: "cardDiamonds9", suit: "Diamonds", value: 9)
    let Diamonds10 : CardDetails = CardDetails(imageName: "cardDiamonds10", suit: "Diamonds", value: 10)
    let DiamondsJ : CardDetails = CardDetails(imageName: "cardDiamondsJ", suit: "Diamonds", value: 11)
    let DiamondsQ : CardDetails = CardDetails(imageName: "cardDiamondsQ", suit: "Diamonds", value: 12)
    let DiamondsK : CardDetails = CardDetails(imageName: "cardDiamondsK", suit: "Diamonds", value: 13)
    
    let HeartsA : CardDetails = CardDetails(imageName: "cardHeartsA", suit: "Hearts", value: 1)
    let Hearts2 : CardDetails = CardDetails(imageName: "cardHearts2", suit: "Hearts", value: 2)
    let Hearts3 : CardDetails = CardDetails(imageName: "cardHearts3", suit: "Hearts", value: 3)
    let Hearts4 : CardDetails = CardDetails(imageName: "cardHearts4", suit: "Hearts", value: 4)
    let Hearts5 : CardDetails = CardDetails(imageName: "cardHearts5", suit: "Hearts", value: 5)
    let Hearts6 : CardDetails = CardDetails(imageName: "cardHearts6", suit: "Hearts", value: 6)
    let Hearts7 : CardDetails = CardDetails(imageName: "cardHearts7", suit: "Hearts", value: 7)
    let Hearts8 : CardDetails = CardDetails(imageName: "cardHearts8", suit: "Hearts", value: 8)
    let Hearts9 : CardDetails = CardDetails(imageName: "cardHearts9", suit: "Hearts", value: 9)
    let Hearts10 : CardDetails = CardDetails(imageName: "cardHearts10", suit: "Hearts", value: 10)
    let HeartsJ : CardDetails = CardDetails(imageName: "cardHeartsJ", suit: "Hearts", value: 11)
    let HeartsQ : CardDetails = CardDetails(imageName: "cardHeartsQ", suit: "Hearts", value: 12)
    let HeartsK : CardDetails = CardDetails(imageName: "cardHeartsK", suit: "Hearts", value: 13)

    
    let SpadesA : CardDetails = CardDetails(imageName: "cardSpadesA", suit: "Spades", value: 1)
    let Spades2 : CardDetails = CardDetails(imageName: "cardSpades2", suit: "Spades", value: 2)
    let Spades3 : CardDetails = CardDetails(imageName: "cardSpades3", suit: "Spades", value: 3)
    let Spades4 : CardDetails = CardDetails(imageName: "cardSpades4", suit: "Spades", value: 4)
    let Spades5 : CardDetails = CardDetails(imageName: "cardSpades5", suit: "Spades", value: 5)
    let Spades6 : CardDetails = CardDetails(imageName: "cardSpades6", suit: "Spades", value: 6)
    let Spades7 : CardDetails = CardDetails(imageName: "cardSpades7", suit: "Spades", value: 7)
    let Spades8 : CardDetails = CardDetails(imageName: "cardSpades8", suit: "Spades", value: 8)
    let Spades9 : CardDetails = CardDetails(imageName: "cardSpades9", suit: "Spades", value: 9)
    let Spades10 : CardDetails = CardDetails(imageName: "cardSpades10", suit: "Spades", value: 10)
    let SpadesJ : CardDetails = CardDetails(imageName: "cardSpadesJ", suit: "Spades", value: 11)
    let SpadesQ : CardDetails = CardDetails(imageName: "cardSpadesQ", suit: "Spades", value: 12)
    let SpadesK : CardDetails = CardDetails(imageName: "cardSpadesK", suit: "Spades", value: 13)

    
    let Joker : CardDetails = CardDetails(imageName: "cardJoker", suit: "Joker", value: 0)
    
    func HalfSize(size : CGSize) -> CGSize {
        var halfSize : CGSize = CGSizeZero
        halfSize.height = size.height * sizeModifier
        halfSize.width = size.width * sizeModifier
        return halfSize
    }

}

