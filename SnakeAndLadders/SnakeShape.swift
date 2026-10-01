//
//  SnackeShape.swift
//  SnackAndLadders
//
//  Created by mac on 18/09/26.
//

import SwiftUI

struct SnakeShape: Shape {
    var start: CGPoint
    var end: CGPoint
    var bodyWidth: CGFloat = 8
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let dx = end.x - start.x
        let dy = end.y - start.y
        
        // Calculate perpendicular offset for wavy control points
        let cx1 = start.x + dx * 0.25 - dy * 0.2
        let cy1 = start.y + dy * 0.25 + dx * 0.2
        
        let cx2 = start.x + dx * 0.75 + dy * 0.2
        let cy2 = start.y + dy * 0.75 - dx * 0.2
        
        // Main curved body
        path.move(to: start)
        path.addCurve(
            to: end,
            control1: CGPoint(x: cx1, y: cy1),
            control2: CGPoint(x: cx2, y: cy2)
        )
        
        // Add snake head at the start position
        let headRadius: CGFloat = bodyWidth * 0.8
        path.addEllipse(in: CGRect(
            x: start.x - headRadius,
            y: start.y - headRadius,
            width: headRadius * 2,
            height: headRadius * 2
        ))
        return path
    }
}
