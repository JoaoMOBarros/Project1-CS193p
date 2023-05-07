//
//  CardView.swift
//  SetGame
//
//  Created by Joao Barros on 07/05/23.
//

import SwiftUI

struct CardView: View{
    
    let cardInfo: GameModel<String>.Card
    var controller = CardController()
    
    var body: some View{
        if !cardInfo.isMatched{
            ZStack{
                if cardInfo.isOnDisplay {
                    if cardInfo.isSelected{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.offWhiteSelected)
                            .shadow(color: .black.opacity(0.2), radius: 10, x:10, y:10)
                            .shadow(color: .white.opacity(0.7), radius: 10, x:-5, y:-5).padding(3)
                    }
                    else{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.offWhite)
                            .shadow(color: .black.opacity(0.2), radius: 10, x:10, y:10)
                            .shadow(color: .white.opacity(0.7), radius: 10, x:-5, y:-5).padding(3)
                    }
                    VStack{
                        ForEach(0..<controller.getNumber(number: cardInfo.content.number), id: \.self){_ in
                            controller.getShape(details: cardInfo.content, size: GameView.DrawingConstants.cardSize)
                        }
                    }
                }
            }
        }
    }
}
