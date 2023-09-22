//
//  3-O.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/09/22.
//

import Foundation

// baekjoon 15684 사다리조작

/**
 - Description
 > 세로선의 개수 N, 가로선의 개수 M, 가로선을 놓을 수 있는 위치의 개수 M
 가로선 정보 a와 b로 나타낸다.
 a번 점선의 b번 세로줄 과 b+1을 연결한다.
 i번 세로줄의 결과가 i번이 나오도록 결과를 조작하라.
 
 dfs로 풀어야 하나
 visited에 표시?
 */

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
let h = input[2]
var horiArr: [(Int, Int)] = []
let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]
var visited = Array(repeating: Array(repeating: 0, count: m+1), count: n+1)

for _ in 0..<m {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    horiArr.append((info[0],info[1]))
    visited[info[0]][info[1]] = 1
    visited[info[0]][info[1] + 1] = 1
}


func dfs(y: Int, x: Int) {
    
    
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        if ny < 0 || ny > n || nx < 0 || nx > m {
            continue
        }
        
        if visited[ny][nx] == 1 || i == 2 {
            dfs(y: ny, x: nx)
        }
        
        
    }
}


print("horiArr: \(horiArr)")
print("visited:: \(visited)")
