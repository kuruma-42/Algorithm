//
//  dfs.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/04/11.
//

import Foundation

/**
 DFS (깊이우선탐색)
 DFS는 그래프를 탐색할 때 쓰는 알고리즘이며 어떤 노드부터 시작해 인접한
 노드들을 재귀적으로 방문하며 방문한 정점은 다시 방문하지 않으며
 각 분기마다 가능한 가장 멀리 있는 노드까지 탐색하는 알고리즘
 
 ```
 * pseudocode
 DFS(u, adj)
     u.visited = true
     for each v ∈ adj[u]
         if v.visited == false
             DFS(v, adj)
 ```
 */

var n: Int = 5
var graph:[[Int]] = Array(repeating: [], count: n + 1)
var visited = Array(repeating: 0, count: n + 1)
print("\(graph)")

graph[1].append(contentsOf: [2,3])
graph[2].append(contentsOf: [4,5])
graph[3].append(1)
graph[4].append(2)
graph[5].append(2)

func dfs(from: Int) {
    visited[from] = 1
    print("visited :: \(from)")
    for i in graph[from] {
        if visited[i] == 1 {
            continue
        }
        dfs(from: i)
    }
    print("func end :: \(from)")
    return
}

dfs(from: 1)


/// dfs 예제 문제 풀이 
var input = readLine()!.split(separator: " ").map{ Int($0)! }
// Range
var yRange = input[1]
var xRange = input[0]

// Set 4 Direction
var dy = [-1, 0, 1, 0]
var dx = [0, 1, 0, -1]

var result = 0

// Map
var map: [[Int]] = Array(repeating: [], count: yRange)
var visited = Array(repeating: Array(repeating: 0, count: xRange), count: yRange)

for i in 0..<5 {
    var input = readLine()!.split(separator: " ").map{ Int($0)! }
    map[i].append(contentsOf: input)
}

print("\(map)")

func go(y: Int, x: Int) {
    // 방문처리
    visited[y][x] = 1
    
    for i in 0..<4 {
        
        // 4 방향
        var ny = y + dy[i]
        var nx = x + dx[i]
        
        // Over Flow Check
        if nx < 0 || nx >= xRange || ny < 0 || ny >= yRange {
            continue
        }
        
        // Visit Check
        if visited[ny][nx] == 1 {
            continue
        }
        
        if map[ny][nx] == 1 && visited[ny][nx] == 0 {
            go(y: ny, x: nx)
        }
    }
    return
    
}

for i in 0..<yRange {
    for j in 0..<xRange {
        if map[i][j] == 1 && visited[i][j] == 0 {
            result += 1
            go(y: i, x: j)
        }
    }
}

print("result : \(result)")
