//
//  ColonyView.swift
//  GameOfLife
//
//  Created by Itamar Levy-Or on 11/9/14.
//  Copyright (c) 2014 Itamar Levy-Or. All rights reserved.
//

import Foundation
import UIKit

class ColonyView: UIView{
    var colony = Colony(numRows: 80, numCols: 80)
    func setColony (c: Colony){
        colony = c
    }
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let colorspace = CGColorSpaceCreateDeviceRGB()
        let components: [CGFloat] = [0.0, 0.0, 1.0, 1.0]
        let color = CGColorCreate(colorspace, components)
        CGContextSetFillColorWithColor(context, color)
        for row in 0...colony.getRows()-1{
            for col in 0...colony.getCols()-1{
                if (1 == colony.getCell(row, col: col)){
                    let cellHeight = frame.size.height/CGFloat(colony.getRows())
                    let cellWidth = frame.size.width/CGFloat(colony.getCols())
                    let xPoint = CGFloat(col) * cellWidth
                    let yPoint = CGFloat(row) * cellHeight
                    let rect = CGRectMake(xPoint, yPoint, cellWidth, cellHeight)
                    CGContextFillRect(context, rect)
                }
            }
        }
    }
}