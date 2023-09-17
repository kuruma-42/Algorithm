//
//  3-K.swift
//  Algorithm
//  baekjoon 3197 백조의 호수
//  Created by Yong Jun Cha on 2023/09/15.
//

import Foundation

/**
 - Description
 > dfs를 물이 있는 곳에서 써서 얼음이 있는 XX에 닿으면 탐색을 멈춤
 L 백조가 있는 위치를 dfs해서 L을 찾는지 못찾는지 반복해야함
 */

var input = readLine()!.split(separator: " ").map { Int($0)! }
var r = input[0]
var c = input[1]
var visited = Array(repeating: Array(repeating: false, count: c), count: r)
var visited_swan = Array(repeating: Array(repeating: false, count: c), count: r)

var a: [[String]] = []
var day: Int = 0

var swanY = 0
var swanX = 0

var y = 0
var x = 0

var dy = [1, 0, -1, 0]
var dx = [0, 1, 0, -1]

var waterQ: [(Int, Int)] = []
var water_tempQ: [(Int, Int)] = []
var swanQ: [(Int, Int)] = []
var swanQ_tempQ: [(Int, Int)] = []

// Queue를 직접 구현해서 Pop을 해봤는데 시간초과를 피할 수 없었다.
//var waterQ: Queue<(Int, Int)> = Queue()
//var water_tempQ: Queue<(Int, Int)> = Queue()
//var swanQ: Queue<(Int, Int)> = Queue()
//var swanQ_tempQ: Queue<(Int, Int)> = Queue()

func water_melting() {
    // 직접 삭제하지 말고 프론트라는 인덱스로 쓸 변수를 생성
    var front = 0
    // 프론트가 Q의 갯수 보다 같거나 많아 지면 while문을 멈추게 한다.
    while front < waterQ.count {
        // 프론트를 인덱스로 now에 할당해주고
        let now = waterQ[front]
        // 인덱스를 하나 올려준다.
        front += 1
        // 이렇게 하면 직접 삭제를 안 해도 된다.
        for i in 0..<4 {
            let ny = now.0 + dy[i]
            let nx = now.1 + dx[i]
            
            if ny < 0 || ny >= r || nx < 0 || nx >= c || visited[ny][nx] {
                continue
            }
            
            if a[ny][nx] == "X" {
                visited[ny][nx] = true
                // queue를 두 개로 나눠주면서 날을 나눌 수 있다
                water_tempQ.append((ny,nx))
                a[ny][nx] = "."
            }
        }
    }
}

func move_swan() -> Bool {
    // 똑같이 프론트 방식으로 구현해준다.
    var front = 0
    while front < swanQ.count {
        let now = swanQ[front]
        front += 1
        for i in 0..<4 {
            let ny = now.0 + dy[i]
            let nx = now.1 + dx[i]
            if ny < 0 || ny >= r || nx < 0 || nx >= c || visited_swan[ny][nx] {
                continue
            }
            visited_swan[ny][nx] = true
            if a[ny][nx] == "." {
                swanQ.append((ny,nx))
                continue
            }
            
            if a[ny][nx] == "X" {
                swanQ_tempQ.append((ny,nx))
                continue
            }
            
            if a[ny][nx] == "L" {
                return true
            }
        }
    }
    return false
}

func Qclear(q: inout [(Int, Int)]) {
    var empty: [(Int, Int)] = []
    swap(&q, &empty)
}

for i in 0..<r {
    var info = Array(readLine()!).map { String($0) }
    a.append(info)
    for j in 0..<info.count {
        let c = info[j]
        
        if c == "L" {
            swanY = i
            swanX = j
        }
        
        // 백조가 떠있는 곳도 물이라는 것을 생각해야한다.
        if c == "." ||  c == "L" {
            waterQ.append((i,j))
            visited[i][j] = true
        }
    }
}

swanQ.append((swanY,swanX))
visited_swan[swanY][swanX] = true

while true {
    if move_swan() {
        break
    }
    water_melting()
    waterQ = water_tempQ
    swanQ = swanQ_tempQ
    
    Qclear(q: &water_tempQ)
    Qclear(q: &swanQ_tempQ)
    
    day += 1
}

print("\(day)")

struct Queue<T> {
    private var inbox: [T] = []
    private var outbox: [T] = []
    
    var isEmpty: Bool {
        inbox.isEmpty && outbox.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        inbox.append(element)
    }
    
    mutating func dequeue() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        
        return outbox.popLast()
    }
    
}
/**
 - Description
 >
 하기의 방식으로 하면
 dfs를 여러 번 반복하는 형태의 코드가 작성되는데,
 이렇게 되면 예제 테스트 케이스는 통과할 수 있으나,
 효율이 떨어져서 시간초과가 계속 난다.
 flood & fill을 쓸 생각을 해야한다.
 한겹 씩 녹이는 문제는 dfs로 푸는 문제가 많아서
 초기에 프로토타입으로 풀었다. 
 ```
 var input = readLine()!.split(separator: " ").map { Int($0)! }
 var r = input[0]
 var c = input[1]
 var visited = Array(repeating: Array(repeating: 0, count: c), count: r)
 var map: [[String]] = []
 var birdList: [(Int, Int)] = []
 var iceList: [(Int, Int)] = []
 var waterList: [(Int, Int)] = []
 var ok: Bool = false
 var turn: Int = 0
 var new: [(Int, Int)] = []

 var dy = [1, 0, -1, 0]
 var dx = [0, 1, 0, -1]

 for i in 0..<r {
     var info = Array(readLine()!).map { String($0) }
     map.append(info)
     
     for j in 0..<info.count {
         var c = info[j]
         
         switch c {
         case "X":  iceList.append((i,j))
         case "L": birdList.append((i,j))
         case ".": waterList.append((i,j))
         default: {}()
         }
         
     }
 }

 /// 얼음 녹인는 dfs
 /// - Parameters:
 ///   - y: 물의 y좌표
 ///   - x: 물의 x좌표
 func waterDfs(y: Int, x: Int) {
     
     visited[y][x] = 1
     
     if map[y][x] == "X" {
         map[y][x] = "."
         return
     }
     
     for i in 0..<4 {
         let ny = y + dy[i]
         let nx = x + dx[i]
         
         if ny < 0 || ny >= r || nx < 0 || nx >= c || visited[ny][nx] != 0 {
             continue
         }
         
         waterDfs(y: ny, x: nx)
     }
 }

 /// 백조가 서로를 찾는 dfs
 /// - Parameters:
 ///   - y: 백조의 y좌표
 ///   - x: 백조의 x좌표
 func birdDfs(y: Int, x: Int) {
     visited[y][x] = 0
     
     if map[y][x] == "X" {
         return
     }
     
     for i in 0..<4 {
         let ny = y + dy[i]
         let nx = x + dx[i]
         
         if ny < 0 || ny >= r || nx < 0 || nx >= c || visited[ny][nx] == 0 {
             continue
         }
         
         if map[ny][nx] == "L" {
             ok = true
             return
         }
         
         birdDfs(y: ny, x: nx)
     }
     
 }

 while ok == false {
     turn += 1
     
     visited = Array(repeating: Array(repeating: 0, count: c), count: r)
     
         for i in 0..<waterList.count {
             let sy = waterList[i].0
             let sx = waterList[i].1
             if visited[sy][sx] == 0 {
                 waterDfs(y: sy, x: sx)
             }
         }

         let sy = birdList[0].0
         let sx = birdList[0].1
         birdDfs(y: sy, x: sx)
 }

 print("\(turn)")


 
 ```
 */
