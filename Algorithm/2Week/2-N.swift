//
//  2-N.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/07/29.
//

import Foundation

// baekjoon 9012
/**
 - Description
 '(' 이 문자를 +1로 보고
 ')' 이 문자를 -1로 본다
 총 합이 0이 되면 YES를 출력
 총 합이 0이 안 되면 NO를 출력한다.
 * 문자열을 파악후 연산하는 과정에서 -1 가 나오게 되면 VPS가 성립이 안 된다.
 
 주어진 문자의 길이가 만약 홀수면 NO를 출력하면 된다.
 짝수면 문자열을 완전 탐색하며 검사한다.
 첫 번째는 ')' 오면 안 되고 마지막은 '(' 오면 안 된다.
 */

var n = Int(readLine()!)!

for _ in 0..<n {
    let s = readLine()!
    
    // 홀수일 경우
    if s.count % 2 != 0 {
        print("NO")
        continue
    }
    
    // 시작하는 문자가 ')' 일 경우
    if s[s.startIndex] == ")" {
        print("NO")
        continue
    }
    
    // 끝나느 문자가 '(' 일 경우
    var idx = s.index(s.startIndex, offsetBy: s.count - 1)
    if s[idx] == "(" {
        print("NO")
        continue
    }
    
    var total = 0
    for i in 0..<s.count {
        var idx = s.index(s.startIndex, offsetBy: i)
        // ( 면 +1
        if s[idx] == "(" {
            total += 1
        }
        
        // ) 면 -1
        if s[idx] == ")" {
            total -= 1
        }
        
        // 중간에 음수가 되버릴 때
        if total < 0 {
            // 그냥 브레이크만 해도 음수인 상태에서 브레이크 되기 때문에
            // NO가 출력된다.
            break
        }
    }
    
    // 0이 되면 VPS
    if total == 0 {
        print("YES")
    }
    
    // 0이 아니면 VPS
    if total != 0 {
        print("NO")
    }
}

