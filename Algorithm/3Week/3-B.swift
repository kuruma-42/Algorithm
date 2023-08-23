//
//  3-B.swift
//  Algorithm
//  baekjoon 2589 보물섬
//  Created by Yong Jun Cha on 2023/08/20.
//

import Foundation

/**
 bfs 확실히 외워주고
 반복문 안에 if문 최대한 줄여줘야한다.
 최단거리라는키워드가 나왔을 때 바로 bfs를 생각했어야 하고
 nC2를 생각하기 보다는 바로 bfs를 통해 모든 점에서 부터의 최단 거리를 구하고
 max 값을 구하면 좀 더 효율적이다.
 */


var input = readLine()!.split(separator: " ").map { Int($0)! }
var n = input[0]
var m = input[1]
var map: [[String]] = []
var visited = Array(repeating: Array(repeating: 0, count: m), count: n)

var landList: [[Int]] = []
var waterList: [[Int]] = []
var arrive: [Int] = []

var dy = [1, 0, -1, 0]
var dx = [0, 1, 0, -1]
var mx = -1


// 맵 입력 받기
for _ in 0..<n {
    let info = readLine()!.map { String($0) }
    map.append(info)
}

for i in 0..<n {
    for j in 0..<m {
        // 땅이 있는 곳 좌표 저장
        if map[i][j] == "L" {
            bfs(y: i, x: j)
        }
    }
}


func bfs(y: Int, x: Int) {
    // 방문 초기화
    visited = Array(repeating: Array(repeating: 0, count: m), count: n)
    // Queue 생성
    var q: [[Int]] = []
    // 방문처리
    visited[y][x] = 1
    
    q.append([y, x])
    while !q.isEmpty {
        let here = q.first!
        q.removeFirst()
        for i in 0..<4 {
            // 다음 탐색지역 설정
            let ny = here[0] + dy[i]
            let nx = here[1] + dx[i]
            
            // 영역 설정
            if ny < 0 || ny >= n || nx < 0 || nx >= m ||  visited[ny][nx] != 0 || map[ny][nx] == "W"{
                continue
            }
            
            visited[ny][nx] = visited[here[0]][here[1]] + 1
            q.append([ny, nx])
            mx = max(mx, visited[ny][nx])
        }
    }
}

print("\(mx - 1)")
