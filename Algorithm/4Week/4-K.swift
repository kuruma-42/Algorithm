//
//  4-K.swift
//  Algorithm
//  baekjoon 13244 Tree
//  Created by Yong Jun Cha on 2023/11/09.
//

import Foundation

/**
 - Description
 
 트리의 조건
 1. 모든 노드는 연결되어 있고 모든 다른 노드를 따라가면 모든 엣지를 갈 수 있다.
 2. 만약 엣지가 삭제되면, 그래프는 더이상 연결되지 않는다. 어떤 노드들은 아예 갈 수 없을 수 있다.
 3. 존재하는 노드 사이에 엣지가 추가되면 싸이클이 생기고, A랑 B사이에 가는 길이 하나 이상이면 싸이클이 생긴다.
 
 T는 몇개의 그래프를 체크하는지 10개 이하
 N은 노드의 갯수 1 - 1000개
 M은 그래프의 간선의 갯수 10^6 개
 
 G is connected
 G doesn’t contain a cycle
 G has n-1 edges.
 
 모두 다 연결되어있는지 체크 노드 1에서 탐색을 돌렸을 때 dfs 모두 다 찍히면 모두 연결되어있는 것
 어려운 문제라기 보다는 트리의 개념을 이해하고 있냐가 중요한 문제이다.
 */

var t = Int(readLine()!)!
var a: [[Int]] = Array(repeating: [], count: 1004)
var visited: [Int] = Array(repeating: 0, count: 1004)


for _ in 0..<t {
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    var cnt = 0
    
    visited = Array(repeating: 0, count: 1004)
    a = Array(repeating: [], count: 1004)
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let node = input[0]
        let to = input[1]
        a[node].append(to)
        a[to].append(node)
    }
    
    for i in 1...n {
        if visited[i] == 0 {
            dfs(i)
            cnt += 1
        }
    }
    
    if n - 1 == m && cnt == 1 {
        print("tree")
    } else {
        print("graph")
    }
}

func dfs(_ node: Int) {
    visited[node] = 1
    
    for i in a[node] {
        if visited[i] == 0 {
            dfs(i)
        }
    }
    
}


