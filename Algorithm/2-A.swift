//
//  2-A.swift
//  Algorithm
// BaekJoon 2178
//  Created by Yong Jun Cha on 2023/05/30.
//

import Foundation
var mapSize = readLine()!.split(separator: " ").map { Int($0)! }

var n = mapSize[0]
var m = mapSize[1]
var map: [[Int]] = []
var visited = Array(repeating: Array(repeating: 0, count: m), count: n)

var dy = [1, 0, -1, 0]
var dx = [0, 1, 0, -1]

for _ in 0..<n {
    var input = readLine()!.map {Int(String($0))!}
    map.append(input)
}

var sx = 0
var sy = 0
var q: [[Int]] = []

q.append([sy, sx])
visited[sy][sx] = 1

while q.count != 0 {
    var here = q.first!
    q.removeFirst()
    
    for i in 0..<4 {
        let ny = here[0] + dy[i]
        let nx = here[1] + dx[i]
        if ny >= n || ny < 0 || nx >= m || nx < 0 || map[ny][nx] == 0 {
            continue
        }
        
        if visited[ny][nx] != 0 {
            continue
        }
        
        visited[ny][nx] = visited[here[0]][here[1]] + 1
        q.append([ny, nx])
    }
}

print("\(visited[n - 1][m - 1])")

