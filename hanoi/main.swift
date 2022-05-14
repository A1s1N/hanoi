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
var towerTwo = [empty, empty, empty, floor] //TODO: Дополнять empty, когла towerTwo.count < 4
var towerThree = [empty, empty, empty, floor] //TODO: Сравнение веса и если append 
var towers = [towerOne, towerTwo, towerThree]

func Tower() {
    for i in 0...3 {
        print("\(towers[0][i]) \(towers[1][i]) \(towers[2][i])")
    }
}
Tower()

func step(activeTower: Int, numTower: Int) {
        while towers[activeTower - 1].first == empty {
            towers[activeTower - 1].remove(at: 0)
        }
        let slide = towers[activeTower - 1].removeFirst()
        while towers[numTower - 1].first == empty {
            towers[numTower - 1].remove(at: 0)
        } //TODO: Придумать другую реализацию
        towers[numTower - 1].insert(slide, at: 0)
        while towers[activeTower - 1].count < 4 {
            towers[activeTower - 1].insert(empty, at: 0) //подставляет empty, когда значений меньше 4
        }
        while towers[numTower - 1].count < 4 {
            towers[numTower - 1].insert(empty, at: 0) //подставляет empty, когда значений меньше 4
        }
        Tower()
}
while towerTwo != [small, middle, big, floor] {
    print("Выберите активную башню")
    let activeTower = Int(readLine()!)
    print("Выберите башню, на которую надо перенести первое кольцо")
    let numTower = Int(readLine()!)
    step(activeTower: activeTower!, numTower: numTower!)
}
