//
//  3-O.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/09/22.
//

import Foundation

// baekjoon 15684 사다리조작

/**
 - Description
 > 세로선의 개수 N, 가로선의 개수 M, 가로선을 놓을 수 있는 위치의 개수 M
 가로선 정보 a와 b로 나타낸다.
 a번 점선의 b번 세로줄 과 b+1을 연결한다.
 i번 세로줄의 결과가 i번이 나오도록 결과를 조작하라.
 
 300C3의 시간 복잡도는 약 4,500,000 정도의 시간 복잡도를 갖는다.
 완탐이 아니라 백트레킹으로 만들어야 한다.
 cnt >= 3
 
 사다리 태우는 것을 구현하는 아이디어가 떠오르지 않았다.
 그리고 실제로 점을 찍으려고 했던 것 같다.
 */

let inf = 987654321

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
let h = input[2]

var ret = inf
var visited = Array(repeating: Array(repeating: 0, count: 34), count: 34)


for _ in 0..<m {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    visited[info[0]][info[1]] = 1
}

func check() -> Bool {
    for i in 1..<n {
        // 세로선 결정하기
        var start: Int = i
        // 가로선 위치 가로선쪽 하나씩 밑으로
        for j in 1..<h {
            // 만약에 visited가 1이면 오른 쪽으로 이동한다.
            if visited[j][start] == 1  {
                start += 1
            }
            // 왼쪽에 visited가 1이면 왼쪽으로 이동한다.
            else if visited[j][start - 1] == 1 {
                start -= 1
            }
        }
        // start한 곳과 i가 같지 않다면 False
        if start != i {
            return false
        }
    }
    // 같다면 true 리턴
    return true
}

func go(here: Int, cnt: Int) {
    // 기저 사례
    // 세 개를 넘겨서 선택했을 때
    if cnt > 3 || cnt >= ret {
        return
    }
    
    // i에서 시작해서 i로 끝나는 것을 찾았다면
    if check() {
        ret = min(ret, cnt)
        return
    }
    
    for i in here..<h {
        for j in 1..<n {
            // 사다리가 있거나
            // 왼쪽에 사다리가 있거나
            // 오른쪽에 사다리가 있으면
            // continue
            if visited[i][j] == 1 ||
                visited[i][j - 1] == 1 ||
                visited[i][j + 1] == 1 {
                continue
            }
            visited[i][j] = 1
            go(here: i, cnt: cnt + 1)
            visited[i][j] = 0
        }
    }
}

go(here: 1, cnt: 0)
print("\(ret == inf ? -1 : ret )")

