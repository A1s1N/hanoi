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

var counter = Int()


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
     
    if (activeTower < 1 || activeTower > towersCount) || (numTower < 1 || numTower > towersCount) {
        output()
    } else {
        action(activeTower: activeTower, numTower: numTower, ringsCount: ringsCount)
        if towers[numTower - 1] == full + [floor] {
            print("Игра закончена. Вам потребовалось \(counter) шагов")
            break
    }
}
}
