//
//  2-J.swift
//  Algorithm
//  baekjoon 10709
//  Created by Yong Jun Cha on 2023/06/23.
//

import Foundation

var info = readLine()!.split(separator: " ").map { Int($0)! }
var h = info[0]
var w = info[1]
var isFirstCloud = false
var isCloud = false
var cloudCnt = 0

var map: [[String]] = []
var visited = Array(repeating: Array(repeating: 0, count: w), count: h)

for i in 0..<h {
    var input = readLine()!.map { String($0)}
    map.append(input)
}

for i in 0..<h {
    for j in 0..<w {
        // 구름이 있는 지역
        if map[i][j] == "c" {
            // 구름 플래그를 트루로 바꿔준다.
            isCloud = true
            // 구름 카운트를 초기화 시킨다.
            cloudCnt = 0
            // 구름이 이미 뜬 지역을 0으로 초기화 시킨다.
            visited[i][j] = 0
        }
        
        // 구름이 없는 지역일 경우
        if map[i][j] == "." {
            // 구름이 뜬 적이 있으면
            if isCloud {
                // 구름 카운트 1을 더한다
                cloudCnt += 1
                // 구름 카운트에 1을 더한 만큼 있다가 구름 도착
                visited[i][j] = cloudCnt
            } else {
                // 구름이 뜬 적이 한 번도 없으면
                // 구름이 도착하지 않으므로 -1
                visited[i][j] = -1
            }
        }
    }
    // 다음 행으로 넘어갈 때
    // 클라우드 플래그 초기화
    isCloud = false
    // 구름 카운트 초기화
    cloudCnt = 0
}

for i in 0..<h {
    for j in 0..<w {
        print("\(visited[i][j])", terminator: " ")
    }
    print("")
}

/**
 - Description
 > 탐색 응용문제였다. 실버5 문제 정도로 크게 어려운 문제는 아니었다.
 나는 visited 쪽을 초기화를 0으로 해줬는데 문제 풀이 같은 것에서 참고해보니
 애초에 초기화를 -1로 했다면, 따로 해당 로직을 확인하지 않아도 되기 떄문에
 조금더 효율적으로 문제를 풀 수 있었다.
 그래도 오랜만에 한 번의 제출로 푼 문제여서 기분은 좋았다.
 */
