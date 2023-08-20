//
//  2-Q.swift
//  Algorithm
//  baekjoon 2636 치즈
//  Created by Yong Jun Cha on 2023/08/05.
//

import Foundation

var input = readLine()!.split(separator: " ").map { (Int($0)!)}
var n = input[0]
var m = input[1]
var dy = [1, 0, -1, 0]
var dx = [0, 1, 0, -1]
var map: [[Int]] = []
var cnt = 0
var ret = 0
var visited = Array(repeating: Array(repeating: 0, count: m), count: n)
var meltingCheeze: [[Int]] = []

func dfs(y: Int, x: Int) {
    // 방문처리
    visited[y][x] = 1
    
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        if ny < 0 || ny >= n || nx < 0 || nx >= m {
            continue
        }
        
        if visited[ny][nx] == 1 {
            continue
        }
        
        if map[ny][nx] == 1 {
            meltingCheeze.append([ny, nx])
            continue
        }
        
        dfs(y: ny, x: nx)
    }
}

for _ in 0..<n {
    var input = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(input)
}


while true {
    
    // dfs를 통해 1의 위치를 찾아내고
    dfs(y: 0, x: 0)
    
    // 기저 사례 (녹일 치즈가 더이상 없으면 브레이크
    if meltingCheeze.count == 0 {
        break
    }
    
    // 치즈가 몇 번 째에 다 녹는지 체크
    ret += 1
    
    // 마지막 치즈 갯수 카운트
    var lastCheezeCount = 0
    for i in 0..<n {
        for j in 0..<m {
            // 맵에 1이 있을 경우
            if map[i][j] == 1 {
                // 치즈 갯수 카운트를 올려준다.
                lastCheezeCount += 1
            }
        }
    }
    // 반복 마다의 치즈 카운트를 넣는다.
    cnt = lastCheezeCount
    
    // 1의 위치를 반복문을 통해 0으로 바꿔준다. ( 치즈를 녹이는 과정 )
    for i in 0..<meltingCheeze.count {
        map[meltingCheeze[i][0]][meltingCheeze[i][1]] = 0
    }

    
    
    // 방문 초기화
    visited = Array(repeating: Array(repeating: 0, count: m), count: n)

    // 녹아야 하는 치즈 위치 초기화
    meltingCheeze.removeAll()

}

print("\(ret)")
print("\(cnt)")
