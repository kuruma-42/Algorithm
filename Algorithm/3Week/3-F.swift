//
//  3-F.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/09/05.
//

import Foundation

// baekjoon 16637 괄호추가하기

/**
- Description
 > 시간 제한이 0.5초, 512MB
 9
 3+8*7-9*2
 상기의 입력에서 가장 큰 값을 뽑아내야한다.
 괄호의 위치에 따라 다양한 답이 나올 수 있다.
 연산자는 +, -, * 세 가지가 들어온다.
 
 최대 결과는 2^31 ~ -2^31 까지 얻을 수 있다
 문자의 총 갯수는 항상 홀수이며
 항상 정수로 시작하고 정수와 연산자가 번갈아가며 나온다.
 
 짝 맞추기 문제처럼 Stack으로 풀어야하는 것 같다
 괄호를 넣어서 연산을 해서 가장 큰 값을 구한다는 것이
 말이 괄호지 사실 어떤 기호가 나오면
 앞뒤로 연산을 먼저 해라 라는 뜻이 아닐까
 스트링에 직접 괄호를 넣는 것이 아니라
 중간중간 스택에 쌓아두다가 특정 값이 나오면 연산을 해서
 스택을 날려야 할 것 같다
 엄청 흔한 문제 유형이겠지만 내가 직접 푸는 것은 처음이다.
 
 !!
 누적합과 재귀로 풀어야한다.
 그리고 인덱스로 문제를 풀 생각 해야한다.
 완전탐색을 할 때는 인덱스로 풀 생각을 해야한다.
 */

var n = Int(readLine()!)!
var input = readLine()!.map { String($0) }
var s: [Int] = []
var c: [String] = []
// 최대값을 0으로 했을 경우
// -값이 크게 나왔을 경우에는 초기 값이 0으로 출력될 경우가 있으므로 조심한다
var ret: Int = -987654321


for i in 0..<n {
    // 숫자만 따로 뺸다.
    if i % 2 == 0 {
        s.append(Int(input[i])!)
    }
    
    if i % 2 == 1 {
        c.append(input[i])
    }
    
}

func oper(a: Int, b: Int, o: String) -> Int {
    if o == "+" {
        return a + b
    }
    
    if o == "-" {
        return a - b
    }
    
    if o == "*" {
        return a * b
    }
    
    return 0
}

func go(i: Int, t: Int) {

    // 끝까지 다 재귀로 돌았을 때
    if i == s.count - 1 {
        // 최대값을 출력한다.
        ret = max(ret, t)
        return
    }
    
    // 순서대로 더한 경우
    // 이렇게 해야 숫자가 짝수개 있는 경우가 처리가 됨
    // 그냥 순서대로 하는 것들을 재구로 호출을 해주고
    go(i: i+1, t: oper(a: t, b: s[i+1], o: c[i]))
    // 인덱스 + 2가 배열 보다 작은 경우
    if i + 2 <= s.count - 1 {
        // 뒤에것 먼저 계산
        let temp = oper(a: s[i+1], b: s[i+2], o: c[i+1])
        // 그 후 앞에 것을 계산한 값을 보낸다.
        // 인덱스는 +2를 해준다.
        // 뒤 부터 더하는 경우도 따로 호출을 해준다.
        go(i: i+2, t: oper(a: t, b: temp, o: c[i]))
    }
    return
}

go(i: 0, t: s[0])

print("\(ret)")
