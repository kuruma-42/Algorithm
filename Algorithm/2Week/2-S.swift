//
//  2-S.swift
//  Algorithm
//  baekjoon 1325 효율적인 해킹
//  Created by Yong Jun Cha on 2023/08/15.
//

import Foundation

/**
 - Description
 dfs로 children 탐색 및 children이 많은 것 출력하면 될듯
 5초를 주고 n 의 범위 10000, m의 범위 100000으로 m은 초기 입력 때만 쓰는 범위이기 떄문에
 O(n^2) 까지도 5초면 아슬아슬하게 burte force로 풀 수 있지 않을까 생각함.
 다른 언어에서는 ex. C++ Python 등은 풀리는 문제이나 swift는 함수 호출 비용 + 모듈화 비용이 크다고
 문제 리뷰에 나와있어 다른 언어와 같은 로직으로 풀려도 안 풀리는 문제이다.
 혹자는 Queuing으로 해결한 사람이 있는데, 그건 좀 더 생각을 해봐야할 것 같다.
 그리고 이 문제를 Dictionary로 풀면 안 된다.
 */

var input = readLine()!.split(separator: " ").map { Int($0)! }

// 10000 개 까지 범위의 자연수가 들어옴
var n = input[0]
var nodes: [[Int]] = Array(repeating: [], count: 10000)
var visited: [Int] = Array(repeating: 0, count: 10000)
// 100,000 개 까지의 신뢰관계가 들어옴
// 100,000 반복이면 brute force가 가능할듯
var m = input[1]


for _ in 0..<m {
    /// 자식 : 부모
    /// 이걸 딕셔너리로 하면 키 값이 같을 경우 중복은 지워짐
    /// [Int: [Int]] 이런 관계로 해야하는데 이렇게 할 거면 그냥 배열 쓰는 게 나음
    //var trustRelations: [Int: Int] = [:]
    var trust = readLine()!.split(separator: " ").map { Int($0)! }
    nodes[trust[1]].append(trust[0])
}

func dfs(here: Int) -> Int {
    // 방문처리
    visited[here] = 1
    // 리프를 구하는 문제는 아님
    var children = 1
    // nodes의 children이 없으면
    for there in nodes[here] {
        // 방문을 안 한 곳이라면
        if visited[there] != 1 {
            // 자식 노드를 dfs로 리턴
            children += dfs(here: there)
            // 해당 배열에서의 자식 노드를 합함
        }
    }
    // 자식 노드 합 리턴
    return children
}

var ret = 0
var arr: [Int] = Array(repeating: 0, count: 10000)

for i in 0..<n {
    // 우선 최대 자식 노드 값을 구함
    visited = Array(repeating: 0, count: 10000)
    let childrenCount = dfs(here: i)
    ret = max(ret, childrenCount)
    arr[i] = childrenCount
}

for i in 0..<n {
    // 출력 터미네이터를 띄어쓰기로 바꾸고 출력해준다.
    if ret == arr[i] {
        print("\(i)", terminator: " ")
    }
}
