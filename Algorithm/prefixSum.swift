//
//  prefixSum.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/01/19.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var pSum = [Int](repeating: arr[0], count: n)

func prefixSum() {
    for i in 1..<n {
        pSum[i] = pSum[i - 1] + arr[i]
    }

    let range = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let low = range[0] - 1
    print("LOW : \(low)")
    let high = range[1] - 1
    print("HIGH : \(high)")
    let result = pSum[high] - (low == 0 ? 0 : pSum[low - 1])
    print("RESULT : \(result)")
}
