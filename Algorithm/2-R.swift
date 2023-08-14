//
//  2-R.swift
//  Algorithm
//  baekjoon 1068
//  Created by Yong Jun Cha on 2023/08/14.
//

import Foundation

/**
 
 5개의 노드가 주어지고
 각각의 노드들에는 부모의 숫자가 써있다
 세 번쨰는 지워야할 노드의 숫자가 적여있다.
 
 지우라는 노드를 지우고도 남은 리프 노드의 숫자를 구하라
 
 리프를
 
 */

var n = Int(readLine()!)!
var nodes = readLine()!.split(separator: " ").map { Int($0)! }
var adj:[[Int]] = Array(repeating: [], count: 56)
var d: Int = Int(readLine()!)!
var root = 0

for i in 0..<n {
    // Root를 찾아서 저장
    if nodes[i] == -1 {
        root = i
    }
    // 나머지 찾아서 저장
    // 구현력을 좀 더 키워야겠다.
    if nodes[i] != -1 {
        adj[nodes[i]].append(i)
    }
}

// 루트를 지우라고 한다면 0 출력
if d == root {
    print("0")
}

if d != root {
    // dfs
    let ret = dfs(here: root)
    print("\(ret)")
}

func dfs(here: Int) -> Int  {
    // leaf node 갯수
    var ret = 0
    var child = 0
    
    // 반복을 돌릴 엘리먼트가 없다면
    // 자식 노드는 0이 될 것이고 리프 노드라는 뜻이 된다.
    for there in adj[here] {
        // 만약 지우라고 한 노드면 탐색을 안 하면 된다.
        // 처음에는 실제로 배열에서 지우는 방식으로 구현하려고 했는데
        // 갑자기 참조되고 있는 배열의 엘리먼트를 지우면 index에러가 나기 때문에
        // 탐색을 안 하는 방향으로 구현하는 것이 맞다.
        if there == d {
            continue
        }
        
        ret += dfs(here: there)
        child += 1
        
    }
    
    if child == 0 {
        return 1
    }
    
    return ret
}
