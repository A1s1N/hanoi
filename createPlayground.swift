//
//  createPlayground.swift
//  hanoi
//
//  Created by Никита Александров on 05.11.2022.
//

import Foundation

func createPlayground(ringsCount: Int, towersCount: Int) {
    
    for i in 0...towersCount - 1 {
        towers.insert(tower, at: i)
    }
    
    for i in 0...ringsCount - 1 {
        while ring.count < 2 * ringsCount {
            ring.insert(" ", at: ring.startIndex)
            ring.insert(" ", at: ring.endIndex)
        }
    full.insert(ring, at: i)
    ring = ring.replacingOccurrences(of: " ", with: "")
    ring += "**"
    floor += "--"
    empty += "  "
    }
    towers[0] = full + [floor]
    
    for i in 1...towersCount - 1 {
        towers[i] = [floor]
        while towers[i].count != ringsCount + 1 {
            towers[i].insert(empty, at: 0)
        }
    }
    output()
}
