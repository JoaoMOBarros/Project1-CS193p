//
//  ContentView.swift
//  SetGame
//
//  Created by Joao Barros on 03/05/23.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var controller: Controller
    
    var body: some View {
        VStack {
            HStack{
                Text("Set Game")
                    .font(.title)
                Spacer()
                Button(action: controller.startNewGame){
                    Image(systemName: "plus")
                    Text("New Game")
                }
            }
            VStack{}
            HStack{
                Button(action: controller.drawCards){
                    Image(systemName: "plus")
                    Text("New Game")
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = Controller()
        GameView(controller: game)
    }
}
