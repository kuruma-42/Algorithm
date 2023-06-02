//
//  2-C.swift
//  Algorithm
//  Baekjoon 2468
//  Created by Yong Jun Cha on 2023/06/02.
//

import Foundation

// Connected Component Count
var n = Int(readLine()!)!

var map: [[Int]] = []
var dy = [1, 0, -1, 0]
var dx = [0, 1, 0, -1]
var visited = Array(repeating: Array(repeating: 0, count: n), count: n)
var result: Int = 0
var ret: Int = 1

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(input)
}

func go(y: Int, x: Int, d: Int) {
    
    // 방문 처리
    visited[y][x] = 1
    
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        if ny >= n || ny < 0 || nx >= n || nx < 0 || map[ny][nx] <= d {
            continue
        }
        
        if visited[ny][nx] != 0 {
            continue
        }
        
        go(y: ny, x: nx, d: d)
    }
    return
}

for d in 1..<101 {
    visited = Array(repeating: Array(repeating: 0, count: n), count: n)
    result = 0
    for i in 0..<n {
        for j in 0..<n {
            // n 보다 작으면 물에 잠김 && 방문한 곳은 안 간다.
            if map[i][j] > d  && visited[i][j] == 0 {
                result += 1
                go(y: i, x: j, d: d)
            }
        }
    }
    ret = max(ret, result)
}

print("\(ret)")

/// - Description
/// 여기서 가장 중요한 것은 dfs를 단순히 푸는 것이 아니라
/// 범위를 잘 찾는 것이고 반례를 잘 찾는 것이다.
/// 문제에서 준 반례 힌트는 아무곳도 잠기지 않는 경우도 고려해야한다는 것이다.
/// 아무곳도 안 잠기면 Connected Component는 전체가 되므로 0이 아니라 1이 된다.
/// 항상 범위와 반례에 대해서 꼼꼼히 신경써야 한다.
