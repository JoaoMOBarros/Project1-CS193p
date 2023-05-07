//
//  Enums.swift
//  SetGame
//
//  Created by Joao Barros on 05/05/23.
//

import Foundation

struct CardDetails{
    enum Shape: CaseIterable, Hashable{
        case oval
        case diamond
        case rectagle
    }

    enum Color: CaseIterable, Hashable{
        case red
        case blue
        case green
    }

    enum Number: CaseIterable, Hashable{
        case one
        case two
        case three
    }

    enum Shade: CaseIterable, Hashable{
        case full
        case striped
        case outlined
    }
}
