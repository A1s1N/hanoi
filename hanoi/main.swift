//
//  main.swift
//  hanoi
//
//  Created by Никита Александров on 22.04.2022.
//
import Foundation

print("Сколько колец будет в игре?")

let ringsCount = (Int(readLine()!)) ?? 3

var ring = "*"
var floor = "-"
var empty = " "

var full = [String]()

for i in 0...ringsCount - 1 {
    while ring.count < 2 * ringsCount {
        ring.insert(" ", at: ring.startIndex)
        ring.insert(" ", at: ring.endIndex)
    }
    full.insert(ring, at: i)
    ring.insert(" ", at: ring.startIndex)
    ring.insert(" ", at: ring.endIndex)
    ring = ring.replacingOccurrences(of: " ", with: "")
    ring += "**"
    floor += "--"
    empty += "  "

}

var towerOne = full + [floor]
var towerTwo = [floor]
while towerTwo.count != ringsCount + 1 {
    towerTwo.insert(empty, at: 0)
}
var towerThree = [floor]
while towerThree.count != ringsCount + 1 {
    towerThree.insert(empty, at: 0)
}
var towers = [towerOne, towerTwo, towerThree]

var count = Int()

func output() {
    for i in 0...ringsCount {
        print("\(towers[0][i]) \(towers[1][i]) \(towers[2][i])")
    }
}
    output()

func step(activeTower: Int, numTower: Int) {
        if activeTower < 1 || activeTower > 3 {
            output()
        } else if numTower < 1 || numTower > 3 {
            output()
        } else {
        while towers[activeTower - 1].first == empty {
            towers[activeTower - 1].remove(at: 0)
        }
        if towers[activeTower - 1].first == floor {
            while towers[activeTower - 1].count < ringsCount + 1 {
                towers[activeTower - 1].insert(empty, at: 0)
            }
            output()
        } else {
        let slide = towers[activeTower - 1].removeFirst()

        while towers[numTower - 1].first == empty {
            towers[numTower - 1].remove(at: 0)
        }
        if slide < towers[numTower - 1][0] {
            towers[numTower - 1].insert(slide, at: 0)
        } else {
            towers[activeTower - 1].insert(slide, at: 0)
        }
        while towers[activeTower - 1].count < ringsCount + 1 {
            towers[activeTower - 1].insert(empty, at: 0)
        }
        while towers[numTower - 1].count < ringsCount + 1 {
            towers[numTower - 1].insert(empty, at: 0)
        }
            output()
            count += 1
        }
    }
}
while (true) {
    print("Выберите активную башню")
    let activeTower = (Int(readLine()!)) ?? 0
    print("Выберите башню, на которую надо перенести первое кольцо")
    let numTower = (Int(readLine()!)) ?? 0
    step(activeTower: activeTower, numTower: numTower)
    if towers[1] == full + [floor] || towers[2] == full + [floor] {
        print("Игра закончена. Вам потребовалось \(count) шагов")
        break
    }
}
