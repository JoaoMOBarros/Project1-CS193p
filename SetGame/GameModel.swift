//
//  Model.swift
//  SetGame
//
//  Created by Joao Barros on 05/05/23.
//

import Foundation

struct GameModel<CardContent>{
    private(set) var cards: Array<Card>
    
    private var selectedCardsIndices: Array<Int> = []
    private(set) var cardsOnDisplay: Array<Card> = []
    
    init(arrayOfContent: Array<CardInfo>){
        cards = Array<Card>()
        for index in 0..<arrayOfContent.count{
            cards.append(Card(id: index, content: arrayOfContent[index]))
        }
        cards.shuffle()
        for _ in 0..<12{
            cardsOnDisplay.append(cards.removeFirst())
        }
    }
    
    mutating func addCards(){
        for _ in 0..<3{
            cardsOnDisplay.append(cards.removeFirst())
        }
    }
    
    struct Card: Identifiable{
        var id: Int
        var isSelected: Bool = false
        var isMatched: Bool = false
        var content: CardInfo
    }
    
    struct CardInfo{
        let color: CardDetails.Color
        let shape: CardDetails.Shape
        let number: CardDetails.Number
        let shade: CardDetails.Shade
    }
}
