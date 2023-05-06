//
//  SetGameApp.swift
//  SetGame
//
//  Created by Joao Barros on 03/05/23.
//

import SwiftUI

@main
struct SetGameApp: App {
    let game = GameController()
    var body: some Scene {
        WindowGroup {
            GameView(controller: game)
        }
    }
}
