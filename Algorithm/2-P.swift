//
//  2-P.swift
//  Algorithm
//  Baekjoon 14502 연구소
//  Created by Yong Jun Cha on 2023/08/04.
//

import Foundation

/**
 - Description
 브루트 포스로 일단 풀어봐야한다.
 우선 조합으로 3개의 벽을 세우는 모든 경우의 수를 진행시킨다.
 바이러스를 퍼트리고
 안전지대의 계수를 탐색하면서 센다.
 */

var input = readLine()!.split(separator: " ").map { Int($0)! }
var n = input[0]
var m = input[1]
var ret = 0

var visited = Array(repeating: Array(repeating: 0, count: m), count: n)
var map: [[Int]] = []
var wallList:[[Int]] = []
var virusList: [[Int]] = []

func dfs(y: Int, x: Int) {
    visited[y][x] = 1
    
    let dy = [1,0,-1,0]
    let dx = [0,1,0,-1]
    
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        if ny >= n || nx >= m || ny < 0 || nx < 0 || map[ny][nx] == 1 {
            continue
        }
        
        if visited[ny][nx] == 1 {
            continue
        }
        
        dfs(y: ny, x: nx)
    }
    return
}


func solve() -> Int  {
    // 바이러스가 있는 곳에서 dfs를 해서 4방향으로 바이러스를 퍼트린다.
    for i in 0..<virusList.count {
        // 방문한 적이 없다면
        if visited[virusList[i].first!][virusList[i].last!] != 1 {
            // 탐색
            dfs(y:virusList[i].first!, x:virusList[i].last!)
        }
    }
    
    // 안전지대 갯수 정의
    var cnt = 0
    for i in 0..<n {
        for j in 0..<m {
            // 맵과 방문한 곳을 순회하며 안전지대를 탐색
            if map[i][j] == 0 && visited[i][j] == 0 {
                // 맵에서 빈 공간이어야 하고, 방문한 적이 없어야 한다.
                cnt += 1
            }
        }
    }
    // 안전지대 갯수 리턴
    return cnt
}

for i in 0..<n {
    var line = readLine()!.split(separator: " ").map { Int($0)! }
    for j in 0..<m {
        
        // 바이러스 리스트를 구성
        if line[j] == 2 {
            // 이 리스트를 구성하는 아이디어가 굉장히 중요함
            virusList.append([i,j])
        }
        
        // 벽을 세울 수 있는 공간 리스트를 구성
        if line[j] == 0 {
            // 이 리스트를 구성하는 아이디어가 굉장히 중요함
            wallList.append([i,j])
        }
        
        // WallList로 기둥을 세울 곳을 3곳을 좌표 형태로 뽑을 수 있고
        // VirustList로 탐색을 할 곳을 좌표 형태로 dfs할 수 있다.
    }
    // 맵 전체를 구성
    map.append(line)
}

// Combination nC3
// 벽 세개를 세우는 모든 경우의 수
for i in 0..<wallList.count {
    for j in i+1..<wallList.count {
        for k in j+1..<wallList.count {
            // 기둥 3개를 뽑고
            map[wallList[i].first!][wallList[i].last!] = 1
            map[wallList[j].first!][wallList[j].last!] = 1
            map[wallList[k].first!][wallList[k].last!] = 1
            
            // 최댓값을 비교 한다
            ret = max(ret, solve())
            
            // 방문 초기화
            visited = Array(repeating: Array(repeating: 0, count: m), count: n)
            
            //기둥 선택 초기화
            map[wallList[i].first!][wallList[i].last!] = 0
            map[wallList[j].first!][wallList[j].last!] = 0
            map[wallList[k].first!][wallList[k].last!] = 0
            
        }
    }
}

// 결과 출력
print("\(ret)")
