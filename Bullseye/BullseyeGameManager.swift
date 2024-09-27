//
//  BullseyeGameManager.swift
//  Bullseye
//
//  Created by Zarina Sadykova on 18.09.24.
//

import Foundation

class BullseyeGameManager {
    var guessingNumberLabel: Int
    var score: Int
    var round: Int
    
    init() {
        self.guessingNumberLabel = Int.random(in: 1...100)
        self.score = 0
        self.round = 1
    }
    
    func didWintheGame() {
        guessingNumberLabel = Int.random(in: 1...100)
        score += 100
        round += 1
    }
    
    func didNotWintheGame() {
        guessingNumberLabel = Int.random(in: 1...100)
        //        score = 0
        round += 1
    }
    
    func resetGame() {
        round = 1
        score = 0
            // Логика сброса других переменных
    }
}
