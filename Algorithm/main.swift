//
//  main.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2022/11/09.
//

import Foundation

//let input = readLine()!.split(separator: " ").map { Int(String($0))! }

var numArray: [Int] = []
let total = 9
let selectNumber = 7
var cnt = 0
var container: [Int] = []
var isbreak: Bool = false

for _ in 0..<9 {
    let input = Int(readLine() ?? "")!
    numArray.append(input)
}

let sum = numArray.map { $0 }.reduce(0, +)
let diff = sum - 100

for i in 0..<total {
    if isbreak {
        break
    }
    for j in i+1..<total {
        if diff == numArray[i] + numArray[j] {
            numArray.remove(at: i)
            numArray.remove(at: j-1)
            numArray.sort(by: <)
            numArray.forEach {
                print("\($0)")
            }
            isbreak = true
            break
        }
    }
}





//func combination(start: Int, array: inout [Int]) {
//
//    // 기저 사례
//    if array.count == selectNumber {
//        cnt += 1
//
//        let sum = array.map { $0 }.reduce(0, +)
//
//        if sum == 100 {
//            let sortedArray = array.sorted { $0 < $1 }
//            for i in 0..<7 {
//                print(sortedArray[i])
//            }
//        }
//    }
//
//    // 재귀
//    for i in (start + 1)..<total {
//        array.append(numArray[i])
//        combination(start: i, array: &array)
//        array.popLast()
//    }
//}

//combination(start: -1, array: &container)
