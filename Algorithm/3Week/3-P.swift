//
//  3-P.swift
//  Algorithm
//  baekjoon 14620 꽃길
//  Created by Yong Jun Cha on 2023/09/25.
//

import Foundation

/**
 - Description
 >
 6
 1 0 2 3 3 4
 1 1 1 1 1 1
 0 0 1 1 1 1
 3 9 9 0 1 99
 9 11 3 1 0 3
 12 3 0 0 0 1
 
 조합으로 점 세 개 골라서
 4방 탐색한 후 겹치면 꽃이 죽은 것 break
 범위 바깥으로 나가도 break
 15개를 못 빌려도 break
 bfs로 꽃을 한 번씩 피워주면 된다.
 */

let n = Int(readLine()!)!
var a: [[Int]] = []
var map: [(Int, Int)] = []
var dy = [1, 0, -1, 0]
var dx = [0, 1, 0, -1]
var visited = Array(repeating: Array(repeating: 0, count: n), count: n)
var ok: Bool = false
let inf = 987654321
var ret = inf

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    a.append(input)
    for j in 0..<n {
        map.append((i,j))
    }
}

for i in 0..<n*n {
   for j in i+1..<n*n {
       for k in j+1..<n*n {
           var seeds: [(Int, Int)] = []
           seeds.append(map[i])
           seeds.append(map[j])
           seeds.append(map[k])
           go(location: seeds)
           visited = Array(repeating: Array(repeating: 0, count: n), count: n)
        }
    }
}

// bfs
func go(location: [(Int, Int)]) {
    
    var q = location
    var front = 0
    var total = 0
    var cnt = 0
    while front < location.count {
        // 조건 초기화
        ok = true
        
        let (y,x) = q[front]
        // 인덱스 증가
        front += 1
        // 꽃을 심는 자리 방문 처리
        visited[y][x] = 1
        // 꽃 심는 자리 비용 추가
        total += a[y][x]
        // 대여횟수
        cnt += 1
        // 사방 탐색
        for i in 0..<4 {
            // 다음 좌표
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            // 오버플로우 체크
            if ny < 0 || ny >= n || nx < 0 || nx >= n {
                ok = false
                break
            }
            
            // 방문 확인
            // 방문이 겹치면 꽃잎이 겹치는 것이다.
            // break 한다.
            if visited[ny][nx] == 1 {
                // ny nx
                ok = false
                break
            }
            
            // 꽃잎 피는 곳 방문 처리 방문처리
            visited[ny][nx] = 1
            // 잎이 피는 자리 대여 금액
            total += a[ny][nx]
            // 대여 갯수 확인
            cnt += 1
        }
    }
    
    if ok && cnt == 15 {
        ret = min(ret, total)
    }
    
}

print("\(ret)")
