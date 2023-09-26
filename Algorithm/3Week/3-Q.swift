//
//  3-Q.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/09/26.
//

import Foundation

// baekjoon 1189 컴백홈

/**
 - Description
 > 지나친 곳을 방문하지 않는다.
 왼쪽 아래 캠프가 있다.
 오른쪽 위에 집이 있다.
 T는 못지나 가는 곳
 예외 ( T가 여러 개 이거나 안 주어진다면?)
 R(1 ≤ R ≤ 5), C(1 ≤ C ≤ 5), K(1 ≤ K ≤ R×C)

 */

var input = readLine()!.split(separator: " ").map { Int($0)! }
var r = input[0]
var c = input[1]
var k = input[2]
var T: (Int, Int) = (0,0)
var camp: (Int, Int) = (r-1, 0)
var home: (Int, Int) = (0, c-1)
var visited = Array(repeating: Array(repeating: 0, count: c), count: r)
var a: [[String]] = []
var dy = [1, 0, -1, 0]
var dx = [0, 1, 0, -1]
var ret: Int = 0

for i in 0..<r {
    let info = Array(readLine()!).map { String($0) }
    a.append(info)
    for j in 0..<c {
        if a[i][j] == "T" {
            T = (i,j)
        }
    }
}

func dfs(y: Int, x: Int, cnt: Int) {
    
    if cnt == k && (y,x) == home {
        ret += 1
        return
    }
    
    visited[y][x] = 1
    
    // 기저 사례
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        // 오버 플로우 체킄
        if ny < 0 || ny >= r || nx < 0 || nx >= c {
            continue
        }
        
        // 방문했던 곳이라면
        if visited[ny][nx] != 0 {
            continue
        }
        
        // 발문할 곳이 T라면
        if a[ny][nx] == "T" {
            continue
        }
        // dfs 호출
        dfs(y: ny, x: nx, cnt: cnt + 1)
        // 탐색 끝나면 초기화
        visited[ny][nx] = 0
        
    }
}

dfs(y: camp.0, x: camp.1, cnt: 1)
print("\(ret)")

