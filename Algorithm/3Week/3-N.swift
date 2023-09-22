//
//  3-N.swift
//  Algorithm
//  baekjoon 9934
//  Created by Yong Jun Cha on 2023/09/22.
//

import Foundation


/**
 - Description
 > 완전 이진 트리
 재귀로 반으로 나누고 좌우 어팬드
 */

var n = Int(readLine()!)!
var info = readLine()!.split(separator: " ").map { Int($0)! }
var arr: [[Int]] = Array(repeating: [], count: n)
var mid = info.count / 2

func go(info: [Int], cnt: Int) {
    
    if cnt == n - 1 {
        arr[cnt].append(contentsOf: info)
        return
    }
    
    var idx = info.count / 2
    arr[cnt].append(info[idx])
    
    var left: [Int] = []
    for i in 0..<idx {
        left.append(info[i])
    }
    go(info: left, cnt: cnt + 1)
    
    
    var right: [Int] = []
    for i in idx+1..<info.count {
        right.append(info[i])
    }
    go(info: right, cnt: cnt + 1)
}

go(info: info, cnt: 0)

for i in 0..<n {
    for j in 0..<arr[i].count {
        print("\(arr[i][j])", terminator: " ")
    }
    print("")
}
