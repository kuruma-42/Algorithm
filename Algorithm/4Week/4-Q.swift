//
//  4-Q.swift
//  Algorithm
//  baekjoon 3015 오아시스 재결합
//  Created by Yong Jun Cha on 2023/11/19.
//

import Foundation

/**
 - Description
 brute force로 하기엔 벌써 50만 * 50만이 나오는 상태여서
 시간제한이 1초인 상황에서 brute force를 생각할 수 없었다.
 
 n, n+1, n+2 오름 차순이라면 n-1쌍이 된다.
 n, n+1, n+2 내림 차순이라면 n-1쌍이 된다.
 3, 2, 1, 4 경우에는 그 이후 봉오리가 ㅇ
 */

var n = Int(readLine()!)!
var stk: [(Int,Int)] = []
var ret = 0, temp = 0
for i in 0..<n {
    let temp = Int(readLine()!)!
    var cnt = 1
    // 스택이 비어있지 않고, 스택의 탑이 temp(현재 들어온 수 보다 크다면)
    // 오름차순을 해결할 수 있음
    // <= 비교문자를 사용 같은 값도 포함해준다.
    while !stk.isEmpty && stk.last!.0 <= temp {
        // 결과에 + 1
        ret += stk.last!.1
        // 값이 같은 경우
        if stk.last!.0 == temp {
            // 같은 값 카운트를 올려준다.
            cnt = stk.last!.1 + 1
        } else {
            // 같지 않으면 cnt = 1
            cnt = 1
        }
        // 스택 팝
        stk.popLast()
    }
    
    // 위의 로직을 실행했을 때 만약 stk에 무엇인 가 남았다면
    // temp => 현재 들어온 수가 원래 스택 탑 보다 작은 경우이다.
    if !stk.isEmpty {
        // 이렇게 하면 내림 차순 코드도 해결할 수 있다.
        ret += 1
    }
    
    stk.append((temp, cnt))
}

print("\(ret)")
