//
//  10810.swift
//  Algorithm
//  baekjoon 10810 공넣기
//  Created by Yong Jun Cha on 2/4/24.
//

import Foundation

var input = readLine()!.split(separator:" ").map{ Int($0)! }
var n = input[0]
var m = input[1]
var arr = Array(repeating: 0, count: n)

for i in 0..<m {
    var t = readLine()!.split(separator:" ").map{ Int($0)! }
    let x1 = t[0] - 1
    let x2 = t[1]
    let v = t[2]
    
    for j in x1..<x2 {
        arr[j] = v
    }
}

for k in arr {
    print(k, terminator: " ")
}

