//
//  map&DirectionVector.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/04/10.
//

import Foundation

/*
 map & direction vector
 보통 이 맵을 기준으로 4가지 방향으로 탐색하라고 한다.
 4가지 방향은 보통 위, 아래, 오른쪽, 왼쪽으로 주어진다.
 y,x가 주어졌을 때 상하좌우 4가지 방향으로 탐색은 어떻게 할까?
 **/

// direction_y, direction_x의 의미
// 시계 방향으로 상 우 하 좌 를 표현한 배열


// Q1.  {0, 0}좌표에서 dy, dx를 만들어 4방향(위, 오른쪽, 아래, 왼쪽)을 탐색하며 좌표를 출력하시오.
 
let dy1: [Int] = [-1, 0, 1, 0]
let dx1: [Int] = [0, 1, 0, -1]

let y1: Int = 0
let x1: Int = 0

for i in 0..<4 {
    var ny = y1 + dy1[i]
    var nx = x1 + dx1[i]
}

//Q2.  {0, 0}좌표에서 dy, dx를 만들어 8방향(위, 오른쪽, 아래, 왼쪽 및 대각선방향포함)을 탐색하며 좌표를 출력하시오.

let dy2: [Int] = [-1, -1, 0, 1, 1, 1, 0, -1]
let dx2: [Int] = [0, 1, 1, 1, 0, -1, -1, -1 ]

let y2: Int = 0
let x2: Int = 0

for i in 0..<8 {
    var ny = y2 + dy2[i]
    var nx = x2 + dx2[i]
}


// Q. 3 * 3 맵을 입력받아야 함. 이 맵은 1과 0으로 이루어져있고 {0, 0}은 무조건 1임을 보장한다. {0, 0}부터 4방향을 기준으로 한칸씩 탐색해나가며 방문한 정점은 다시 방문하지 않으며 방문하는 좌표를 출력하는 코드. 0은 갈 수 없는 지역. 1은 갈 수 있는 지역을 구현하시오.

var dy = [-1, 0, 1, 0]
var dx = [0, 1, 0, -1]

var map: [[Int]] = []
var range: Int = 3
var visited: [[Int]] = Array(repeating: Array(repeating: 0, count: 3), count: 3)


for i in 0..<range {
    var input = readLine()!.split(separator: " ").map { Int($0)! }
    print("\(input)")
    map.append(input)
}

go(x: 0, y: 0)

func go(x: Int, y: Int) {
    visited[x][y] = 1
    print("\(x) : \(y)")
    
    for i in 0..<4 {
        
        // 4방향 탐색
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        // 오버플로우 방지
        if nx < 0 || nx >= range || ny < 0 || ny >= range {
            continue
        }
        
        // 갈 수 없는 지역
        if map[ny][nx] == 0{
            continue
        }
        
        // 방문 여부 체크
        if visited[nx][ny] == 1 {
            continue
        }
        
        go(x: nx, y: ny)
        
    }
    
    return
}

