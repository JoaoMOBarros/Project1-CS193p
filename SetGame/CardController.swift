//
//  CardController.swift
//  SetGame
//
//  Created by Joao Barros on 06/05/23.
//

import SwiftUI

class CardController{
    
    func getColor(color: CardDetails.Color) -> Color{
        switch color {
            case .blue:
                return Color.blue
            case .green:
                return Color.green
            case .red:
                return Color.red
        }
    }
    
    @ViewBuilder
    func getShape(details: GameModel<String>.CardInfo, size: CGFloat) -> some View{
        switch details.shape{
            case .diamond:
                DiamondShape(details: details, size: size)
            case .oval:
                OvalShape(details: details, size: size)
            case .rectagle:
                RectangleShape(details: details, size: size)
        }
    }
    
    func getShade(shade: CardDetails.Shade) -> Double{
        switch shade{
            case .full:
                return 1
            case .outlined:
                return 0.1
            case .striped:
                return 0.5
        }
    }
    
    func getNumber(number: CardDetails.Number) -> Int{
        switch number{
            case .one:
                return 1
            case .two:
                return 2
            case .three:
                return 3
        }
    }
}
