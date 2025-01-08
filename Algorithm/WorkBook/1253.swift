//
//  1253.swift
//  Algorithm
//  baekjoon 1253 좋다 (two pointer)
//  Created by Yong Jun Cha on 1/8/25.
//

import Foundation

let n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").map { Int($0)! }
var ret = 0

a.sort()

for selectedIndex in 0..<a.count {
    var startIndex = 0
    var endIndex = a.count - 1
    while startIndex < endIndex {
        if a[startIndex] + a[endIndex] == a[selectedIndex] {
            if startIndex == selectedIndex {
                startIndex += 1
            } else if endIndex == selectedIndex {
                endIndex -= 1
            } else {
                ret += 1
                break
            }
        } else if a[startIndex] + a[endIndex] > a[selectedIndex] {
            endIndex -= 1
        } else {
            startIndex += 1
        }
    }
}

print(ret)
