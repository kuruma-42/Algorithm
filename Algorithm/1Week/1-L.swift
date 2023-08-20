//
//  1-L.swift
//  Algorithm
//  BaekJoon 1940
//  Created by 차차 on 2023/03/01.
//

import Foundation


/**
 N개의 조합을 순서에 상관 없이 순열로 푼다.
 nC2가 특정 합인 경우를 카운트하면 되겠다.
 
 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 입력이 15000이 들어오는 것으로 봐서는 O(n^2)으로 풀면 시간 초과가 날 것 같다.
 고유한 번호라는 것으로 봐서는 중복되지 않으니 중복의 경우는 생각하지 않아도 될 것 같다.
 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 상기의 두 줄을 생각했기 때문에 문제에서 틀렸다.
 2초가 주어졌고 15000^2했을 때는 약 2억개를 조금 넘기 때문에
 O(n^2)으로 풀 수 있는 문제였다.
 nCr의 문제에서 r이 2-3인 경우는 그냥 중첩 for문으로 풀도록 하자.
 */

// Brute Force로 풀었는데 솔직히 그냥 운 좋게 풀린 것 같다.
// 논리상은 틀리지 않았으나 최적으 알고리즘이라고 생각할 수는 없다.
var input = Int(readLine()!)!
var input2 = Int(readLine()!)!
var materials = readLine()!.split(separator: " ").map { Int($0)! }
var variations = 0

for i in 0..<materials.count {
   let answer = input2 - materials[i]
    if materials.contains(answer) {
        variations += 1
    }
}
print("\(variations / 2)")

// 조합으로 풀었더니 시간 초과가 나왔다.
// Combination 함수가 틀린 것은 아닌지 검증해봤는데, 틀리지 않은 것으로 나왔다.
var input = Int(readLine()!)!
var input2 = Int(readLine()!)!
var materials = readLine()!.split(separator: " ").map { Int($0)! }
var variations: Int = 0

var arr: [Int] = []

func comb(arr: inout [Int], idx: Int) {
    //기저 조건
    if arr.count == 2 {
        if input2 == arr.reduce(0,+) {
            variations += 1
            return
        }
        return
    }

    for i in idx + 1..<materials.count {
        arr.append(materials[i])
        comb(arr: &arr, idx: i)
        arr.popLast()
    }
}
comb(arr: &arr, idx: -1)

print("\(variations)")


// 중첩 for문
var input = Int(readLine()!)!
var input2 = Int(readLine()!)!
var materials = readLine()!.split(separator: " ").map { Int($0)! }
var variations: Int = 0

for i in 0..<materials.count {
    for j in i+1..<materials.count {
        if materials[i] + materials[j] == input2 {
            variations += 1
        }
    }
}

print("\(variations)")

