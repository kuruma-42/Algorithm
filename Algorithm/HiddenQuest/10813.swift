//
//  10813.swift
//  Algorithm
//  baekjoon 10813 공 바꾸기
//  Created by Yong Jun Cha on 2/6/24.
//

import Foundation

var input = readLine()!.split(separator: " ").map { Int($0)! }
var n = input[0]
var m = input[1]
var arr: [Int] = []

for i in 0..<n {
    arr.append(i+1)
}

for j in 0..<m {
    var t = readLine()!.split(separator: " ").map { Int($0)! }
    var c = t[0]
    var z = t[1]
    arr.swapAt(c - 1 , z - 1)
}

for i in 0..<n {
    print(arr[i], terminator: " ")
}
