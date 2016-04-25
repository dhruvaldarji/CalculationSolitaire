//
//  CardDetails.swift
//  Solitaire
//
//  Created by Dhruval Darji on 4/25/16.
//  Copyright © 2016 Dhruval Darji. All rights reserved.
//

import Foundation

struct CardDetails {
    var ImageName : String
    var Suit : String
    var Value : Int
    
    init(imageName : String, suit : String, value : Int){
        ImageName = imageName
        Suit = suit
        Value = value
    }
}
