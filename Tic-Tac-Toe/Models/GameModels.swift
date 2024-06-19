//
//  GameModel.swift
//  Tic-Tac-Toe
//
//  Created by Lulu Wu on 6/19/24.
//

import Foundation

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
