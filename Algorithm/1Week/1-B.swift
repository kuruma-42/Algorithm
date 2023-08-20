//
//  1-B.swift
//  Algorithm
//  BaekJoon 10808
//  Created by Yong Jun Cha on 2023/02/06.
//

import Foundation

let S = Array(readLine()!).map { String($0) }
var alphabetLocationArray = Array(repeating: 0, count: 26)
let alphabetDict: [String:Int] = [
    "a": 0,
    "b": 1,
    "c": 2,
    "d": 3,
    "e": 4,
    "f": 5,
    "g": 6,
    "h": 7,
    "i": 8,
    "j": 9,
    "k": 10,
    "l": 11,
    "m": 12,
    "n": 13,
    "o": 14,
    "p": 15,
    "q": 16,
    "r": 17,
    "s": 18,
    "t": 19,
    "u": 20,
    "v": 21,
    "w": 22,
    "x": 23,
    "y": 24,
    "z": 25
]
var resultString: String = ""

for i in 0..<S.count {
    let index = alphabetDict[S[i]]
    let value = alphabetLocationArray[index ?? 0]
    let newValue = value + 1
    alphabetLocationArray[index ?? 0] = newValue
}

alphabetLocationArray.forEach {
    resultString += "\($0) "
}

print(resultString)
