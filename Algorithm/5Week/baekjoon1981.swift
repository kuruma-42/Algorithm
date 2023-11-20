//
//  baekjoon1981.swift
//  Algorithm
//  baekjoon 1931 회의실 배정
//  Created by Yong Jun Cha on 2023/11/20.
//

import Foundation

/**
 - Description
 N개의 회의실에 대한 사용표를 만드려고 함
 최대 회의의 갯수 구하라
 회의는 겹치면 안 된다.
 한 회의가 끝나는 것과 동시에 다음 회의가 시작될 수 있다.
 정렬을 하고 겹치는 것을 뽑으면 된다.
 소팅 기준을 잘 잡아야한다.
 같을 경우도 생각해줘야한다.
 */

let n = Int(readLine()!)!
var a: [(Int, Int)] = []
var ret = 1

for i in 0..<n {
    let c = readLine()!.split(separator: " ").map { Int($0)! }
    a.append((c[0], c[1]))
}

// 정렬을 잘 하면 분기를 칠 떄 최적화가 잘 된다.
// 이 정렬을 생각해야한다.
a = a.sorted {
    if $0.1 == $1.1 {
        return $0.0 < $1.0
    }
    
    else {
        return $0.1 < $1.1
    }
}
var from = a[0].0
var to = a[0].1
for i in 1..<n {
    
    // 앞의 회의 끝나는 시간이 뒤의 회의 시작 시간 보다 클 때 겹친다.
    if to > a[i].0 {
        continue
    }
    
    from = a[i].0
    to = a[i].1
    ret += 1
}

print(ret)
