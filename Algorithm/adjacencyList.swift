//
//  asdfasdf.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/04/10.
//

import Foundation

// adjacency Dict
var adjcDict: [Int:[Int]] = [
    0: [1,2,3],
    1: [0,2],
    2: [0,1],
    3: [0],
]

var adjcList: [[Int]] = Array(repeating: [], count: 4)

adjcList[0].append(contentsOf: [1,2,3])

adjcList[1].append(contentsOf: [0,2])

adjcList[2].append(contentsOf: [0,1])

adjcList[3].append(contentsOf: [0])

print("\(adjcList)")

for i in 0..<adjcList.count {
    print("\(i) ::", terminator: " ")
    for j in 0..<adjcList[i].count {
        print("\(j)", terminator: " ")
    }
    print("\n")
}

/**
Q. 1번. 정점은 0번 부터 9번까지 10개의 노드가 있다. 1 - 2 /  1 - 3 / 3 - 4 라는 경로가 있다. (1번과 2번, 1번과 3번, 3번과 4번은 연결되어있다.)
이를 인접리스트로 표현한다면?

 ​

Q.2번. 0번부터 방문안한 노드를 찾고 해당 노드부터 방문, 연결된 노드를 이어서 방문해서 출력하는 재귀함수를 만들고 싶다면 어떻게 해야할까? 또한, 정점을 방문하고 다시 방문하지 않게 만드려면 어떻게 해야할까?
 */

var a: [[Int]] = Array(repeating: [], count: 10)
a[1].append(contentsOf: [2,3])
a[2].append(1)
a[3].append(contentsOf: [1,4])
a[4].append(3)

var visited: [Int] = Array(repeating: 0, count: 10)
print("\(a)")

func go(from: Int) {
    
    print("\(from)")
    // 방문 표시
    visited[from] = 1
    
    
    // element를 반복
    for there in a[from] {
        // i가 방문한 노드라면 패스
        if visited[there] == 1 {
            continue
        }
        
        go(from: there)
    }
    
    return
}

for i in 0..<a.count {
    if !a[i].isEmpty && visited[i] == 0 {
        go(from: i)
    }
}
