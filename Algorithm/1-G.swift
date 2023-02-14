//
//  1-G.swift
//  Algorithm
//  BaekJoon 9996
//  Created by Yong Jun Cha on 2023/02/14.
//

import Foundation

var total = Int(readLine()!)!
var pattern = readLine()!
var patternStart = pattern.split(separator: "*")[0]
var patternEnd = pattern.split(separator: "*")[1]
var inputArray: [String] = []

for _ in 0..<total {
    let input =  readLine()!
    inputArray.append(input)
}

for i in 0..<inputArray.count {
    let str = inputArray[i]
    if str.hasPrefix(patternStart) && str.hasSuffix(patternEnd) && str.count >= (patternStart.count + patternEnd.count) {
        print("DA")
    } else {
        print("NE")
    }
}


/**
 hasPrefix와 hasSuffix인 스트링 메소드가 기억이 안 나서
 ```swift
     let frontStartIndex = str.startIndex
     let frontEndIndex = str.index(frontStartIndex, offsetBy: patternStart.count)
 
     let frontString = str[frontStartIndex..<frontEndIndex]
 
     let backEndIndex = str.endIndex
     let backStartIndex = str.index(backEndIndex, offsetBy: -patternEnd.count)
     let backString = str[backStartIndex..<backEndIndex]
 
     if String(frontString) == patternStart && String(backString) == patternEnd {
         print("DA")
     } else {
         print("NE")
     }
 ```
 상기 처럼 시작과 끝의 String범위를 구하려고 코드를 짜다보니
 testcase에서 계속 걸려서 통과하지 못했고
 test케이스로 패턴보다 작은 String을 줬으 때의 예외를 처리하지 못해서 테스트 케이스를 잡지 못했다.
 
 hasPrefix는 접두사로 해당하는 String이 들어있을 때 true를 반환하고
 hasSuffix는 접미사로 해당하는 String이 들어있을 때 true를 반환한다.
 */


