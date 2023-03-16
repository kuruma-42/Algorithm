//
//  1-A-2.swift
//  Algorithm
//  baekjoon 2309
//  Created by Yong Jun Cha on 2023/03/14.
//

/// 2309 2회차
/// 9C2의 조합 문제 1번 반복문으로 풀기
/// 재귀로 한 번 더 풀어서 올리겠다.
/// 9C2 라서 우선적으로 반복문을 두 번만 서도 되기 때문에 반복문으로 풀었다.

let totalGoblinNum = 9
var goblinArray: [Int] = []
var isbreak: Bool = false

for _ in 0..<totalGoblinNum {
    let input = Int(readLine()!)!
    goblinArray.append(input)
}

var exceptGoblinHeightSum = goblinArray.map { $0 }.reduce(0,+) - 100
for i in 0..<totalGoblinNum {
    if isbreak {
        break
    }
    for j in i+1..<totalGoblinNum {
        if goblinArray[i] + goblinArray[j] == exceptGoblinHeightSum {
            goblinArray.remove(at: i)
            goblinArray.remove(at: j - 1)
            goblinArray.sort(by: <)
            isbreak = true
            break
        }
    }
}

goblinArray.map {
    print("\($0)")
}


// 재귀를 이용한 풀이
let totalGoblinNum = 9
var goblinArray: [Int] = []

for _ in 0..<totalGoblinNum {
    let input = Int(readLine()!)!
    goblinArray.append(input)
}

var arrBuffer: [Int] = []
let diff = goblinArray.reduce(0,+) - 100
var firstGoblin: Int = 0
var secondGoblin: Int = 0

func combination(start: Int, arr: inout [Int]) {
    if arr.count == 2 {
        let arrSum = arr.map{ $0 }.reduce(0,+)
        if  arrSum == diff {
            firstGoblin = arr[0]
            secondGoblin = arr[1]
            return
        }
        return
    }
    
    for i in start+1..<goblinArray.count {
        arr.append(goblinArray[i - 1])
        combination(start: i, arr: &arr)
        arr.popLast()
    }
}

combination(start: 0, arr: &arrBuffer)

let goblinIndex1 = goblinArray.firstIndex(of: firstGoblin)
goblinArray.remove(at: goblinIndex1!)

let goblinIndex2 = goblinArray.firstIndex(of: secondGoblin)
goblinArray.remove(at: goblinIndex2!)

let sortedGoblinArray = goblinArray.sorted(by: <)
sortedGoblinArray.forEach {
    print("\($0)")
}
