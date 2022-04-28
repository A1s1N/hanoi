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
        let slide = towers[activeTower - 1].removeFirst()
        towers[numTower - 1].removeFirst()
        towers[numTower - 1].insert(slide, at: 2)
        towers[activeTower - 1].insert(empty, at: 0)
        Tower()
}

print("Выберите активную башню")
let activeTower = Int(readLine()!)
print("Выберите башню, на которую надо перенести первое кольцо")
let numTower = Int(readLine()!)
step(activeTower: activeTower!, numTower: numTower!)

//func step(numTower: Int) {
//    if numTower == 1 {к
//        print("Выберите другую башню")
//    } else if numTower == 2 {
//        let slide = towerOne.removeFirst()
//        towerTwo.removeFirst()
//        towerTwo.insert(slide, at: 2)
//        towerOne.insert(empty, at: 0)
//        Tower()
//    } else if numTower == 3 {
//        let slide = towerOne.removeFirst()
//        towerThree.removeFirst()
//        towerThree.insert(slide, at: 2)
//        towerOne.insert(empty, at: 0)
//        Tower()
//    }
//}
//
//print("На какой столбец перенести первое кольцо?")
//let numTower = Int(readLine()!)
//step(numTower: numTower!)
//
////let output = "\(towerOne[0]) \(towerTwo[0]) \(towerThree[0])"  // for [i]
//
////print(output)
//
////print(columnThree)
////print("-----")
//
////var numTower = readLine()
//
//let Towers = [towerOne, towerTwo, towerThree]
//let numTower = Int(readLine()!)
//func step(numTower: Int) {
//    if numTower == 1 {
//        print("Выберите другую башню")
//    } else if numTower == 2 {
//        let slide = towerOne.removeFirst()
//        towerTwo.removeFirst()
//        towerTwo.insert(slide, at: 2)
//        towerOne.insert(empty, at: 0)
//        Tower()
//    } else if numTower == 3 {
//        let slide = towerOne.removeFirst()
//        towerThree.removeFirst()
//        towerThree.insert(slide, at: 2)
//        towerOne.insert(empty, at: 0)
//        Tower()
//    }
//}

class Person{
   
    var name: String
  var age: Int
  init(name: String, age: Int){
       
      self.name = name
      self.age = age
    }
}

var tom: Person = Person(name: "Tom", age: 24)
var bob = tom
bob.name = "Bob"
print(tom.name) // Bob
