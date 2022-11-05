//
//  output.swift
//  hanoi
//
//  Created by Никита Александров on 05.11.2022.
//

import Foundation

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
