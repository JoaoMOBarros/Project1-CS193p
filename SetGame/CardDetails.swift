//
//  Enums.swift
//  SetGame
//
//  Created by Joao Barros on 05/05/23.
//

import Foundation

struct CardDetails{
    enum Shape: CaseIterable{
        case oval
        case diamond
        case rectagle
    }

    enum Color: CaseIterable{
        case req
        case blue
        case green
    }

    enum Number: CaseIterable{
        case one
        case two
        case three
    }

    enum Shade: CaseIterable{
        case full
        case striped
        case outlined
    }
}
