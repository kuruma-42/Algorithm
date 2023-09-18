//
//  bfs.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/05/24.
//

import Foundation

/**
 BFS (너비우선탐색)
 BFS는 그래프를 탐색하는 알고리즘이며 어떤 정점에서 시작해 다음 깊이의 정점으로
 이동하기 전 현재 깊이의 모든 정점을 탐색하며 방문한 정점은 다시 방문하지 않는 알고리즘
 같은 가중치를 가진 그래프에서 최단거리 알고리즘으로 쓰인다.
 
 수도코드

 먼저 시작지점인 u를 "방문처리"를 하고 "큐(queue)에 푸시"를 한다. 그리고 q.size() 만큼 while 반복문을 돌면서 큐 앞단의 있는 u를 다시 끄집어내서 그 u를 중심으로 인접한 노드들을 탐색을 합니다. 방문한 정점은 다시 방문하지 않고 방문처리를 하면서 큐(queue)에 푸시를 하며 방문처리를 합니다.
 
 ```sudo
 BFS(G, u)
    u.visited = true
    q.push(u)
    while(q.size())
    q.pop()
    for each v ∈ G.Adj[u]
        if v.visited == false
            v.visited = true
            q.push(v)
 ```
 
 ```최단거리
 BFS(G, u)
     u.visited = 1
     q.push(u);
     while(q.size())
         u = q.front()
         q.pop()
         for each v ∈ G.Adj[u]
             if v.visited == false
                 v.visited = u.visited + 1
                 q.push(v)
 ```
 
 */

var adj: [[Int]] = Array(repeating: [], count: 100)
var visitied = Array(repeating: 0, count: 100)
var nodeList = [10, 12, 14, 16, 18, 20, 22, 24]

func bfs(here: Int) {
    var q: [Int] = []
    // 방문 처리
    visitied[here] = 1
    // queueing
    q.append(here)
    // Queue Count가 0이 아닐 때 까지 계속
    while (q.count != 0) {
        // set first value
        var here: Int = q.first!
        // pop
        q.removeFirst()
        
        // Layer 탐색
        for there in adj[here] {
            
            // 방문한 적이 있으면 건너 뜀
            if(visitied[there] != 0) {
                continue
            }
            
            // 방문 처리, 최단 거리를 알기 위해 더해준다.
            visitied[there] = visitied[here] + 1
            
            //
            q.append(there)
        }
    }
}

adj[10].append(contentsOf: [12, 14, 16])
adj[12].append(contentsOf: [18, 20])
adj[20].append(contentsOf: [22, 24])

bfs(here: 10)

for i in nodeList {
    print("\(visitied[i])")
}

print("10번으로부터 24번 까지 최단거리는: \(visitied[24] - 1)")

// 실전 문제
var mapSize = readLine()!.split(separator: " ").map{Int($0)!}
var n = mapSize[1]
var m = mapSize[0]
print("맵 크기: \(mapSize)")

var startPoint = readLine()!.split(separator: " ").map{Int($0)!}
print("시작점: \(startPoint)")

var companyLocation = readLine()!.split(separator: " ").map{Int($0)!}

print("도착점: \(companyLocation)")

var map: [[Int]] = []
var visited = Array(repeating: Array(repeating: 0, count: m), count: n)
print("visited: \(visited)")

for _ in 0...4 {
    map.append(readLine()!.split(separator: " ").map{Int($0)!})
}
print("맵: \(map)")

// 4방향
var dy = [-1, 0, 1, 0]
var dx = [0, 1, 0, -1]

// queue set
var q: [[Int]] = []
// 시작점 방문 처리
visited[startPoint[1]][startPoint[0]] = 1

// y,x 좌표
q.append([startPoint[1], startPoint[0]])

// queue가 끝날 때 까지
while q.count != 0 {
    // set now location
    let y = q.first![0]
    let x = q.first![1]
    // pop
    q.removeFirst()
    for i in 0..<4 {
        // 상,하,좌,우 탐색
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        // 기본 제약 조건 + map에서 0이면 못감
        if ny < 0 || ny >= n || nx < 0 || nx >= m || map[ny][nx] == 0 {
            continue
        }
        
        // 방문했으면 건너 뜀
        if visited[ny][nx] != 0  {
            continue
        }
        
//        print("ny : \(ny), nx: \(nx)")
        
        // 최단거리 탐색 ( bfs 뎁스 )
        visited[ny][nx] = visited[y][x] + 1
        
        q.append([ny, nx])
    }
}

for i in 0..<n {
    for j in 0..<m {
        print("\(visited[i][j])")
    }
}

print("최단거리 :: \(visited[companyLocation[1]][ companyLocation[0]])")





