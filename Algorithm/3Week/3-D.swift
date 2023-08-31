//
//  3-D.swift
//  Algorithm
//  baekjoon 4179 불!
//  Created by Yong Jun Cha on 2023/08/31.
//

import Foundation


/**
 - Description
 bfs: 최단 거리를 원하는 문제
 특이점: 탐색하는 개체가 두 개이다 ( 지훈이와 불 ).
 지훈이는 1분에 한 칸씩
 불은 1분에 상하좌우 사방으로 불이 확산
 불은 여러 군데에서 붙을 수 있다.
 
 #: 벽
 .: 지나갈 수 있는 공간
 J: 지훈이의 미로에서의 초기위치 (지나갈 수 있는 공간)
 F: 불이 난 공간
 
 4 4
 ####
 #JF#
 #..#
 #..#
 
 지훈이가 불이 도달하기 전에 미로를 탈출 할 수 없는 경우 IMPOSSIBLE 을 출력한다.
 
 bfs를 두 번 써서 푸는 문제,
 시간 초과 때문에 queue를  직접 구현해줘야한다.
 removeFirst를 쓰면 queuing을 할 때 마다 O(n)의 시간 복잡도가 소모되기 때문에
 reversed로 배열을 돌려서 removeLast를 사용하여 O(n)으로 시간 복잡도를 만들어야한다.
 
 */



let INF: Int = 987654321
var a:[[String]] = []
var n = 0
var m = 0
var sy = 0
var sx = 0
let dy = [1, 0, -1, 0]
let dx = [0, 1, 0, -1]
var ret = 0
var y = 0
var x = 0

//func condition(a: Int, b: Int) -> Bool {
//    return
//}

//var q: [(Int, Int)] = []
var q: Queue<(Int, Int)> = Queue()
var input = readLine()!.split(separator: " ").map { Int($0)! }
n = input[0]
m = input[1]
var fire_check = Array(repeating: Array(repeating: INF, count: m), count: n)
var person_check = Array(repeating: Array(repeating: 0, count: m), count: n)

for i in 0..<n {
    let info = readLine()!.map { String($0) }
    a.append(info)
    for j in 0..<m {
        // Location of Jihoon
        // 지훈이 위치는 한 개이다.
        if a[i][j] == "J" {
            sy = i
            sx = j
        }
        // Fire Loaction
        // 불의 위치는 여러군데일 수 있다.
        if a[i][j] == "F" {
            q.enqueue((i,j))
            // 방문처리
            fire_check[i][j] = 1
        }
    }
}

while(!q.isEmpty){
    var loca = q.dequeue()
    y = loca.0
    x = loca.1
    for i in 0..<4 {
        let ny = y + dy[i];
        let nx = x + dx[i];
        
        if !(0 <= ny && ny < n && 0 <= nx && nx < m) || fire_check[ny][nx] != INF || a[ny][nx] == "#"  {
            continue
        }
        
        fire_check[ny][nx] = fire_check[y][x] + 1;
        q.enqueue((ny, nx));
    }
}

person_check[sy][sx] = 1
q.enqueue((sy,sx))
while !q.isEmpty {
    var loca = q.dequeue()
    let y = loca.0
    let x = loca.1
    if(x == m - 1 || y == n - 1 || x == 0 || y == 0){
        ret = person_check[y][x];
        break
    }
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
       
        if !(0 <= ny && ny < n && 0 <= nx && nx < m) || person_check[ny][nx] == 1 || a[ny][nx] == "#" || fire_check[ny][nx] <= person_check[y][x] + 1 {
            continue
        }
        
        person_check[ny][nx] = person_check[y][x] + 1
        q.enqueue((ny, nx))
    }
}

if(ret != 0) {
    print("\(ret)")
} else {
    print("IMPOSSIBLE ")
}

struct Queue<Element> {
    private var inbox: [Element] = []
    private var outbox: [Element] = []
    
    var isEmpty: Bool{
        return inbox.isEmpty && outbox.isEmpty
    }
    
    var count: Int{
        return inbox.count + outbox.count
    }
    
    var front: Element? {
        return outbox.last ?? inbox.first
    }
    
    init() { }
    
    init(_ array: [Element]) {
        self.init()
        self.inbox = array
    }
    
    mutating func enqueue(_ n: Element) {
        inbox.append(n)
    }
    
    mutating func dequeue() -> Element {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.removeLast()
    }
}
