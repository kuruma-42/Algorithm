//
//  2-F.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/06/15.
//

import Foundation

var information = readLine()!.split(separator: " ").map { Int($0)! }

// 스크린의 칸 수
var n = information[0]

// 차지하는 바구니의 크기
var m = information[1]

// 사과의 갯수
var j = Int(readLine()!)!

// 사과가 떨어지는 곳
var appleArray: [Int] = []

// 리턴 값
var ret = 0

// 왼쪽 정의
var l = 1

// 사과 위치 입력
for i in 0..<j {
    // 오른쪽 정의 ( 이 아이디어가 중요함 )
    var r = l + m - 1
    // 사과 떨어짐
    var input = Int(readLine()!)!
    
    // 바구니 범위 안에 들어올 경우
    if input >= l && input <= r {
        continue
    }
    
    // 바구니 범위보다 작을 경우
    if input < l {
        ret += l - input
        l = input
    }
    
    // 바구니가 범위보다 클 경우
    if input > r {
        ret += input - r
        l += input - r
    }
}

print("\(ret)")


/**
 - Description
 > 처음에는 단순히 최단거리를 구하라고 하길래 bfs로 맵을 만들어서 풀어야하나 생각했다.
 그러나 두 번째 예시부터 안 풀리기 시작했고, 원인은 왼쪽과 오른쪽을 설정하지 않아서였다.
 l,r를 설정하는 아이디어는 예전에 이진탐색에서 했었는데 막상 구현하려고 하니깐 생각도 안 나고 어려웠다.
 조금 더 신중할 필요가 있다.
 */
