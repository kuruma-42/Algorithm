//
//  1-E.swift
//  Algorithm
//  BaekJoon 1159
//  Created by Yong Jun Cha on 2023/02/10.
//

import Foundation

let totalPlayer = Int(readLine() ?? "")!
var playerArray: [String] = []
var initialDict: [String: Int] = [:]
var names: String = ""

for _ in 0..<totalPlayer {
    let playerName = readLine() ?? ""
    playerArray.append(playerName)
}

for i in 0..<totalPlayer {
    let playerName = playerArray[i]
    let firstsLetter = String(playerName[playerName.startIndex])
    initialDict[firstsLetter] = (initialDict[firstsLetter] ?? 0) + 1
}

initialDict.forEach { key, value in
    if value >= 5 {
        names.append(key)
    }
}

if names != "" {
    let sortedNames = names.sorted(by:<)
    var result = ""
    for i in 0..<sortedNames.count {
        result.append(sortedNames[i])
    }
    print(result)
} else {
    print("PREDAJA")
}

