//
//  4-O.swift
//  Algorithm
//  baekjoon 15926 현욱은 괄호왕
//  Created by Yong Jun Cha on 2023/11/18.
//

import Foundation

/**
 짝 맞추기 문제 스택으로 풀 것
 */
let n = Int(readLine()!)!
let s = Array(readLine()!).map { String($0) }
var d = Array(repeating: 0, count: 200001)
var stk: [Int] = []
var cnt = 0
var ret = -1

for i in 0..<n {
    let a = s[i]
    
    if a == "(" {
        // 열린 괄호 어팬드
        stk.append(i)
    } else {
        if stk.count > 0 {
                d[i] = 1
                d[stk.removeLast()] = 1
        }
    }
}
for i in 0..<n {
    if d[i] == 1 {
        cnt += 1
        ret = max(ret, cnt)
    } else {
        cnt = 0
    }
}

print(ret)
