//
//  SnackAndLadders.swift
//  SnackAndLadders
//
//  Created by mac on 15/09/26.
//

import SwiftUI

struct LadderShape: Shape {
    var start: CGPoint
    var end: CGPoint
    
    var ladderWidth: CGFloat = 10 // distance btw side lines
    var ladderHeight: CGFloat = 10 // ladder space btw each step
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let dx = end.x - start.x
        let dy = end.y - start.y
        let distance = hypot(dx, dy)
        guard distance > 0 else { return path }
        
        let ux = -dy / distance * (ladderWidth / 2)
        let uy = dx / distance * (ladderWidth / 2)
        
        // Side Rail 1
        path.move(to: CGPoint(x: start.x + ux, y: start.y + uy))
        path.addLine(to: CGPoint(x: end.x + ux, y: end.y + uy))
        
        // Side Rail 2
        path.move(to: CGPoint(x: start.x - ux, y: start.y - uy))
        path.addLine(to: CGPoint(x: end.x - ux, y: end.y - uy))
        
        let numberOfSteps = Int(distance / ladderHeight)
        for i in 1...max(1, numberOfSteps) {
            let t = CGFloat(i) / CGFloat(numberOfSteps)
            let px = start.x + dx * t
            let py = start.y + dy * t
            
            // Line connecting left rail point to right rail point
            path.move(to: CGPoint(x: px + ux, y: py + uy))
            path.addLine(to: CGPoint(x: px - ux, y: py - uy))
        }
        return path
    }
}

