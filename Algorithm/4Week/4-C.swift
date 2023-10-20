//
//  4-C.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/10/20.
//

import Foundation

// baekjoon 17471 게리맨더링
/**
 - Description
 첫 째줄은 노드의 갯수
 둘 째줄은 각 노드의 인구 수
 5 2 3 4 1 2

 셋 째줄 부터는 각 노드의 인접한 노드
 첫 번째 정수는 인접해있는 노드의 갯수

 두 개의 커넥티드 컴퍼넌트를 만들고
 두 개의 수가 가장 작은 것을 출력
 
 인덱스가 어려움 아직 적응을 해야할듯
 다시 개념 수업을 듣던
 */

var n = Int(readLine()!)!
var a = Array(repeating: 0, count: 11)
var comp = Array(repeating: 0, count: 11)
var visited = Array(repeating: 0, count: 11)
var INF = 987654321
var temp: Int = 0
var adj: [[Int]] = Array(repeating: [], count: 11)
var ret = INF
var input = readLine()!.split(separator: " ").map { Int($0)! }

for i in 0..<input.count {
    a[i + 1] = input[i]
}

for i in 1...n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let m = input[0]
    
    /**
     6
     10 20 10 20 30 40
     0
     0
     0
     0
     0
     0
     이런 식으로 입력 값이 들어오면 인덱스 에러가 날 수 있음
     */
    if input.count > 1 {
        for j in 1...m {
            // 양방향 간선 만들어 준다.
            adj[i].append(input[j])
        }
    }
   
}

// 모두다 111111이 되면 안 되기 떄문에 -1 을 해준다.
// 비트마스킹을 통해 모든 경우의 수를 출력한다.
for i in 1..<(1 << n) - 1 {

    // 인덱스 초기화
    var idx1 = -1, idx2 = -1
    // 지역구 초기화
    comp = Array(repeating: 0, count: 11)
    // 방문 초기화
    visited = Array(repeating: 0, count: 11)
    for j in 0..<n {
        if i & ( 1 << j ) != 0 {
            // 1과 0으로 지역구를 나눈다고 생각한다.
            // 선택된 곳에 1로 바꿔(색칠) 준다.
            comp[j + 1] = 1
            // 여러 번 인덱스가 입력되지만
            // 결국 마지막 입력된 곳으로 탐색 시작
            idx1 = j + 1
        } else {
            // 여러 번 인덱스가 입력되지만
            // 결국 마지막 입력된 곳으로 탐색 시작
            idx2 = j + 1
        }
    }
    // 구역별로 탐색한다.
    let comp1: (Int, Int) = dfs(here: idx1, value: 1)
    let comp2: (Int, Int) = dfs(here: idx2, value: 0)


    // 정확히 두개의 커넥티드 컴퍼넌트로 나뉘었다면
    // 탐색한 구역의 총 갯수가 n과 같은 것이다.
    if comp1.0 + comp2.0 == n {
        // 컴포넌트가 완벽하게 둘로 나뉘었다면
        // 두 구역의 최소 인구 합을 구한다.
        ret = min(ret, abs(comp1.1 - comp2.1))
    }
}


/// dfs 탐색
/// - Parameters:
///   - here: 탐색할 곳의 인덱스
///   - value: 1이나 0이 입력된다 (여기서는 선거구를 1이나 0으로 정의했다)
/// - Returns: 첫 번째 인자에 탐색한 총 갯수, 두 번째 인자에 인구수의 합
func dfs(here: Int, value: Int) -> (Int, Int) {
    // 방문처리
    visited[here] = 1
    // ret (총갯수, 인구수)
    var ret: (Int, Int) = (1, a[here])
    // 인접한 곳
    for there in adj[here] {
        // 인접한 곳이 만약 다른 구역에 속해있다면
        if comp[there] != value {
            continue
        }
        // 이미 방문한 곳이라면
        if visited[there] != 0 {
            continue
        }
        var _temp: (Int, Int) = dfs(here: there, value: value)
        ret.0 += _temp.0
        ret.1 += _temp.1
    }
    return ret
}

print("\(ret == INF ? -1 : ret)")


