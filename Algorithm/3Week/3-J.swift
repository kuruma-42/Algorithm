//
//  3-J.swift
//  Algorithm
//  baekjoon 14497 주난의 난
//  Created by Yong Jun Cha on 2023/09/13.
//

import Foundation

/**
 - Description
 > 최소거리라고 해서 bfs로 풀어야 할 것 같았지만
 사방 탐색이나 레이어 탐색이 아닌 주변의 한겹을 벗겨내야하는 것이므로
 dfs를 특정 조건에서 멈추게 하면 한 겹을 벗길 수 있다.
 */

var input = readLine()!.split(separator: " ").map { Int($0)! }
var n = input[0]
var m = input[1]
var input2 = readLine()!.split(separator: " ").map { Int($0)! }
var visited = Array(repeating: Array(repeating: 0, count: m), count: n)
var map: [[String]] = []
// 주난이의 위치
var j = [input2[0], input2[1]]
// 범인의 위치
var b = [input2[2], input2[3]]

// 이 생각이 틀림 사방으로 벗겨 내야함
var dy = [1, 0, -1, 0]
var dx = [0, 1, 0, -1]
var turn = 0
var ok: Bool = false
// 맵 입력
for _ in 0..<n {
    let info = Array(readLine()!).map { String($0) }
    map.append(info)
}

func dfs(y: Int, x: Int) {
    
    // 방문 처리
    visited[y][x] = 1
    
    // 만약 학생이면
    if map[y][x] == "1" {
        // 친구들을 쓰러트리고
        map[y][x] = "0"
        // 탐색을 멈춘다
        return
    }
    
    if map[y][x] == "#" {
        ok = true
        return
    }
    // 기저사례
    
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        if ny < 0 || ny >= n || nx < 0 || nx >= m {
            continue
        }
        
        if visited[ny][nx] != 0 {
            continue
        }
        
        dfs(y: ny, x: nx)
        
    }
    
}

while ok == false {
    // 점프 횟수
    turn += 1
    // 방문 초기화
    visited = Array(repeating: Array(repeating: 0, count: m), count: n)
    // dfs 친구들 한 겹 줄이기
    dfs(y: j[0] - 1, x: j[1] - 1)
}

print("\(turn)")
