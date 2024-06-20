//
//  ContentView.swift
//  Tic-Tac-Toe
//
//  Created by Lulu Wu on 6/19/24.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var game: GameService
    @State private var gameType: GameType = .undetermined
    @State private var name = ""
    @State private var opponentName = ""
    @FocusState private var focus: Bool
    @State private var startGame = false

    var body: some View {
        VStack {
            Picker("Select Game", selection: $gameType) {
                Text("Select Game Type").tag(GameType.undetermined)
                Text("Two sharing device").tag(GameType.single)
                Text("Challenge your device").tag(GameType.bot)
                Text("Challenge a friend").tag(GameType.peer)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(lineWidth: 2))
//            .accentColor(.primary)
            Text(gameType.description)
                .padding()
            VStack {
                switch gameType {
                case .single:
                    VStack {
                        TextField("Enter player 1's name", text: $name)
                        TextField("Enter player 2's name", text: $opponentName)
                    }
                case .bot:
                    TextField("Enter your name", text: $name)
                case .peer:
                    EmptyView()
                case .undetermined:
                    EmptyView()
                }
            }
            .padding()
            .textFieldStyle(.roundedBorder)
            .focused($focus)
            .frame(width: 350)
            
            if gameType != .peer {
                Button("Start Game") {
                    game.setupGame(gameType: gameType, player1Name: name, player2Name: opponentName)
                    focus = false
                    startGame.toggle()
                }
                .buttonStyle(.borderedProminent)
                .disabled(
                    gameType == .undetermined ||
                    gameType == .bot && name.isEmpty ||
                    gameType == .single && (name.isEmpty || opponentName.isEmpty)
                )
                Image("LaunchScreen")
            }
                Spacer()
        }
        .padding()
        .navigationTitle("Tic-Tac-Toe")
        .fullScreenCover(isPresented: $startGame) {
            GameView()
        }
        .inNavigationStack()
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
            .environmentObject(GameService())
    }
}
