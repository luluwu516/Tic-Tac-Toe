//
//  SquareView.swift
//  Tic-Tac-Toe
//
//  Created by Lulu Wu on 6/19/24.
//

import SwiftUI

struct SquareView: View {
    @EnvironmentObject var game: GameService
    let index: Int
    var body: some View {
        Button {
            if !game.isThinking {
                game.makeMove(at: index)
            }
        } label: {
            game.gameBoard[index].image
                .resizable()
                .frame(width: 100, height: 100)
        }
        .disabled(game.gameBoard[index].player != nil)
        .foregroundColor(.primary)
    }
}

struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        SquareView(index: 1)
            .environmentObject(GameService())
    }
}
