//
//  PawnShape.swift
//  SnackAndLadders
//
//  Created by mac on 13/09/26.
//

import SwiftUI

import SwiftUI

struct PawnShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        
        // 1. Head (Circle at top)
        let headRadius = w * 0.22
        let headCenter = CGPoint(x: w * 0.5, y: h * 0.22)
        path.addArc(center: headCenter, radius: headRadius, startAngle: .degrees(0), endAngle: .degrees(360), clockwise: false)
        
        // 2. Neck Ring
        path.move(to: CGPoint(x: w * 0.35, y: h * 0.42))
        path.addLine(to: CGPoint(x: w * 0.65, y: h * 0.42))
        
        // 3. Body Curves down to Base
        path.move(to: CGPoint(x: w * 0.38, y: h * 0.42))
        path.addQuadCurve(
            to: CGPoint(x: w * 0.2, y: h * 0.85),
            control: CGPoint(x: w * 0.28, y: h * 0.65)
        )
        path.addLine(to: CGPoint(x: w * 0.8, y: h * 0.85))
        path.addQuadCurve(
            to: CGPoint(x: w * 0.62, y: h * 0.42),
            control: CGPoint(x: w * 0.72, y: h * 0.65)
        )
        
        // 4. Base (Pedestal)
        path.move(to: CGPoint(x: w * 0.15, y: h * 0.85))
        path.addLine(to: CGPoint(x: w * 0.85, y: h * 0.85))
        path.addLine(to: CGPoint(x: w * 0.9, y: h * 0.98))
        path.addLine(to: CGPoint(x: w * 0.1, y: h * 0.98))
        path.closeSubpath()
        
        return path
    }
}

#Preview {
    PawnShape()
}
