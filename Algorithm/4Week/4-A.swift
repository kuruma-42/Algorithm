//
//  4-A.swift
//  Algorithm
//  baekjoon 19942 다이어트
//  Created by Yong Jun Cha on 2023/10/04.
//

import Foundation

/**
 - Description
 비트 마스킹을 사용하여 겅우의 수를 나타내고
 그 중 최소를 찾고 출력을 하면 된다.
 */

var n = Int(readLine()!)!
var minimums = readLine()!.split(separator: " ").map { Int($0)! }
let mp = minimums[0]
let mf = minimums[1]
let ms = minimums[2]
let mv = minimums[3]
var nutritions: [[Int]] = []
let INF = 987654321
var minimumCost = INF
var ans: [Int] = []


for _ in 0..<n {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    nutritions.append(info)
}

for i in 0..<(1 << n) {
    var ret: [Int] = []
    var p = 0
    var f = 0
    var s = 0
    var v = 0
    var cost = 0
    
    for j in 0..<n {
        if ((i & (1 << j)) != 0) {
            ret.append(j+1)
            p += nutritions[j][0]
            f += nutritions[j][1]
            s += nutritions[j][2]
            v += nutritions[j][3]
            cost += nutritions[j][4]
        }
    }
    
  
    if p >= mp && f >= mf && s >= ms && v >= mv {
        // 같은 비용일 때 처리를 해야함
        if minimumCost >= cost {
            if minimumCost != cost {
                minimumCost = cost
                ans = ret
            }
            
            
            else {
                // 사전 순으로 빠르다는 것은 더 작은 값이 아닐까
                // 반례는 예를들어 234랑 123444 가 있으면 12344가 와야함
                var ansValue = ""
                var retValue = ""
                ans.forEach { ansValue += "\($0)"}
                ret.forEach { retValue += "\($0)"}
                if ansValue > retValue {
                    ans = ret
                }
            }
        }

    }
}

if minimumCost == INF {
    print("-1")
} else {
    //첫 번째 줄에 최소 비용을 출력하고, 두 번째 줄에 조건을 만족하는 최소 비용 식재료의 번호를 공백으로 구분해 오름차순으로 한 줄에 출력한다. 같은 비용의 집합이 하나 이상이면 사전 순으로 가장 빠른 것을 출력한다.
    // 사전순? 스트링으로 크기 비교를 해주면 사전순으로 만들 수 있다.
    print("\(minimumCost)")
    var result: String = ""
    ans = ans.sorted(by: <)
    for i in ans {
        result += "\(i) "
    }
    print("\(result)")
}
