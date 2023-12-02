//
//  5-K.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/12/01.
//

import Foundation

// baekjoon 17144 미세먼지 안녕!

let input = readLine()!.split(separator: " ").map { Int($0)! }
var r = input[0], c = input[1], t = input[2]
var a: [[Int]] = []
var cleaner: [[Int]] = []
var dust: [[Int]] = []
let dy = [0, 1, 0, -1]
let dx = [-1, 0, 1, 0]
var visited = Array(repeating: Array(repeating: 0, count: c), count: r)
var temp: [[Int]] = []

for i in 0..<r {
    let t =  readLine()!.split(separator: " ").map { Int($0)! }
    a.append(t)
    for j in 0..<c {
        if t[j] == -1 {
            cleaner.append([i,j])
        } else if  t[j] != 0 {
            dust.append([i,j])
        }
    }
}


func bfs(queue: [[Int]]) {
    
    var front = 0
    while front < queue.count {
        let q = queue[front]
        let y = q[0]
        let x = q[1]
        
        // 확산
        for i in 0..<4 {
            // 다음 좌표
            let ny = q[0] + dy[i]
            let nx = q[1] + dx[i]
            
            // 오버플로우 체크
            if ny < 0 || ny >= r || nx < 0 || nx >= c {
                continue
            }
            
            // 공기 청정기 쪽으로는 안 퍼짐
            if a[ny][nx] == -1 {
                continue
            }
            
            // 먼지 양
            let amount = a[y][x]
            let spread = amount / 5
            
            // 나누기 5했는데 0이면 안 퍼짐
            if spread == 0 {
                continue
            } else {
                // 이동한 먼지만큼 뺴주고
                a[y][x] -= spread
                // 퍼진 곳에 먼지를 더해주고
                a[ny][nx] += spread
                // temp 큐에 담아준다.
                temp.append([ny,nx])
            }
        }
        
        front += 1
    }
}

func clean() {
    
}

print(cleaner)
print(dust)
var isFirst = true
var ret = 0

while t > 0 {
    
    if isFirst {
        bfs(queue: dust)
    } else {
        dust = temp
        bfs(queue: dust)
    }
    
    t -= 1
}

for i in 0..<r {
    for j in 0..<c {
        ret += a[i][j]
    }
}

print(a)
print(ret + 2)

