//
//  1-C.swift
//  Algorithm
//  BaekJoon 2979
//  Created by Yong Jun Cha on 2023/02/08.
//

import Foundation

var input = readLine()!.split(separator: " ").map { Int($0)! }

let A = input[0]
let B = input[1]
let C = input[2]

var car1 = readLine()!.split(separator: " ").map { Int($0)! }
var car2 = readLine()!.split(separator: " ").map { Int($0)! }
var car3 = readLine()!.split(separator: " ").map { Int($0)! }

var carExitHourArray: [Int] = []

carExitHourArray.append(car1[1])
carExitHourArray.append(car2[1])
carExitHourArray.append(car3[1])

carExitHourArray = carExitHourArray.sorted(by: { $0 > $1})
let carMaxExitValue: Int = carExitHourArray[0]
var carHourArray = Array(repeating: 0, count: carMaxExitValue)

for i in car1[0]-1...car1[1]-2 {
    carHourArray[i] += 1
}

for i in car2[0]-1...car2[1]-2 {
    carHourArray[i] += 1
}

for i in car3[0]-1...car3[1]-2 {
    carHourArray[i] += 1
}

let total = carHourArray.map { value in
    switch value {
    case 0:
        return 0
    case 1:
        return value * A
    case 2:
        return value * B
    case 3:
        return value * C
    default:
        return 0
    }
}.reduce(0, +)

print("\(total)")
