//
//  1546.swift
//  Algorithm
//  baekjoon 1546 평균
//  Created by Yong Jun Cha on 2/12/24.
//

import Foundation

/**
 자기 점수 중 최댓값을 고른 후
 모든 점수/M*100 으로 고친다.
 Float을 나누려면 나누는 값도 명시적으로 Float을 선언해야한다.
 */

var n = Int(readLine()!)!
var arr: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var maxVal = 0
var ret: Float = 0

maxVal = arr.max()!

for i in arr {
    ret += (Float(i) / Float(maxVal) * 100)
}

print(ret / Float(n))
