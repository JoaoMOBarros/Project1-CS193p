//
//  Enums.swift
//  SetGame
//
//  Created by Joao Barros on 05/05/23.
//

import Foundation

struct CardDetails{
    enum Shape{
        case oval
        case diamond
        case rectagle
    }

    enum Color {
        case req
        case blue
        case green
    }

    enum Number: Int {
        case one = 1
        case two = 2
        case three = 3
    }

    enum Shade{
        case full
        case striped
        case outlined
    }
}
