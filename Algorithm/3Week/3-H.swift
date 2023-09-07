//
//  3-H.swift
//  Algorithm
//  baekjoon 13913 숨바꼭질 4
//  Created by Yong Jun Cha on 2023/09/07.
//

import Foundation

/**
 - Description
 >
 수빈이의 점 0<=N<=1000000
 동생의 점 0<=K<=1000000
 걷는다면 X-1 X+1
 순간이동 한다면 X*2
 동생에게 까지 가는 최단 거리를 구하라
 
 첫째 줄에 수빈이가 동생을 찾는 가장 빠른 시간을 출력한다.
 둘째 줄에 어떻게 이동해야 하는지 공백으로 구분해 출력한다.
 -> 얘가 어려워 보이는데 cnt 대신 어떻게 왔는지 배열에 가지고 있다가 준다?
 앞의 수를 넣어줘 CNT 대신에 배열 어팬드 X
 -> 상기의 방법으로 이중배열을 생성하여 거쳐온 모든 경로의 좌표를 갖게되면
 메모리 효율이 떨어져 결과적으로 메모리 초과가 생긴다.
 path라는 직전 경로를 나타내는 좌표를 생성하여 역추적이 가능하게 만들어야한다.
 */

var input = readLine()!.split(separator: " ").map { Int($0)! }
var n = input[0]
var k = input[1]
var visited = Array(repeating: 0, count: 100004)
var path = Array(repeating: 0, count: 100004)

func bfs(y: Int) {
    // 큐 생성
    var q: [Int] = []
    
    // 시작점의 직전 좌표 값은 시작점 자신이다
    path[y] = y
    
    // 초기값 세팅
    q.append(y)
    
    // 방문 처리
    visited[y] = 1
    
    while !q.isEmpty {
        
        // 값 할당
        let now = q.first!
        // 팝
        q.removeFirst()
        // 지현이의 값이
        if now == k {
            print("\(visited[now] - 1)")
            break
        }
        
        for ny in [now + 1, now - 1, now * 2] {
            // 오버플로우 체크
            if ny < 0 || ny > 100000 {
                continue
            }
            
            // 방문 체크
            if visited[ny] != 0 {
                continue
            }
            
            // 방문 가중치
            visited[ny] = visited[now] + 1
            
            // 직전 값 남기기
            path[ny] = now
            
            // 다음 좌표
            q.append(ny)
            
        }
        
    }
    
}

//
if n == k {
    print("0")
    print("\(n)")
}

if n != k {
    bfs(y: n)
    
    // 지나온 경로를 역추적하는 로직
    var queue: [Int] = []
    queue.append(k)
    while true {
        let y = queue.last!
        if y == path[y] {
            break
        }
        queue.append(path[y])
    }
    queue.reversed().forEach {
        print("\($0)", terminator: " ")
    }
}
