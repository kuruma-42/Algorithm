//
//  5-C.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/11/27.
//

import Foundation

// baekjoon 1781 컵라면
/**
 데드라인이 작은 순서대로 소팅을 하고
 힙 우선순위는 라면 수가 적은 것으로 하고
 데드라인에 맞춰 작은 라면을 팝하면 된다
 저번에 배우는 최소를 작게 만들면 최대가 된다는 전략을 이용하면 된다.
 */

let n = Int(readLine()!)!
var a: [(Int, Int)] = []
var h: Heap<(Int, Int)> = Heap(array: [], sort: { $0.1 < $1.1 })
var ret = 0

for _ in 0..<n {
    let t = readLine()!.split(separator: " ").map { Int($0)! }
    a.append((t[0], t[1]))
}

a = a.sorted(by: { $0.0 < $1.0 })

for i in 0..<n {
    
    h.insert(a[i])
    
    if h.count > a[i].0 {
        h.remove()
    }
    
}

while !h.isEmpty {
    ret += h.remove()?.1 ?? 0
}

print(ret)
