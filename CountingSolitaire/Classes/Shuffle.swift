//
//  Shuffle.swift
//  Solitaire
//
//  Created by Dhruval Darji on 4/25/16.
//  Copyright © 2016 Dhruval Darji. All rights reserved.
//

import Foundation

extension Array {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffle() {
        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            if(i != j) {
                swap(&self[i], &self[j])
            }
        }
    }
    
    /// Return a copy of `self` with its elements shuffled
    func shuffled() -> [Element] {
        var list = self
        list.shuffle()
        return list
    }
}