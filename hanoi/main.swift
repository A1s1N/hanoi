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

var tower = [String]()
var towers = [[String]]()



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

var counter = Int()

func output() {
    var out = String()
    for i in 0...ringsCount {
        for n in 0...towersCount - 1 {
            out += "\(towers[n][i]) "
            if n == towersCount - 1 {
                out += "\n"
            }
        }
    }
    print(out)
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

print("Сколько башен будет в игре?")
let towersCount = (Int(readLine()!)) ?? 3

print("Сколько колец будет в игре?")
let ringsCount = (Int(readLine()!)) ?? 3
createPlayground(ringsCount: ringsCount, towersCount: towersCount)

while (true) {
    print("Выберите активную башню")
    let activeTower = (Int(readLine()!)) ?? 0
    
    print("Выберите башню, на которую надо перенести первое кольцо")
    let numTower = (Int(readLine()!)) ?? 0
     
    if activeTower < 1 || activeTower > towersCount {
        output()
    } else if numTower < 1 || numTower > towersCount {
        output()
    } else {
        step(activeTower: activeTower, numTower: numTower, ringsCount: ringsCount)
        if towers[numTower - 1] == full + [floor] {
            print("Игра закончена. Вам потребовалось \(counter) шагов")
            break
    }
}
}
