//
//  2-G.swift
//  Algorithm
//  baekjoon 2910
//  Created by Yong Jun Cha on 2023/06/17.
//

import Foundation

var info = readLine()!.split(separator: " ").map { Int($0)! }

// 숫자 n개로 이루어진 입력 값
var n = info[0]

// 숫자는 c 보다 작거나 같다
var c = info[1]
var arr = readLine()!.split(separator: " ").map { Int($0)! }
var orderDict: [Int: Int] = [:]
var numberDict: [Int: Int] = [:]

// 순서 딕셔너리 생성
for i in 0..<arr.count {
    if orderDict[arr[i]] == nil {
        orderDict[arr[i]] = i
    }
}

// 빈도 딕셔너리 생성
for i in 0..<arr.count {
    if numberDict[arr[i]] == nil {
        numberDict[arr[i]] = 1
    } else {
        numberDict[arr[i]] = (numberDict[arr[i]]!) + 1
    }
}

var sortedArr = arr.sorted {
    if numberDict[$0]! == numberDict[$1]! {
        return orderDict[$0]! < orderDict[$1]!
    } else {
        return numberDict[$0]! > numberDict[$1]!
    }
}

for i in sortedArr {
    print(i, terminator: " ")
}

/**
 - Description
 > 빈도 정렬 문제였다.
 처음에 잘못 생각한 것이
 우선 순서를 알아야하기 때문에
 Dictionary를 숫자가 등장한 순서로 잡는 것은 무리라고 생각했다.
 그래서 숫자가 등장한 순서를 저장하는 부분을 array로 쓰기 시작하면서 부터
 문제풀이가 꼬이기 시작한 것 같다.
 쉬운 문제라고 생각했지만, 생각을 잘못하고 생각에 고립되버리면 안 될 것 같다. 
 */
