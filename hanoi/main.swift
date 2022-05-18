//
//  main.swift
//  hanoi
//
//  Created by Никита Александров on 22.04.2022.
//
import Foundation

var ring = "*"
var floor = "-"
var empty = " "

var full = [String]()

var towerOne = [String]()
var towerTwo = [String]()
var towerThree = [String]()
var towers = [[String]]()

func createPlayground(ringsCount: Int) {
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
    towerOne = full + [floor]
    towerTwo = [floor]
        while towerTwo.count != ringsCount + 1 {
            towerTwo.insert(empty, at: 0)
        }
    towerThree = [floor]
        while towerThree.count != ringsCount + 1 {
            towerThree.insert(empty, at: 0)
        }
    towers = [towerOne, towerTwo, towerThree]
    output(ringsCount: ringsCount)
}

var counter = Int()

func output(ringsCount: Int) {
    for i in 0...ringsCount {
        print("\(towers[0][i]) \(towers[1][i]) \(towers[2][i])")
    }
}

func deleteEmpty(_ n: Int) {
    while towers[n].first == empty {
        towers[n].remove(at: 0)
    }
}

func addEmpty(_ n: Int, ringsCount: Int) {
    while towers[n].count < ringsCount + 1 {
        towers[n].insert(empty, at: 0)
    }
}

func step(activeTower: Int, numTower: Int, ringsCount: Int) {
        
    if activeTower < 1 || activeTower > 3 {
        output(ringsCount: ringsCount)
        return
    } else if numTower < 1 || numTower > 3 {
        output(ringsCount: ringsCount)
        return
    } else {
        deleteEmpty(activeTower - 1)

        if towers[activeTower - 1].first == floor {
            addEmpty(activeTower - 1, ringsCount: ringsCount)
            output(ringsCount: ringsCount)
            return
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
            output(ringsCount: ringsCount)
            counter += 1
        }
    }
}

print("Сколько колец будет в игре?")
let ringsCount = (Int(readLine()!)) ?? 3
createPlayground(ringsCount: ringsCount)

while (true) {
    print("Выберите активную башню")
    let activeTower = (Int(readLine()!)) ?? 0
    
    print("Выберите башню, на которую надо перенести первое кольцо")
    let numTower = (Int(readLine()!)) ?? 0
    
    step(activeTower: activeTower, numTower: numTower, ringsCount: ringsCount)
    if towers[1] == full + [floor] || towers[2] == full + [floor] {
        print("Игра закончена. Вам потребовалось \(counter) шагов")
        break
    }
}
