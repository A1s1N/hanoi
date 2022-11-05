//
//  step.swift
//  hanoi
//
//  Created by Никита Александров on 05.11.2022.
//

import Foundation

func action(activeTower: Int, numTower: Int, ringsCount: Int) {
        
        deleteEmpty(activeTower - 1)

        if towers[activeTower - 1].first == floor {
            addEmpty(activeTower - 1, ringsCount: ringsCount)
            output()
        } else {
            let slide = towers[activeTower - 1].removeFirst()
            deleteEmpty(numTower - 1)

        if slide < towers[numTower - 1][0] {
            towers[numTower - 1].insert(slide, at: 0)
        } else {
            towers[activeTower - 1].insert(slide, at: 0)
        }
            addEmpty(activeTower - 1, ringsCount: ringsCount)
            addEmpty(numTower - 1, ringsCount: ringsCount)
            output()
            counter += 1
            
        }
}
