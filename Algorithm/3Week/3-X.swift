//
//  3-X.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/09/16.
//

import Foundation

/**
- Description
 >
 1. 첫 시작은 "a"
 2. 3번 규칙을 0번 이상 실행
 3. 규칙
    -  x개 만큼의 비를 추가한다. Ex) aba, bbababb
    - 문자열의 맨 앞 또는 맨 뒤에 'a'를 붙인다 Ex) aba -> aaba abaa가 됨
 
 문자열 a의 길이는 1<= a <= 1,000,000
 n^2으로 풀면 안 되는 문제
 
 짝 짓기? Stack 으로 풀어야 할 확률이 높다
 
 - b는 여야만 한다
 - a는 홀수여도 짝수여도 상관 없다.
 - 마지막 두 개의 문자가 count가 2일 때 bb면 성립 x
 -
 */
// bbaa
// aabb
// bababa
// abab
// bbbabababbba

var lines = ["ab"]
var line = ""
var stk: [Character] = []
var ret: [String] = []


for i in 0..<lines.count {
    stk = []
    line = lines[i]
    
    for i in 0..<line.count {
        let idx = line.index(line.startIndex, offsetBy: i)
        let s = line[idx]
        
        stk.append(s)
    }

    while !stk.isEmpty {
        
        if stk.count == 2 {
            var a = stk[0]
            var b = stk[1]
            
            // ab bb ba
            
            // ab
            if a == "a" && b == "b" {
                break
            }
            
            // bb
            if a == "b" && b == "b" {
                break
            }
            // ba
            if a == "b" && b == "a" {
                break
            }
        }
        
        // b한 개만 입력 되었을 경우
        // b만 남았을 경우
        if stk.count == 1 && stk.first! == "b" {
                break
        }
        
        // 첫 번째 글자가 b일 경우
        if stk.first! == "b" {
            // 마지막 글자가 b면
            if stk.last! == "b" {
                // 앞뒤 동시 삭제
                stk.removeFirst()
                stk.removeLast()
            } else {
                // 마지막 글자가 a면
                // a 그냥 삭제
                stk.removeLast()
            }
        }
        // 첫 번째 글자가 a일 경우
        else {
            // a지우고
            stk.removeFirst()
        }
    }
    // 스택이 비어있다면 규칙에 맞는 것
    if stk.isEmpty {
        // 리턴에 어팬드
        ret.append("true")
    }

    // 스택이 비어있지 않다면 규칙에 어긋난 것
    if !stk.isEmpty {
        // 리턴에 어팬드
        ret.append("false")
    }
    
}

// ret 출력
print("\(ret)")
