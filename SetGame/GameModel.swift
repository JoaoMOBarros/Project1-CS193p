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
    private var nextCardIndex = 0
    
    init(arrayOfContent: Array<CardInfo>){
        cards = Array<Card>()
        for index in 0..<arrayOfContent.count{
            cards.append(Card(id: index, content: arrayOfContent[index]))
        }
        cards.shuffle()
        for _ in 0..<12{
            cards[nextCardIndex].isOnDisplay.toggle()
            nextCardIndex += 1
        }
    }
    
    mutating func addCards(){
        if nextCardIndex < 81{
            for _ in 0..<3{
                cards[nextCardIndex].isOnDisplay.toggle()
                nextCardIndex += 1
            }
        }
    }
    
    
    mutating func choose (card: Card){
        
        let chosenIndex = cards.firstIndex(where: {$0.id == card.id})!
        // disselect card
        if card.isSelected {
            selectedCardsIndices.removeAll(where: {$0 == chosenIndex})
            cards[chosenIndex].isSelected.toggle()
        }
        // add card to array of selected
        else if selectedCardsIndices.count < 3 {
            cards[chosenIndex].isSelected.toggle()
            selectedCardsIndices.append(chosenIndex)
        }
        else if self.compareProps(){
            for i in selectedCardsIndices{
                cards[i].isMatched.toggle()
            }
            selectedCardsIndices = []
            cards[chosenIndex].isSelected.toggle()
            selectedCardsIndices.append(chosenIndex)
        }
        else{
            for i in selectedCardsIndices{
                cards[i].isSelected.toggle()
            }
            selectedCardsIndices = []
            cards[chosenIndex].isSelected.toggle()
            selectedCardsIndices.append(chosenIndex)
        }
    }
    
    func compareProps() -> Bool{
        let colorSet = Set([cards[selectedCardsIndices[0]].content.color, cards[selectedCardsIndices[1]].content.color,cards[selectedCardsIndices[2]].content.color])
        let shapeSet = Set([cards[selectedCardsIndices[0]].content.shape, cards[selectedCardsIndices[1]].content.shape,cards[selectedCardsIndices[2]].content.shape])
        let shadeSet = Set([cards[selectedCardsIndices[0]].content.shade, cards[selectedCardsIndices[1]].content.shade,cards[selectedCardsIndices[2]].content.shade])
        let numberSet = Set([cards[selectedCardsIndices[0]].content.number, cards[selectedCardsIndices[1]].content.number,cards[selectedCardsIndices[2]].content.number])
        
        print(colorSet)
        print(shadeSet)
        print(shapeSet)
        print(numberSet)
        
        if (colorSet.count == 2 || shapeSet.count == 2 || shadeSet.count == 2 || numberSet.count == 2) {
            return false
        }
        
        return true
    }
    
    struct Card: Identifiable{
        var id: Int
        var isSelected: Bool = false
        var isMatched: Bool = false
        var isOnDisplay: Bool = false
        var content: CardInfo
    }
    
    struct CardInfo{
        let color: CardDetails.Color
        let shape: CardDetails.Shape
        let number: CardDetails.Number
        let shade: CardDetails.Shade
    }
}
