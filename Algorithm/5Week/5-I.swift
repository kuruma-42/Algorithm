//
//  baekjoon3273.swift
//  Algorithm
//  baekjoon 3273 두 수의 합
//  Created by Yong Jun Cha on 2023/11/24.
//

import Foundation

/**
 서로 다른 양의 정수 a1, a2, ..., an으로 된 수열
 자연수 x가 주어졌을 때, ai + aj = x (1 ≤ i < j ≤ n)을 만족하는 (ai, aj)쌍의 수를 구하는 프로그램을 작성하시오.
 완전탐색으로 풀면 시간초과가 난다.
 투포인터 조건을 생각해서 시간을 줄여야한다.
 정렬을 하면 비로소 조건이 보이는 경우가 많다.
 */

let n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!

var l = 0
var r = n - 1
var ret = 0
var cnt = 0

a = a.sorted { $0 < $1 }

while l < r {
    
    if a[l] + a[r] == m {
        ret += 1
        r -= 1
    }
    
    if a[l] + a[r] > m {
        r -= 1
    }
    
    if a[l] + a[r] < m {
        l += 1
    }
}

print(ret)
