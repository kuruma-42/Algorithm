//
//  2-D.swift
//  Algorithm
//  Baekjoon 2538
//  Created by Yong Jun Cha on 2023/06/02.
//

import Foundation

var information = readLine()!.split(separator: " ").map { Int($0)! }

// 세로 길이
var m = information[0]
// 가로 길이
var n = information[1]
// 직사각형 갯수
var k = information[2]

// map 에다가 0 표시를 하면 됨 못가게
// dfs 로 하고 visited에 + 1 을 해주면 될 것 같다.

var map = Array(repeating: Array(repeating: 0, count: n), count: m)
var visited = Array(repeating: Array(repeating: 0, count: n), count: m)

var dy = [1, 0, -1, 0]
var dx = [0, 1, 0, -1]

var cnt = 0
var ret = 0
var retArray: [Int] = []

for _ in 0..<k {
    var input = readLine()!.split(separator: " ").map { Int($0)! }
    var x1 = input[0]
    var y1 = input[1]
    var x2 = input[2]
    var y2 = input[3]
    
    for i in y1..<y2 {
        for j in x1..<x2 {
            map[i][j] = 1
        }
    }
}

func dfs(y: Int, x: Int) {
    ret += 1
    visited[y][x] = 1
    
    for i in 0..<4 {
        var ny = y + dy[i]
        var nx = x + dx[i]
        
        if ny >= m || ny < 0 || nx >= n || nx < 0 {
            continue
        }
        
        if map[ny][nx] == 1 {
            continue
        }
        
        if visited[ny][nx] != 0 {
            continue
        }
        
        dfs(y: ny, x: nx)
    }
    
    return
    
}

for i in 0..<m {
    for j in 0..<n {
        if map[i][j] == 0 && visited[i][j] == 0 {
            ret = 0
            cnt += 1
            dfs(y: i, x: j)
            retArray.append(ret)
        }
    }
}

print("\(cnt)")
retArray.sorted(by: <).forEach {
    print("\($0)", terminator: " ")
}
