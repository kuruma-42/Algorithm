//
//  adjacencyMatrix.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/04/09.
//

import Foundation

var adjcMatrix: [[Int]] = [
    [0,1,1,1],
    [1,0,1,0],
    [1,1,0,0],
    [1,0,0,0]
]

for i in 0..<adjcMatrix.count {
    for j in 0..<adjcMatrix[i].count {
        if adjcMatrix[i][j] == 1 {
            print("\(i)로 부터 \(j) 까지 경로가 있습니다")
        }
    }
}

/**
 Q. 3번 노드에서 5번 노드로 가는 단방향 경로가 있고 이를 인접행렬로 표현한다면?
    a[3][5] = 1
 Q. 3번 노드에서 5번 노드로 가는 양뱡향 경로가 있고 이를 인접행렬로 표현한다면?
    a[5][3] = 1
    a[3][5] = 1
 */


/**
 Q.1번 정점은 0번 부터 9번 까지 10개의 노드가 있다
 1-2/ 1-3/ 3-4/ 라는 경로가 있다 이를 인접 행렬로 표현하면?
 */

var a: [[Int]] = [
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,1,1,0,0,0,0,0,0],
    [0,1,0,0,0,0,0,0,0,0],
    [0,1,0,0,1,0,0,0,0,0],
    [0,0,0,1,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0]
]

/**
 Q.2번 0번 부터 방문 안 한 노드를 찾고 해당 노드를 이어서 방문해서 출력하는
 재귀함수를 만들고 싶다면 어떻게 해야할까? 또한 정점을 방문하고 다시 방문하지 않게 하려면
 어떻게 해야할까?
 */

var visited = Array(repeating: 0, count: 10)

func go(from: Int) {
    // 방문 처리
    visited[from] = 1
    // 경로 출력
    print("\(from)")
    
    for i in 0..<a.count {
        // 방문한 행이면 방문 안 함
        if visited[i] == 1{
            continue
        }
        
        // 경로가 있다면
        if a[from][i] == 1 {
            print("\(from) \(i)")
            // 연결된 노드를 이어서 방문
            // i가 from이 되기 때문
            go(from: i)
        }
    }
    return
}

// 행렬을 전부 탐색
for i in 0..<a.count {
    for j in 0..<a[i].count {
        // 경로가 존재하고, 방문하지 않았을 경우만
        if a[i][j] == 1 && visited[i] == 0 {
            go(from: i)
        }
    }
}

