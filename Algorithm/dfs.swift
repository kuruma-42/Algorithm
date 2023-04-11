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

