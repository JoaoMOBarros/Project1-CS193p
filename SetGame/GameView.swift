//
//  ContentView.swift
//  SetGame
//
//  Created by Joao Barros on 03/05/23.
//

import SwiftUI

extension Color{
    static let offWhite = Color(red: 225/255, green: 225/255, blue: 235/255)
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
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]){
                        ForEach(controller.cards){ card in
                            CardView(cardInfo: card).aspectRatio(2/3,contentMode: .fit).onTapGesture {
                                controller.selectCard()
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
}

struct CardView: View{
    
    let cardInfo: GameModel<String>.Card
    var controller = CardController()
    
    var body: some View{
        ZStack{
            if cardInfo.isOnDisplay {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.offWhite)
                    .shadow(color: .black.opacity(0.2), radius: 10, x:10, y:10)
                    .shadow(color: .white.opacity(0.7), radius: 10, x:-5, y:-5).padding(3)
                VStack{
                    ForEach(0..<controller.getNumber(number: cardInfo.content.number), id: \.self){_ in
                        controller.getShape(details: cardInfo.content)
                    }
                }
            }
        }
    }
    
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = GameController()
        GameView(controller: game)
    }
}
