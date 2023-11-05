//
//  4-H.swift
//  Algorithm
//  baekjoon 2234 성곽
//  Created by Yong Jun Cha on 2023/11/05.
//

import Foundation

/**
 - Description
 이 성의 방의 개수
 n x m
 1 - 서, 2 - 북  4 - 동,  8  - 남
 비트마스킹으로 생각한다
 
 0001 - 서
 0010 - 북
 0100 - 동
 1000 - 남
 dfs 탐색을 할 떄 상하좌우 탐색을 할 경우 비트를 확인하고
 벽이 있는 곳은 탐색하지 않는다.
 그런데 컴포넌트는 어떻게 계산하지 ..?
 
 이 성에 있는 방의 개수 - 커넥티드 컴퍼넌트 갯수
 가장 넓은 방의 넓이 - 가장 큰 커넥티드 컴퍼넌트
 !! 벽을 실제로 없애지 않고 벽의 경계를 찾아 둘을 더하기만 하면 된다.
 
 비트마스킹을 사용해 벽이 있으면 안 가는 dfs는 구현하였으나
 세 번째 아이디어가 좀 부족했던 것 같다.
 물리적으로 벽을 없애기 어려울 때는 개념적으로 접근해보기
 */

var input = readLine()!.split(separator: " ").map { Int($0)! }
var n = input[0]
var m = input[1]
var a: [[Int]] = []
var cnt = 0
var ctr = 0
var ret2 = 0
var big = 0
// count m * n으로 했는데 런타임 에러가 나와서 최대 범위로 설정해주고 + 4 를 해줬다.
var compSize: [Int] = Array(repeating: 0, count: 50 * 50 + 4)


// 이렇게 짜야 서북동남
var dy = [0, -1, 0, 1]
var dx = [-1, 0, 1, 0]
var visited = Array(repeating: Array(repeating: 0, count: n), count: m)

for _ in 0..<m {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    a.append(info)
}

for i in 0..<m {
    for j in 0..<n {
        if visited[i][j] == 0 {
            ctr = 1
            cnt += 1
            compSize[cnt] = dfs(y: i, x: j)
            ret2 = max(ret2, ctr)
        }
    }
}

// 경계찾기 이 부분이 상당히 중요한 부분이다.
// 나는 실제로 벽을 찾아서 물리적으로 벽을 제거하려고 했는데
// 이렇게 하면 벽을 제거하지 않아도 벽을 제거한 것과 같은 효과를 얻는다.
for i in 0..<m {
    for j in 0..<n {
        // 오버플로우 체크
        if i + 1 < m {
            let a = visited[i][j]
            let b = visited[i + 1][j]
            
            // 경계 찾기
            if a != b {
                big = max(big, compSize[a] + compSize[b])
            }
        }
        
        // 오버플로우 체크
        if j + 1 < n {
            let a = visited[i][j]
            let b = visited[i][j + 1]
            
            // 경계 찾기
            if a != b {
                big = max(big, compSize[a] + compSize[b])
            }
        }
    }
}

func dfs(y: Int, x: Int) -> Int {
    
    if visited[y][x] != 0 {
        return 0
    }
    
    visited[y][x] = cnt
    
    var ret = 1
    
    for i in 0..<4 {
        // 벽체크
        if a[y][x] & ( 1 << i ) == 0 {
            
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if ny < 0 || ny >= m || nx < 0 || nx >= n {
                continue
            }
            
            if visited[ny][nx] != 0 {
                continue
            }
            
            ctr += 1
            // 탐색
            ret += dfs(y: ny, x: nx)
        }
        
    }
    
    return ret
}

print("\(cnt)")
print("\(ret2)")
print("\(big)")
