//
//  3-C.swift
//  Algorithm
//  baekjoon 16234 인구이동
//  Created by Yong Jun Cha on 2023/08/27.
//

import Foundation

/**
 - Description
 국경선을 공유하는 두 나라의 인구 차이가 L명 이상, R명 이하라면, 두 나라가 공유하는 국경선을 오늘 하루 동안 연다.
 재귀나 while문으로 풀어야 함
 한 번 탐색해서 조건에 해당 되는 수들을 다 더하고
 평균을 낸 후 값을 전부 바꿔준다.
 다시 탐색해서 조건에 해당하는 범위를 이동 가능하게 만들어주고 더해서 나눠준다.
 dfs로 간단하게 풀줄 알았는데 dfs를 여러군데
 */
//



var input = readLine()!.split(separator: " ").map { Int($0)! }
// 몇 줄의 데이터가 들어오는지
var n = input[0]
// 두 수의 차의 최소 범위
var l = input[1]
// 두 수의 차의 최대 범위
var r = input[2]

var dy = [1, 0, -1, 1]
var dx = [0, 1, 0, -1]

var visited = Array(repeating: Array(repeating: 0, count: n), count: n)
var map: [[Int]] = []
// 국경이 열린 나라의 좌표
var indicator: [[Int]] = []
// 전체 연합 인구수
var total = 0
// 국경이 열린 나라
var cnt = 0
// 평균 값
var average = 0
// 인구 이동 횟수
var result = 0

for _ in 0..<n {
    var info = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(info)
}

func dfs(y: Int, x: Int, v: inout [[Int]]) {

    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]

        if ny < 0 || ny >= n || nx < 0 || nx >= n || visited[ny][nx] != 0 {
            continue
        }

        if abs(map[y][x] - map[ny][nx]) >= l && abs(map[y][x] - map[ny][nx]) <= r {
            // 방
            visited[ny][nx] = 1
            v.append([ny,nx])
            total += map[ny][nx]
            dfs(y: ny,x: nx,v: &v)
        }
    }
}

while true {
    var flag = false
    // 방문 초기화
    visited = Array(repeating: Array(repeating: 0, count: n), count: n)
    for i in 0..<n {
        for j in 0..<n {
            if visited[i][j] == 0 {
                indicator.removeAll()
                visited[i][j] = 1
                indicator.append([i,j])
                total += map[i][j]
                dfs(y: i, x: j, v: &indicator)
                if indicator.count == 1 {
                    continue
                }
                for locate in indicator {
                    map[locate[0]][locate[1]] =
                    total / indicator.count
                    flag = true
                }
            }
        }
    }
    
    if !flag {
        break
    }
    
  result += 1
}

print("\(result)")
