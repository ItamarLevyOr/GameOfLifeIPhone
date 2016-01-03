//
//  Colony.swift
//  GameOfLife
//
//  Created by Itamar Levy-Or on 10/15/14.
//  Copyright (c) 2014 Itamar Levy-Or. All rights reserved.
//

import Foundation
class Colony{
private let rows = 0
private let cols = 0
internal let DEAD = 0
internal let ALIVE = 1
private var generation = 0
private var liveCells = 0
private var colony = Array(count: 0, repeatedValue: 0)
private var newColony = Array(count: 0, repeatedValue: 0)
        let name = ""

    internal    init(numRows: Int, numCols: Int, publicName: String){
        rows = numRows
        cols = numCols
        colony = Array(count:((rows+2) * (cols + 2)), repeatedValue: 0)
        newColony = Array(count:((rows+2) * (cols + 2)), repeatedValue: 0)
        name = publicName
    }
    
    internal    init(numRows: Int, numCols: Int){
        rows = numRows
        cols = numCols
        colony = Array(count:((rows+2) * (cols + 2)), repeatedValue: 0)
        newColony = Array(count:((rows+2) * (cols + 2)), repeatedValue: 0)
    }
    
    internal func getRows()-> Int{
    return rows
    }
    internal func getCols()->Int{
        return cols
    }
private func index(row: Int, col: Int)->Int{
    let index = (row + 1) * (cols + 2) + col + 1
    return index
}

internal func setCell(status: Int, row: Int, col: Int ){
    colony [index(row, col: col)] = status
    if(status == ALIVE){
        liveCells++
    }
    }
    
    func getGeneration()->Int{
        return generation
    }
    
        func getLiveCells()->Int{
            return liveCells
    }
internal    func getCell(row: Int, col: Int)->Int{
        return colony[index(row, col: col)]
    }

private func countNeighbors (row: Int, col: Int)->Int{
    let count =
        getCell(row-1, col: col-1) + getCell(row, col: col-1) +
        getCell(row+1, col: col-1) + getCell(row-1, col: col) +
        getCell(row+1, col: col) + getCell(row-1, col: col+1) +
        getCell(row, col: col+1) + getCell(row+1, col: col+1)
    return count
}
internal func clearColony(colonyreset: Array<Int>) -> Array<Int>{
    let clearedColony = Array(count: colonyreset.count, repeatedValue: 0)
    return clearedColony
}
    
    internal func resetColony(){
        for var row = 0; row < rows; ++row{
            for var col = 0; col < cols; ++col{
            setCell(DEAD, row: row, col: col)
            }
        }
    }
    
    internal func evolveTimes(Times: Int){
        for num in 1...Times{
            evolve()
        }
    }

internal func evolve(){
    newColony = colony
    for var row = 0; row < rows; ++row{
        for var col = 0; col < cols; ++col{
            switch countNeighbors(row, col: col){
            case 0, 1, 4...8:
                newColony[index(row, col: col)] = DEAD
            case 2:
                break
            case 3:
                newColony[index(row, col: col)] = ALIVE
            default:
                println("error count incorrect")
                
            }
            
        }
    }
colony = newColony
generation++
}
internal func toString()->NSString{
    var string = ""
    for var row = 0; row < rows; ++row{
        for var col = 0; col < cols; ++col{
            if (getCell(row, col: col) == DEAD){
                string += "."
            }else{
                string += "*"
            }
        }
        string += "\n"
    }
    return string
}
}