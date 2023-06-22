//
//  2-I.swift
//  Algorithm
//  baekjoon 2870
//  Created by Yong Jun Cha on 2023/06/22.
//

import Foundation

var n = Int(readLine()!)!
var numbers: [String] = []
var ret: String = ""

for _ in 0..<n {
    let input = Array(readLine()!)
    for i in 0..<input.count {
        let c = input[i]
        // 알파벳은 소문자 65 대문자 97
        if c.asciiValue ?? 0 < 65 {
            // 65 이하면 숫자
            // 스트링에 숫자를 더한다
            ret += "\(c)"
        } else if ret.count != 0 {
            // 65 이상이면 문자
            // 0을 지우는 함수를 실행
            go()
        }
    }
    if ret.count != 0 {
        // 숫자만 나왔어도 0을 지우는 함수를 실행
        go()
    }
}

func go() {
    while true {
        // ret가 값을 가지고 시작 하는 index가 0을 가지면 지운다.
        if ret.count != 0  && ret[ret.startIndex] == "0" {
            ret.remove(at: ret.startIndex)
        } else {
            // 0이 아니면 break
            break
        }
    }
    // 전부 0일 경우 다 지워지기 때문에 0을 붙힌다.
    if ret.count == 0 {
        ret = "0"
    }
    // 숫자 값을 배열에 넣어준다
    numbers.append(ret)
    
    // 리턴 값 초기화
    ret = ""
}

// 스트링 비교 함수를 주의해야 한다.
let sortedNumbers = numbers.sorted {
    // 자릿수가 같으면 둘이 크기 비교해서 리턴
    if $0.count == $1.count {
        return $0 < $1
    } else {
        // 우선 자릿수가 많으면 무조건 크기 때문에 그대로 리턴
        return $0.count < $1.count
    }
}

// 출력 형태에 대해서 꼭 신경써준다.
for number in sortedNumbers {
    print("\(number)")
}

/**
 - Description
 >
 100글자가 들어온다고 했지만
 Int형이 10글자인 것으로 생각한다면 String으로 풀어야 하는 문제라는 것을 직감해야한다.
 범위가 100글자면 LongLong 안 되겠구나 직감하고 시작해야한다.
 아스키 코드로 숫자 문자를 나누는 아이디어가 가장 중요하다.
 조금씩 아이디어를 이런 식으로 공부해서 쌓아가야겠다.
 */
