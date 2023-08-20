//
//  2-B.swift
//  Algorithm
//  baekjoon 1012
//  Created by Yong Jun Cha on 2023/05/30.
//

import Foundation

// testCase
var t = Int(readLine()!)!

for _ in 0..<t {
    let information = readLine()!.split(separator: " ").map { Int($0)! }

    // 가로 길이
    let m = information[0]
    // 세로 길이
    let n = information[1]
    // 배추 갯수
    let k = information[2]

    var map: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
    var visited: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
    
    let dy = [1, 0, -1, 0]
    let dx = [0, 1, 0, -1]
    
    var clust: Int = 0
    
    // 제한 범위
    if m < 0 || m > 50 || n < 0 || n > 50 || k < 1 || k > 2500 {
        continue
    }

    for _ in 0..<k {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let y = input[1]
        let x = input[0]
        
        map[y][x] = 1
    }

    func go(there: [Int]) {
        
        let y = there[0]
        let x = there[1]
        
        // 방문처리
        visited[y][x] = 1
        
        for i in 0..<4 {
            
            // 다음 좌표
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            // 범위 설정
            if nx >= m || nx < 0 || ny >= n || ny < 0 {
                continue
            }
            
            if map[ny][nx] == 1 && visited[ny][nx] == 0 {
                // 재귀
                go(there: [ny, nx])
            }
        }
        return
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if map[i][j] == 1 && visited[i][j] == 0 {
                clust += 1
                go(there: [i, j])
            }
        }
    }
    print("\(clust)")
}

/// - Description: Connected Component를 찾는 문제
