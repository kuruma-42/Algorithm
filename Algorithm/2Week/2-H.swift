//
//  2-H.swift
//  Algorithm
//  baekjoon 4659
//  Created by Yong Jun Cha on 2023/06/19.
//

import Foundation

while true {
    let password = readLine()!
    if password == "end" {
        break
    }
    // 모음 플래그
    var isVowel = false
    // 자음 카운트
    var lCnt = 0
    // 모음 카운트
    var vCnt = 0
    // 사용 가능 암호 플래그
    var flag = false
    // 이전 문자
    var preWord = "-1"
    
    for i in 0..<password.count {
        
        let idx = String.Index(encodedOffset: i)
        
        let n = password[idx]
        
        // 모음인 경우
        if n == "a" || n == "e" || n == "i" || n == "o" || n == "u" {
            // 모음 플래그
            isVowel = true
            // 모음 연속 여부 체크
            // 모음 카운트가 올라감
            vCnt += 1
            // 자음 카운트는 0이 됨
            lCnt = 0
        } else {
            // 자음 연속 여부 체크
            // 자음 카운트가 올라감
            lCnt += 1
            // 모음 카운트가 0이 됨
            vCnt = 0
        }
        
        // 자음 모음이 세 번 반복된 경우
        if lCnt == 3 || vCnt == 3 {
            flag = true
        }
        
        // 두 번째 요소 부터 앞의 문자와 같거나 e와 o가 아니면
        // 쓸 수 없는 암호다
        if (i >= 1 && preWord == String(n)) && (n != "e" && n != "o") {
            flag = true
        }
        
        // 현재 글자를 할당
        preWord = String(n)
    }
    
    
    // 모음이 없을 경우
    if !isVowel {
        // 사용 불가 암호
        flag = true
    }
    
    if flag {
        print("<\(password)> is not acceptable.")
    } else {
        print("<\(password)> is acceptable.")
    }
    
}

/**
 - Description
 >
 모음(a,e,i,o,u) 하나를 반드시 포함하여야 한다.
 모음이 3개 혹은 자음이 3개 연속으로 오면 안 된다.
 같은 글자가 연속적으로 두번 오면 안되나, ee 와 oo는 허용한다.

 상기의 세 가지 조건을 풀면 되는 것인데
 아이디어가 썩 그렇게 잘 떠오르지 않아 고생했고
 출력 부분에서 마지막에 . 을 안 찍어서 제출을 여러 번 하게 되었다.
 문자열에 대한 문제는 이번에 처음 풀어보는데 String을 다루는 것을
 좀 더 외우고 공부해야겠다고 느꼈다.
 */
