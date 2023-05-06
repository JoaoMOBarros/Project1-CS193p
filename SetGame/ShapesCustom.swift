//
//  ShapesCustom.swift
//  SetGame
//
//  Created by Joao Barros on 06/05/23.
//

import SwiftUI

struct EllipseShape: View {
    var body: some View {
        Ellipse().frame(width: 50, height: 25).padding(_: -10)
    }
}

struct DiamondShape: View{
    var body: some View{
        DiamondTrace().frame(width: 50, height: 25).padding(_: -10)
    }
}

struct RectangleShape: View {
    var body: some View{
        Rectangle().frame(width: 50, height: 25).padding(_: -10)
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
            p.closeSubpath()
        }
    }
}


struct ShapeCustom_Previews: PreviewProvider {
    static var previews: some View {
        EllipseShape()
    }
}
