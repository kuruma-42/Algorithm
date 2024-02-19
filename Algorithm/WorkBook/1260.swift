//
//  1260.swift
//  Algorithm
//  baekjoon 1260 dfs bfs
//  Created by Yong Jun Cha on 2/19/24.
//

import Foundation

var input = readLine()!.split(separator: " ").map { Int($0)! }
var n = input[0]
var m = input[1]
var v = input[2]

var arr: [[Int]] = Array(repeating: [], count: n + 1)
var visited = Array(repeating: 0, count: n + 1)

for _ in 1..<m + 1 {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    let x1 = info[0]
    let x2 = info[1]
    
    arr[x1].append(x2)
    arr[x2].append(x1)
}

dfs(v)

func dfs( _ next: Int) {
    
    visited[next] = 1
    print(next, terminator: " ")
    
    for i in arr[next].sorted(by: <) {
        if visited[i] != 1 {
            dfs(i)
        }
    }
    
}

visited = Array(repeating: 0, count: n + 1)
print("")
bfs()

func bfs() {
    var q: [Int] = []
    visited[v] = 1
    q.append(v)
    
    while !q.isEmpty {
        var t = q.removeFirst()
        // 방문처리
        print(t, terminator: " ")
        for i in arr[t].sorted(by: <) {
            if visited[i] != 0 {
                continue
            }
            
            visited[i] = visited[t] + 1
            
            q.append(i)
        }
    }
}
