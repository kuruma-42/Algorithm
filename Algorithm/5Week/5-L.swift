//
//  5-L.swift
//  Algorithm
//  baekjoon 14889 스타트와 링크
//  Created by Yong Jun Cha on 2023/12/03.
//

import Foundation


/**
 비트마스킹으로 풀어야한다는 걸 눈치 못채서
 순열로 풀려고 시도해봤다가 바로 답이 없어서
 다른 알고리즘을 썼다.
 복잡한 구현이 아닌데 구현이 어렵다.
 구현력이 조금 더 필요한 것 같다.
 */

let n = Int(readLine()!)!
let INF = 987654321
var s: [[Int]] = []
var ret = INF

func go(a: inout [Int], b: inout [Int]) -> Int {
    var ret: (Int, Int) = (0, 0)
    // 인원수의 반만큼 반복문을 돌린다.
    for i in 0..<n/2 {
        for j in 0..<n/2 {
            // 같은 경우는 0이기 때문에 건너뛴다.
            if (i == j) { continue }
            // 좌표의 모든 곳을 더해준다.
            ret.0 += s[a[i]][a[j]]
            ret.1 += s[b[i]][b[j]]
        }
    }
    // 절대값을 취한뒤 리턴
    return abs(ret.0 - ret.1);
}

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    s.append(input)
}

for i in 0..<(1 << n) {
    // 비트가 켜져있는 수가 n/2라면 팀이 정확히 두 개로 나뉜 것.
    // 나머직 경우의 수는 전부 컨틴뉴
    if i.nonzeroBitCount != n/2 { continue }
    // 벡터롤 두 팀을 만들어주고
    var start: [Int] = [], link : [Int] = []
    for j in 0..<n {
        if i & (1 << j) != 0 {
            // 비트가 켜진 곳을 스타트 팀에
            start.append(j)
        } else {
            // 비트가 꺼진 곳을 링크 팀에 넣는다.
            link.append(j)
        }
    }
    
    ret = min(ret, go(a: &start, b: &link))
}


print(ret)
