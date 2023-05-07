//
//  ContentView.swift
//  SetGame
//
//  Created by Joao Barros on 03/05/23.
//

import SwiftUI

extension Color{
    static let offWhite = Color(red: 225/255, green: 225/255, blue: 235/255)
    static let offWhiteSelected = Color(red: 205/255, green: 205/255, blue: 215/255)
}

struct GameView: View {
    
    @ObservedObject var controller: GameController
    
    let cards = [1,2,3,4,5]
    
    var body: some View {
        ZStack{
            Color.offWhite
            VStack {
                Spacer(minLength: 50)
                HStack{
                    Text("Set Game")
                        .font(.title)
                    Spacer()
                    Button(action: controller.startNewGame){
                        Image(systemName: "square.stack.3d.up")
                        Text("New Game")
                    }
                }
                Spacer()
                ScrollView{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: DrawingConstants.cardSize))]){
                        ForEach(controller.cards){ card in
                            CardView(cardInfo: card).aspectRatio(2/3,contentMode: .fit).onTapGesture {
                                controller.choose(card)
                            }
                        }
                    }
                }
                Spacer(minLength: 10)
                HStack{
                    Button(action: controller.drawCards){
                        Image(systemName: "plus")
                        Text("Draw Cards")
                    }
                    .buttonStyle(.borderedProminent)
                }
                Spacer(minLength: 30)
            }.padding()
        }.edgesIgnoringSafeArea(.all)
    }
    
    struct DrawingConstants {
        static let cardSize: CGFloat = 60
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = GameController()
        GameView(controller: game)
    }
}
