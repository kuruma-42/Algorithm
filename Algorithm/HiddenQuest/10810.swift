//
//  10810.swift
//  Algorithm
//  baekjoon 2562 공넣기 최댓값
//  Created by Yong Jun Cha on 2/4/24.
//

import Foundation

/**
 9개의 숫자가 들어온다.
 최댓 값이 몇 번째 수인지를 구하는 프로그램을 작성하시오.
 배열 잘 쓰는 방법
 */

var a: [Int] = []
var maxVal = -987654321
var idx = 0

for i in 0..<9 {
    a.append(Int(readLine()!)!)
}

maxVal = a.max()!
idx = a.firstIndex(of: maxVal)!
print(maxVal)
print(idx + 1)

