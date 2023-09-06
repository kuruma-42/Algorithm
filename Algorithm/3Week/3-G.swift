//
//  3-G.swift
//  Algorithm
//  baekjoon 12851 숨바꼭질2
//  Created by Yong Jun Cha on 2023/09/06.
//

import Foundation

/**
 - Description
 >
 수빈이의 위치가 X일 때 걷는다면
 X - 1, X + 1로 걸어서 이동할 수 있고
 순간이동을 한다면 2X로 움질일 수 있다.
 최단거리를 구하라
 최단거리 => bfs
 이 문제는 bfs로 최단거리를 푸는 게 어려운 게 아니라
 반례를 찾는 게 어려운 문제이다.
 반례 n == k 가 같을 때와
 경우의 수를 풀면서 또다른 최단 거리를 찾는 경우의 예외를 찾아내야 한다.
 */

var input = readLine()!.split(separator: " ").map { Int($0)! }
var n = input[0]
var k = input[1]
var visited = Array(repeating: 0, count: 100004)
var cnt = Array(repeating: 0, count: 100004)


func bfs(x: Int) {
    cnt[x] = 1
    // 큐 생성
    var queue: [Int] = []
    // 큐에 넣고
    queue.append(x)
    // 방문 처리
    visited[x] = 1
    // 반복문
    while !queue.isEmpty {
        
        // 할당
        var loca = queue.first!
        // 팝
        queue.removeFirst()
        
//        print("loca:: \(loca)")
        // 기저 사례
        if loca == k {
            print("\(visited[k] - 1)")
            print("\(cnt[k])")
        }
        
        for i in [loca + 1, loca - 1, loca * 2] {
            var nx = i
            
            // 오버플로우 체크
            if nx < 0 || nx >= 100000 {
                continue
            }
            
            // 다른 최소거리를 찾았을 때
            if visited[nx] == visited[loca] + 1 {
                cnt[nx] += 1
            }
            
            // 방문 체크
            if visited[nx] != 0 {
                continue
            }
            
            // 방문 횟수 가중치
            visited[nx] = visited[loca] + 1
            
            // 경우의 수 추가
            cnt[nx] += cnt[loca]
            
            // Queue 추가
            queue.append(nx)
        }
        
    }
    
}

if n == k {
    print("0")
    print("0")
}

if n != k {
    bfs(x: n)
}
