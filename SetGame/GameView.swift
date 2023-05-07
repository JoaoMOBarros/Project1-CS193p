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
    static let mainPurple = Color(red: 155/255, green: 18/255, blue: 187/255)
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
                    VStack(alignment: .leading){
                        Text("Set Game")
                            .font(.title)
                            .foregroundColor(Color.white).bold()
                        Text("Score \(controller.getScore())")
                            .foregroundColor(DrawingConstants.tertiaryColor)
                            .bold()
                    }
                    Spacer()
                    HStack{
                        Button(action: controller.startNewGame){
                            Image(systemName: "square.stack.3d.up")
                            Text("New Game")
                        }
                        .accentColor(DrawingConstants.primaryColor).padding(10)
                    }.background(Capsule().foregroundColor(Color.white))
                }.padding(20).background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.purple)).shadow(color: .black.opacity(0.2), radius: 10, x:10, y:10)
                    .shadow(color: .white.opacity(0.7), radius: 10, x:-5, y:-5).padding(3)
                Spacer(minLength: 30)
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
                    .disabled(controller.areThereCardsToDraw()).foregroundColor(DrawingConstants.secondaryColor)
                }.padding(20)
                .background(Capsule()
                    .foregroundColor(Color.purple))
                    .shadow(color: .black.opacity(0.2), radius: 10, x:10, y:10)
                    .shadow(color: .white.opacity(0.7), radius: 10, x:-5, y:-5).padding(3)
                Spacer(minLength: 30)
            }.padding()
        }.edgesIgnoringSafeArea(.all)
    }
    
    struct DrawingConstants {
        static let cardSize: CGFloat = 60
        static let primaryColor: Color = Color.mainPurple
        static let secondaryColor: Color = Color.white
        static let tertiaryColor: Color = Color.offWhite
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = GameController()
        GameView(controller: game)
    }
}
