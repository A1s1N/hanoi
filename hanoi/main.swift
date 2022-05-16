//
//  main.swift
//  hanoi
//
//  Created by Никита Александров on 22.04.2022.
//
import Foundation

let full = [
    "   *   ",
    " ***** ",
    "*******",
    "-------",
    "       "
]
let small = full[0]
let middle = full[1]
let big = full[2]
let floor = full[3]
let empty = full[4]

var towerOne = [
    small,
    middle,
    big,
    floor
]
var towerTwo = [empty, empty, empty, floor]
var towerThree = [empty, empty, empty, floor]
var towers = [towerOne, towerTwo, towerThree]

func Tower() {
    for i in 0...3 {
        print("\(towers[0][i]) \(towers[1][i]) \(towers[2][i])")
    }
}
Tower()

func step(activeTower: Int, numTower: Int) {
        if activeTower < 1 || activeTower > 3 {
            Tower()
        } else if numTower < 1 || numTower > 3 {
            Tower()
        } else {
        while towers[activeTower - 1].first == empty {
            towers[activeTower - 1].remove(at: 0)
        }
        let slide = towers[activeTower - 1].removeFirst()
        while towers[numTower - 1].first == empty {
            towers[numTower - 1].remove(at: 0)
        }
        if slide < towers[numTower - 1][0] {
            towers[numTower - 1].insert(slide, at: 0)
        } else {
            towers[activeTower - 1].insert(slide, at: 0)
        }
        while towers[activeTower - 1].count < 4 {
            towers[activeTower - 1].insert(empty, at: 0)
        }
        while towers[numTower - 1].count < 4 {
            towers[numTower - 1].insert(empty, at: 0)
        }
        Tower()
    }
}
while (true) {
    print("Выберите активную башню")
    let activeTower = Int(readLine()!)
    print("Выберите башню, на которую надо перенести первое кольцо")
    let numTower = Int(readLine()!)
    step(activeTower: activeTower ?? 0, numTower: numTower ?? 0)
    if towers[1] == [small, middle, big, floor] || towers[2] == [small, middle, big, floor] {
        print("Игра закончена")
        break
    }
}
