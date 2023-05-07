//
//  Controller.swift
//  SetGame
//
//  Created by Joao Barros on 05/05/23.
//

import Foundation


class GameController: ObservableObject{
    
    static func generateCards() -> Array<GameModel<String>.CardInfo>{
        
        var cardsInfo: Array<GameModel<String>.CardInfo> = []
        
        for shape in CardDetails.Shape.allCases {
            for color in CardDetails.Color.allCases{
                for number in CardDetails.Number.allCases{
                    for shade in CardDetails.Shade.allCases{
                        cardsInfo.append(GameModel<String>.CardInfo(
                            color: color,
                            shape: shape,
                            number: number,
                            shade: shade)
                        )
                    }
                }
            }
        }
        return cardsInfo
    }
    
    static func createSetGame() -> GameModel<String> {
        GameModel<String>(arrayOfContent: generateCards())
    }
    
    @Published private var model: GameModel<String> = createSetGame()
    
    var cards: Array<GameModel<String>.Card>{
        return model.cardsOnDisplay
    }
    
    func startNewGame(){
        model = GameController.createSetGame()
    }
    
    func drawCards(){
        model.addCards()
    }
    
    func selectCard(){
        print("Card selected")
    }
}
