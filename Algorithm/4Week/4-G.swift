//
//  4-G.swift
//  Algorithm
//  baekjoon 1094 막대기
//  Created by Yong Jun Cha on 2023/11/03.
//

import Foundation

/**
 막대기의 길이는 64cm
 Xcm의 막대기를 원함
 1. 초기 64cm 막대기가 Xcm 보다 크면 반을 자른다.
    1. 가지고 있는 막대 중 길이가 짧은 것을 절반으로 자른다.
    2. 만약, 위에서 자른 막대의 절반 중 하나를 버리고 남아있는 막대의 길이의 합이 X보다 크거나 같다면 위에서 자른 막대중
    하나를 버린다.
 2. 이제 남아있는 것들을 풀로 붙인다.
 */

var x = Int(readLine()!)!
var a = 64
var p: [Int] = []
var bit = 0
var findFlag: Bool = false

// 처음에 64를 배열에 넣어준다.
p.append(a)
// a가 x보다 크면
if a > x {
    // 플래그를 만들어준다.
    while findFlag == false {
        // 제일 작은 수 팝
        var d = p.popLast()!
        // a를 반으로 나누고
        var t = d / 2
        
        // 반으로 나눈게 x보다 크면
        if t >= x {
            // 하나만 넣어준다. ( 즉 하나는 버렸다는 뜻 )
            p.append(t)
        } else {
            // 반으로 나눈게 x보다 작으면
            if t < x {
                // 자른 막대 두개 다 넣어 준다.
                p.append(t)
                p.append(t)
            }

        }
        // 비트마스킹으로 완전 탐색을 한다.
        for i in 0..<(1 << p.count) {
            // 임시 버퍼를 만들고
            var temp: [Int] = []
            // 비트 확인
            for j in 0..<p.count {
                if i & (1 << j) != 0 {
                    temp.append(p[j])
                }
            }
            // 막대기의 합
            var ss = 0
            // 막대기의 총 합 계산
            for k in 0..<temp.count {
                ss += temp[k]
            }
            
            // 만약 막대기의 크기랑 합이 같다면
            if ss == x {
                // 막대기의 갯수
                print("\(temp.count)")
                // 반복문 멈춰준다.
                findFlag = true
                // 브레이크
                break
            }
        }
    }
} else {
    // 막대기의 길이가 64로 같을 때
    print("1")
}






