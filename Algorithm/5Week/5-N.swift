//
//  5-N.swift
//  Algorithm
//  baekjoon 3190 뱀
//  Created by Yong Jun Cha on 2023/12/28.
//

import Foundation

/**
 Dummy라는 도스게임
 사과를 먹으면 뱀 길이가 늘어나는 도스 게임
 자신의 몸과 부딪히면 게임 오버
 
 - 게임이 시작할때 뱀은 맨위 맨좌측에 위치하고 뱀의 길이는 1 이다
 - 처음에 오른쪽을 향한다.
 - 먼저 뱀은 몸길이를 늘려 머리를 다음 칸에 위치시킨다.
 - 만약 벽이나 자기 자신의 몸과 부딪히면 게임이 끝난다.
 - 만약 이동한 칸에 사과가 있다면, 그 칸에 사과가 없어지고 꼬리는 움직이지 않는다.
 - 만약 이동한 칸에 사과가 없다면, 몸길이를 줄여서 꼬리가 위치한 칸을 비워준다.
 - 즉, 몸길이는 변하지 않는다.
 
 Review
 - 복잡 구현과 탐색이 섞인 문제
 - 탐색 자체는 어렵지 않았으나 어려웠던 부분은
 - 뱀의 몸 길이를 유지시키는 (queue)로 해결하는 부분과
 - 방향 전환중 왼쪽으로 90도가 어려웠던 것 같다.
 */

let n = Int(readLine()!)!
let k = Int(readLine()!)!
var apples: [(Int,Int)] = []
var ac: Int = 0
var a = Array(repeating: Array(repeating: 0, count: n), count: n)
var visited = Array(repeating: Array(repeating: 0, count: n), count: n)
// 상하좌우로 셋팅하고 dy,dx 인덱스의 시작을 1로 한다.
let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]
var time = 0
var dir = 1
var idx = 0
var cnt = 0


for i in 0..<k {
    
    let c = readLine()!.split(separator: " ").map { Int($0)! }
    // -1을 해야하는 이유는 문제에서
    // 1행 1열을 시작으로 생각하고 값을 주기 때문이다.
    let cy = c[0] - 1
    let cx = c[1] - 1
    
    // 사과를 1로 표시
    a[cy][cx] = 1
    
}

let l = Int(readLine()!)!
var changable: [(Int, Int)] = []
for j in 0..<l {
    let t = readLine()!.split(separator: " ").map { $0 }
    let ty =  Int(t[0])!
    let tx =  String(t[1])
    
    if tx == "D" {
        // 오른쪽 한 칸 90도 이동
        changable.append((ty, 1))
    } else {
        // 3을 더하고 %4하면 왼쪽으로 90도 이동한 것과 같은 효과를 낼 수 있음
        changable.append((ty, 3))
    }
}

var q: [(Int, Int)] = []
q.append((0, 0))

while !q.isEmpty {
    time += 1
    let (y, x) = (q.first!.0, q.first!.1)
    
    // 오른쪽으로 이동
    let ny = y + dy[dir]
    let nx = x + dx[dir]
    
    // 벽에 부딪히면 게임 끝
    // 자신의 몸통에 부딪히면 게임 끝
    if ny < 0 || ny >= n || nx < 0 || nx >= n || visited[ny][nx] != 0 {
        break
    }
    
  
    // 사과가 없다면
    if  a[ny][nx] == 0 {
        // 꼬리 방문 초기화
        visited[q.last!.0][q.last!.1] = 0
        // 꼬리 이동
        q.removeLast()
    }
    // 사과가 있다면
    else {
        // 사과를 먹음
        a[ny][nx] = 0
    }
    
    // 머리 이동
    q.insert((ny, nx), at: 0)
    // 머리 도착
    visited[ny][nx] = 1
    if idx < changable.count {
        if time == changable[idx].0 {
            dir = (dir + changable[idx].1) % 4
            idx += 1
            cnt += 1
        }
    }
       
    
}

print(time)
