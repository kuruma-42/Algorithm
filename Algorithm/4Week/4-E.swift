//
//  4-E.swift
//  Algorithm
//  baekjoon 14890 경사로
//  Created by Yong Jun Cha on 2023/10/31.
//

import Foundation

/**
 - Description
 경사로 낮은 칸에 놓으며, L개의 연속된 칸에 놓는다.
 첫째 줄에 N (2 ≤ N ≤ 100)과 L (1 ≤ L ≤ N)이 주어진다.
 둘째 줄부터 N개의 줄에 지도가 주어진다.
 각 칸의 높이는 10보다 작거나 같은 자연수이다
 
 엄청 복잡하게 생각했는데
 생각보다 쉽게 생각하면 된다.
 경사로가 지어진 곳에 비트마스킹을 하거나 visited를 사용해서
 위치를 확인하려고 생각까지 하면서 너무 복잡하게 생각했는데
 일단 어렵더라도 최대한 심플하게 푸는 힘이 필요할 것 같다.
 */

var input = readLine()!.split(separator: " ").map { Int($0)! }
var n = input[0]
var l = input[1]
var a: [[Int]] = []
var b = Array(repeating: Array(repeating: 0, count: n), count: n)
var bit = 0
var ret = 0

for _ in 0..<n {
    var info = readLine()!.split(separator: " ").map { Int($0)! }
    a.append(info)
}


for i in 0..<n {
    for j in 0..<n {
        // 대칭 함수를 만들면
        // 가로 세로 탐색을 할 필요가 없이
        // 가로만 탐색하면 된다.
        b[i][j] = a[j][i]
    }
}

func solve(_ a: [[Int]]) {
    for i in 0..<n {
        var cnt = 1
        var j = 0
        while j < n - 1 {
            
            // 현재랑 다음 거랑 같으면 카운트를 올린다.
            if a[i][j] == a[i][j + 1] { cnt += 1 }
            // 현재 것 + 1과 다음 블럭이 같으면 경사가 높은 것이다.
            // 그리고 같은 높이의 갯수가 l을 초과한다면 괜 찮다.
            // cnt를 1로 초기화
            else if a[i][j] + 1 == a[i][j + 1] && cnt >= l { cnt = 1 }
            // 현재 것 -1과 다음 블럭이 같으면 경사가 낮은 것이다.
            // cnt = -l + 1 ** 보통 cnt1, cnt2로 나눠서 쓰지만 이렇게 하면
            // 변수 하나로 모든 처리가 가능하다.
            else if a[i][j] - 1 == a[i][j + 1] && cnt >= 0 { cnt = -l + 1 }
            // 상기의 세 개에 포함이 안 되면 그 길은 못 가는 길이다.
            // 예를 들면 2이상 차이 나는 경우가 여기에 해당한다.
            else { break }
            // 인덱스를 올려준다.
            j += 1
        }
        // j가 끝에 도달했고 cnt가 0이상이면
        if (j == n - 1 && cnt >= 0 ) {
            // 결과 값을 더해준다.
            ret += 1
        }
    }
}

solve(a)
solve(b)
print(ret)
