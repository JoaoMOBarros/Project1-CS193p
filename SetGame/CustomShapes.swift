//
//  ShapesCustom.swift
//  SetGame
//
//  Created by Joao Barros on 06/05/23.
//

import SwiftUI

struct DiamondShape: View{

    let details: GameModel<String>.CardInfo
    let size: CGFloat
    let controller = CardController()
    
    var body: some View{
        if details.shade == CardDetails.Shade.outlined {
            DiamondTrace()
            .stroke(controller.getColor(color: details.color), lineWidth: 2)
            .frame(width: size*0.66, height:  size*0.33)
        }
        else{
            DiamondTrace()
            .foregroundColor(controller.getColor(color: details.color))
            .opacity(controller.getShade(shade: details.shade))
            .frame(width: size*0.66, height: size*0.33)
        }
    }
}

struct OvalShape: View{

    let details: GameModel<String>.CardInfo
    let size: CGFloat
    let controller = CardController()
    
    var body: some View{
        if details.shade == CardDetails.Shade.outlined {
            Ellipse()
            .stroke(controller.getColor(color: details.color), lineWidth: 2)
            .frame(width: size*0.66, height:  size*0.33)
        }
        else{
            Ellipse()
            .foregroundColor(controller.getColor(color: details.color))
            .opacity(controller.getShade(shade: details.shade))
            .frame(width: size*0.66, height:  size*0.33)
        }
    }
}

struct RectangleShape: View{

    let details: GameModel<String>.CardInfo
    let size: CGFloat
    let controller = CardController()
    
    var body: some View{
        if details.shade == CardDetails.Shade.outlined {
            Rectangle()
            .stroke(controller.getColor(color: details.color), lineWidth: 2)
            .frame(width: size*0.66, height:  size*0.33)
        }
        else{
            Rectangle()
            .foregroundColor(controller.getColor(color: details.color))
            .opacity(controller.getShade(shade: details.shade))
            .frame(width: size*0.66, height:  size*0.33)
        }
    }
}


struct DiamondTrace: Shape {
    func path(in rect: CGRect) -> Path {
        Path(){ p in
            p.move(to: CGPoint(x: rect.midX, y: rect.maxY))
            p.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            p.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
            p.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            p.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        }
    }
}
