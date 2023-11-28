//
//  eratosthenes.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/11/28.
//

import Foundation

/// 쉬운 에라토스테네스 체
/// - Parameter number: 소수인지 판단할 숫자
/// - Returns: 소수 여부
func eratosthenesV1(_ number: Int) -> Bool {
    if number == 1 { return false }
    
    for i in 2..<number {
        if number % i == 0 { return false }
    }
    
    return true
}

func eratosthenesV2(n: Int) -> Bool {
    if n == 1 { return false }
    if n == 2 { return false }
    
    let end = Int(sqrt(Double(n)))
    for i in 2..end {
        if n % i == 0 { return false }
    }
    return true
}

func eratosthenesV3(_ num: Int, _ numArray: inout [Int]) -> [Int] {
    
    for i in 2...num {
        numArray[i] = i
    }

    for i in 2...num {
        if numArray[i] == 0 {
            continue
        }
        
        for j in stride(from: i+i, through: num, by: i) {
            numArray[j] = 0;
        }
    }
    
    numArray = numArray.filter { $0 == 0 }
    
    return numArray

}
