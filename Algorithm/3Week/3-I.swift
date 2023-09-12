//
//  3-I.swift
//  Algorithm
//  baekjoon 17071 숨바꼭질 5
//  Created by Yong Jun Cha on 2023/09/12.
//

import Foundation

/**
 - Description
 > 플레티넘 문제여서 그런지 매우 어려웠다
 가장 생각하기 어려웠던 부분은 여태 풀었던 bfs 문제들은
 한 번 방문한 곳은 방문하지 않는다는 생각이 있었는데
 이 문제는 수빈이가 이동할 수 있는 범위가 x + 1, x - 1 로 두 가지 경우로서
 동생이 그 좌표를 지나간다는 것만 알아도 +1 -1을 하며 수빈이가 제자리에서
 기다릴 수 있고 또 만날 수 있다는 경우의 수를 생각해내는 것이 가장 어려웠다.
 시간 복잡도를 줄이기 위해 Queue를 만들었음에도 불구하고 현재 시간 초과가 나고있다.
 추후에 재도전 할 때 생각해봐야겠다.
 */

var input = readLine()!.split(separator: " ").map { Int($0)! }
var n = input[0]
var k = input[1]
var max = 500000
var visited = Array(repeating: Array(repeating: 0, count: max + 4), count: 2)
var turn = 1
var ok: Bool = false

func bfs(x: Int) {
    // queue 생성
    var q: Queue<Int> = Queue()
    // 첫 번째 방문은 홀수
    visited[0][x] = 1
    // Queing
    q.enqueue(x)

    while !q.isEmpty {
        // 몇 번 째 이동인지 동생의 위치에 더해주고
        k += turn
        
        // k가 500000을 넘어가면 break
        if k > max {
            break
        }
        
        // 홀수나 짝수가 같은 곳에 수빈이가 있다면
        // +1 -1 반복 이동으로 그 자리에 있을 수 있기 때문에
        // break를 해준다 ( 수빈이 먼저 도착후 반복 이동의 경우 )
        if visited[turn % 2][k] != 0 {
            // ok가 true면 밖의 반복문도 break 된다
            ok = true
            break
        }
        
        let qSize = q.size
        for _ in 0..<qSize {
            // x에 top 값 할당
            var x = q.dequeue()!
            // 수빈 탐색 시작
            for nx in [x-1, x+1, x*2] {
                // 오버플로우 체크 || 순서 짝홀 체크
                if nx < 0 || nx > max || visited[turn % 2][nx] != 0 {
                    continue
                }
                
                // 이건 탐색 도중 수빈과 동생이 만난 경우
                if nx == k {
                    ok = true
                    break
                }
                // 큐 저장
                q.enqueue(nx)
            }
            
            if ok {
                break
            }
            
        }
        if ok {
            break
        }
        turn += 1
    }
}
// 언니와 동생의 위치가 같은 경우
if n == k {
    print("0")
}

if n != k {
    bfs(x: n)
    if ok {
        print("\(turn)")
    } else {
        print("-1")
    }
}


struct Queue<T> {
    private var inbox: [T] = []
    private var outbox: [T] = []
    
    var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
    }
    
    var size: Int {
        return inbox.count + outbox.count
    }
    
    mutating public func enqueue(_ element: T) {
        inbox.append(element)
    }
    
    mutating public func dequeue() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        
        return outbox.popLast()
    }
}
