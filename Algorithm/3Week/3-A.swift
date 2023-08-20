//
//  3-A.swift
//  Algorithm
//  baekjoon 15686 치킨 배달
//  Created by Yong Jun Cha on 2023/08/20.
//

import Foundation

/**
 - Description
 순열로 m개를 제외한 치킨 집들을 삭제시켜보고
 가장 치킨 거리가 작은 것을 고르면 된다.
 첫째 줄에 N(2 ≤ N ≤ 50)과 M(1 ≤ M ≤ 13)이 주어진다.
 2N개를 넘지 않으며, 적어도 1개는 존재한다.
 치킨집의 개수는 M보다 크거나 같고, 13보다 작거나 같다.
 M 갯수가 3이 넘어가서 반복문으로 풀면 안 된다.
 재귀로 순열을 구현해야할 것 같다.
 반드시 재귀로 순열을 구하는 방법을 외워놓을 것.
 */

var input = readLine()!.split(separator: " ").map { Int($0)! }
// map size n x n
var n = input[0]
// 남길 치킨 집
var m = input[1]
// 맵을 만들고
var map: [[Int]] = Array(repeating: [], count: n)
// 치킨 리스트
var chickenList: [[Int]] = []
// 집 리스트
var houseList: [[Int]] = []
// 치킨 최소 거리
var mn: Int = 134901414

var cnt: Int = 0

var pickChickenList: [[Int]] = []

for i in 0..<n {
    var info = readLine()!.split(separator: " ").map { Int($0)! }
    // map 완성 시켜주기
    map[i].append(contentsOf: info)
    
    for j in 0..<map[i].count {
        
        // 집 좌표 저장
        if map[i][j] == 1 {
            houseList.append([i,j])
        }
        
        // 치킨 좌표 저장
        if map[i][j] == 2 {
            chickenList.append([i,j])
        }
    }
}

func combination(start: Int, arr: inout[[Int]]) {
    if arr.count == m {
        // 여기서 구현 로직
        
        var ret = 0
        for i in 0..<houseList.count {
            let y1 = houseList[i][0]
            let x1 = houseList[i][1]
            
            var _min = 987654321
            
            for j in 0..<arr.count {
                let y2 = arr[j][0]
                let x2 = arr[j][1]
                let _dist = abs(y1 - y2) + abs(x1 - x2)
                _min = min(_min, _dist)
            }
            
            ret += _min
        }
        mn = min(mn, ret)
        
        return
    }
    
    for i in start+1..<chickenList.count {
        arr.append(chickenList[i])
        combination(start: i, arr: &arr)
        arr.popLast()
    }
}

combination(start: -1, arr: &pickChickenList)
print("\(mn)")
