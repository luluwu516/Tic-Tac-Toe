//
//  Tic_Tac_ToeApp.swift
//  Tic-Tac-Toe
//
//  Created by Lulu Wu on 6/19/24.
//

import SwiftUI

@main
struct AppEntry: App {
    @AppStorage("userName") var userName = ""
    @StateObject var game = GameService()
    
    var body: some Scene {
        WindowGroup {
            if userName.isEmpty {
                UserNameView()
            } else {
                StartView(name: userName)
                .environmentObject(game)
            }
        }
    }
}
