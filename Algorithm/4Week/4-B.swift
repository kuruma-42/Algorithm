//
//  4-B.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/10/12.
//

import Foundation

// baekjoon 1285 동전뒤집기

/**
 - Description
 동전 뒤집기 비트마스킹 토글
 H가 앞면
 T가 뒷면
 뒷면이 최소로 몇 개가 나오는지 구할 것
 한 열 한 행을 전부 뒤집는 기능을 만들어야 한다.
 */

var n = Int(readLine()!)!
var a = Array(repeating: 0, count: n)

let INF = 987654321
var ret = INF


for i in 0..<n {
    var info = Array(readLine()!).map { String($0) }
    var value = 1
    for j in 0..<n {
        // 만약 뒷 면이라면
        if info[j] == "T" {
            a[i] |= value
        }
        value *= 2;
    }
}


func go(_ here: Int) {
    if here == n + 1 {
        var sum = 0
        var i = 1
        while i <= (1 << (n - 1)) {
            var cnt = 0
            for j in 1...n {
                if a[j] & i != 0 {
                    cnt += 1
                }
            }
            sum += min(cnt, n - cnt)
            i *= 2
        }
        ret = min(ret, sum)
        return
    }
    a[here] = ~a[here]
    go(here + 1)
    a[here] = ~a[here]
    go(here + 1)
}

