//
//  1-D.swift
//  Algorithm
//  BaekJoon 10988
//  Created by Yong Jun Cha on 2023/02/09.
//

import Foundation

let input = Array(readLine()!).map { String($0) }
var leftArray: [String] = []
var rightArray: [String] = []

let middleIndex: Int = input.count / 2

for i in 0..<middleIndex {
    leftArray.append(input[i])
}

if input.count % 2 == 0 {
    // 짝수
    for i in middleIndex..<input.count {
        rightArray.append(input[i])
    }
    rightArray.reverse()
} else {
    // 홀수
    for i in middleIndex+1..<input.count {
        rightArray.append(input[i])
    }
    rightArray.reverse()
}

if leftArray == rightArray {
    print("1")
} else {
    print("0")
}

/**
펠린드롬: 회문이라고 한다. 거꾸로 읽어도 똑바로 읽어도 같다
 - SeeAlso: 다른 풀이를 본 결과 나 처럼 leftArray rightArray를 나누지 않고
 입력 배열을 그대로 .reverse()함수를 쓴 후 같다 틀리다를 비교해서 엄청 간단하게 문제를 풀었다
 
 ```
 let input = Array(readLine()!).map { String($0) }
 let temp = input.reverse()
 
 if input == temp {
    print("1")
 } else {
    print("0")
 }
 ```
 상기의 코드와 같이 아주 간단하게 끝냈다.
 다른 사람의 풀이는 꼭 봐야하고, 반대로 펠린드롬이 나오면 reverse를 생각해봐야겠다.
 */
