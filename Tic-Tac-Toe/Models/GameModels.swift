//
//  GameModel.swift
//  Tic-Tac-Toe
//
//  Created by Lulu Wu on 6/19/24.
//

import SwiftUI

enum GameType {
    case single, bot, peer, undetermined
    
    var description: String {
        switch self {
        case .single:
            return "Share the game and play against a friend."
        case .bot:
            return "Play against the PC"
        case .peer:
            return "Invite your friend near you who has the app running to play"
        case .undetermined:
            return ""
        }
    }
}

enum GamePiece: String {
    case x, o
    var image: Image {
        Image(self.rawValue)
    }
}


struct Player {
    let gamePiece: GamePiece
    var name: String
    var moves: [Int] = []
    var isCurrent = false
    var isWinner: Bool {
        for moves in Move.winningMoves {
            if moves.allSatisfy(self.moves.contains) {
                return true
            }
        }
        return false
    }
}

enum Move {
    static var all = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    static var winningMoves = [
        // row
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
        // coloumn
        [1, 4, 7],
        [2, 5, 8],
        [3, 6, 9],
        // dialog
        [1, 5, 9],
        [3, 5, 7]
    ]
}
