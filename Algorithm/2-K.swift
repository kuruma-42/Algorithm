//
//  2-K.swift
//  Algorithm
//  baekjoon 3474
//  Created by Yong Jun Cha on 2023/06/28.
//

import Foundation


var n = Int(readLine()!)!
var arr: [Int] = []

for _ in 0..<n {
    var p = Int(readLine()!)!
    var i = 1
    var twoCnt = 0
    var fiveCnt = 0
    
    while i < p {
        i *= 2
        twoCnt += p / i
    }
    i = 1
    
    while i < p {
        i *= 5
        fiveCnt += p / i
    }
    
    print("\(min(twoCnt, fiveCnt))")
}

/**
 - Description
 > 팩토리얼을 일단 반복문으로 돌리기 시작하면 O(N!) 이기 때문에 안 된다.
 0의 갯수를 2와 5의 갯수를 각각 구해서 최솟값으로 계산한다.
 이 아이디어를 얻는 것도 1차적으로 매우 어려웠다
 그리고 2와 5를 구하는 것도 2의 승수로 60 / 2, 60/4, 60/8 ...
 등을 연산해 몫을 더해 값을 구하는 아이디어는 상상도 못했다.
 로직은 간단하나 아이디어를 못 얻어서 못 푸는 문제가 정말 어렵다.
 */
