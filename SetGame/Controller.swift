//
//  Controller.swift
//  SetGame
//
//  Created by Joao Barros on 05/05/23.
//

import Foundation


class Controller: ObservableObject{
    
    static func generateCards() -> Array<Model<String>.CardInfo>{
        
        var cardsInfo: Array<Model<String>.CardInfo> = []
        
        for shape in CardDetails.Shape.allCases {
            for color in CardDetails.Color.allCases{
                for number in CardDetails.Number.allCases{
                    for shade in CardDetails.Shade.allCases{
                        cardsInfo.append(Model<String>.CardInfo(
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
    
    static func createSetGame() -> Model<String> {
        Model<String>(arrayOfContent: generateCards())
    }
    
    @Published private var model: Model<String> = createSetGame()
    
    var cards: Array<Model<String>.Card>{
        return model.cards
    }
    
    func startNewGame(){
        print("New Game")
    }
    
    func drawCards(){
        print("New Cards")
    }
    
    func selectCard(){
        print("Card selected")
    }
}
