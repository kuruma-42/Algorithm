//
//  1-I.swift
//  Algorithm
//  BaekJoon 1620
//  Created by Yong Jun Cha on 2023/02/21.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let pocketmonCount = input[0]
let questionCount = input[1]



var pocketmonArray:[String] = []
var pocketmonDictionary:[String:Int] = [:]
var questions:[String] = []

for i in 0..<pocketmonCount {
    let pocketmon = readLine()!
    pocketmonArray.append(pocketmon)
    pocketmonDictionary[pocketmon] = i + 1
}

for _ in 0..<questionCount {
    let question = readLine()!
    questions.append(question)
}

for i in 0..<questions.count {
    
    if let pocketmonNumber = Int(questions[i]) {
        print(pocketmonArray[pocketmonNumber - 1])
    } else {
        let pocketmonName = pocketmonDictionary[questions[i]]
        print(pocketmonName!)
    }
    
}
