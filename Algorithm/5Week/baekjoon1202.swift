//
//  baekjoon1202.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/11/22.
//

import Foundation


// baekjoon 1202 보석도둑
/**
 - Description
 상덕이 보석 털기로 함
 무게 M
 가격 V를 가지고 있다.
 각 가방에 담을 수 있는 무게는 C이다.
 가방에는 최대 1개의 보석을 넣을 수 있다.
 
 첫째 줄에 N과 K가 주어진다.
 N은 보석의 갯수
 K는 가방에 담을 수 있는 무게
 
 N K 300000개
 MN <= 1억
 */

var input = readLine()!.split(separator: " ").map { Int($0)! }
var n = input[0]
var k = input[1]
var a: [(Int, Int)] = []
var w: [Int] = []
var ret = 0

for _ in 0..<n {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    a.append((info[0],info[1]))
}

for _ in 0..<k {
    let m = Int(readLine()!)!
    w.append(m)
}

// 정렬을 무게로 하자
a = a.sorted {
    // 가치가 같다면
    if $0.1 == $1.1 {
        // 무게가 가벼운 것으로
        return $0.0 < $1.0
    }
    // 가치가 다르다면
    else {
        // 가격이 높은 순으로
        return $0.1 > $1.1
    }
}

// 값어치 작은 애를 가장 작은 주머니에 넣으면 이득
// 오름 차순 정렬
w = w.sorted(by: <)


var idx = 0
for i in 0..<n {
    
    if w.isEmpty {
        break
    }
    
    for j in 0..<k {
        if a[i].0 <= w[j] {
            ret += a[i].1
            w.remove(at: j)
            k -= 1
            break
        }
    }
    
}
print(ret)
