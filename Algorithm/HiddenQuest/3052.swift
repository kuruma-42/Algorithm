//
//  3052.swift
//  Algorithm
//  baekjoon 3052 나머지 히든퀘스트
//  Created by Yong Jun Cha on 2/9/24.
//

import Foundation

let n = 10
let m = 42
var arr: [Int] = []

for i in 0..<n {
    arr.append(Int(readLine()!)! % m)
}
print(Set(arr).count)

/**
 더 간단하게 풀려면 처음부터 타입을 선언할 때 Set으로 선언하여 중복을
 없애주면 시간을 더 단축할 수 있다.
 ```
 var r: Set<Int> = []
 for _ in 1...10 {
     r.insert(Int(readLine()!)!%42)
 }
 print(r.count)
 ```
 */
