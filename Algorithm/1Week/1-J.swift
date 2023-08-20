//
//  1-J.swift
//  Algorithm
//  BaekJoon 9375
//  Created by Yong Jun Cha on 2023/02/24.
//

import Foundation

var testCaseCount = Int(readLine()!)!

var dictionary: [Int: [String:[String]]] = [:]

for _ in 0..<testCaseCount {
    let fashionVariationCount = Int(readLine()!)!
    
    var inputDictionary: [String:Int] = [:]

    for _ in 0..<fashionVariationCount {
        let input = readLine()!.split(separator: " ").map { String($0) }
        
        if let temp = inputDictionary[input[1]] {
            inputDictionary[input[1]] = temp + 1
        } else {
            inputDictionary[input[1]] = 1
        }
    }
    
   let styleVariations = inputDictionary.keys.map {
        inputDictionary[$0]! + 1
    }.reduce(1,*)
    
    // substract naked case -1
    print("\(styleVariations - 1)")
}

