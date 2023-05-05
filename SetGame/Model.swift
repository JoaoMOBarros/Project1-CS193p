//
//  Model.swift
//  SetGame
//
//  Created by Joao Barros on 05/05/23.
//

import Foundation

struct Model<CardContent>{
    private(set) var cards: Array<Card>
    
    init(arrayOfContent: Array<CardInfo>){
        cards = Array<Card>()
        for index in 0..<arrayOfContent.count{
            cards.append(Card(id: index, content: arrayOfContent[index]))
        }
        cards.shuffle()
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
