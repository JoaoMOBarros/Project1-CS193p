//
//  Model.swift
//  SetGame
//
//  Created by Joao Barros on 05/05/23.
//

import Foundation

struct MemoryModel<CardContent>{
    private(set) var cards: Array<Card>
    private(set) var onScreen: Array<Card>
    
    struct Card: Identifiable{
        var id: Int
        var isSelected: Bool = false
        var isMatched: Bool = false
        let color: CardDetails.Color
        let shape: CardDetails.Shape
        let number: CardDetails.Number
        let shade: CardDetails.Shade
    }
}
