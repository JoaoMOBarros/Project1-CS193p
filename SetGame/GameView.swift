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
    
    @ObservedObject var controller: Controller
    
    let cards = [1,2,3,4,5]
    
    var body: some View {
        ZStack{
            Color.offWhite
            VStack {
                Spacer()
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
                Spacer()
                HStack{
                    Button(action: controller.drawCards){
                        Image(systemName: "plus")
                        Text("Draw Cards")
                    }
                    .buttonStyle(.borderedProminent)
                }
                Spacer()
            }.padding()
        }.edgesIgnoringSafeArea(.all)
    }
}

struct CardView: View{
    
    let cardInfo: Model<String>.Card
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.offWhite)
                .shadow(color: .black.opacity(0.2), radius: 10, x:10, y:10)
                .shadow(color: .white.opacity(0.7), radius: 10, x:-5, y:-5).padding(3)
        }
    }
    
}















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = Controller()
        GameView(controller: game)
    }
}
