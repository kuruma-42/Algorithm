//
//  1-A.swift
//  Algorithm
//  BaekJoon 2309 
//  Created by Yong Jun Cha on 2023/02/01.
//

import Foundation

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

/**
 - Description
 이해했다고 생각한 조합을 실제로 문제로 풀어보니깐 내가 암기도 안 되어있었고,
 반복문으로 구현하려다가 Recursive로 구현하고 싶다고 욕심을 부리다가
 재귀로 구현하다가 실패하니깐 시간이 엄청 걸리기 시작했다.
 for문 세 개 정도는 반복문으로 구현하는 것이 실수가 적을 것 같다.
 */

// Recursive func
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
