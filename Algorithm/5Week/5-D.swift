//
//  5-D.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/11/27.
//

import Foundation

// baekjoon 14469 소가 길을 건나간 이유 3

/**
 소는 100마리 이하가 들어온다.
 도착 시간과 검문 시간이 주어진다.
 1,000,000 이하의 양의 정수.
 
 기다리는 시간을 최소로 줄여야한다.
 빨리 도착한 순서대로 정렬
 처리가 짧은 순서대로 pop
 
 two pointer, priority queue를 써야하나 고민했지만
 정렬 한 번 잘하고, 분기 로직 잘 짜주면 풀리는 문제
 
 */

let n = Int(readLine()!)!
var a: [(Int, Int)] = []


for i in 0..<n {
    let c = readLine()!.split(separator: " ").map { Int($0)! }
    a.append((c[0], c[1]))
}


// 빨리 도착한 순으로 정렬
a = a.sorted(by: {
    if $0.0 == $1.0 {
        return $0.1 < $1.1
    } else {
        return $0.0 < $1.0
    }
    
})

var ret = 0

for i in 0..<a.count {
    
    // ret 보다 더 느리게 도착하면 도착 시간 + 처리 시간
    if ret < a[i].0 {
        ret = a[i].0 + a[i].1
        continue
    }
    
    // ret 보다 더 빨리 도착하면 끝나고 바리 처리하기 때문에 ret + 처리시간 3+7
    else {
        ret += a[i].1
        continue
    }
    
}

var tt = String(ret)

print("\(tt)")
