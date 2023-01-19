//
//  Combination.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/01/05.
//

import Foundation

private let input = Int(readLine() ?? "")!

var n = 5
var k = 3
var a = [1,2,3,4,5]
var container: [Int] = []
var count = 0

public func combination(start: Int, b: inout [Int]) {
    if b.count == k {
        count += 1
        print("cnt :: \(count) result :: \(b)")
        return
    }
    
    for i in (start+1)..<n {
        b.append(i)
        combination(start: i, b: &b)
        b.popLast()
    }
}

/**
 # Review
 1. 구현에서 헷갈린 이유는 inout을 사용하여 참조값의 형태를 썼어야 했는데 그렇지 않았다.
 2. for문 쪽에서 초기값 부분을 커스텀 해 본 경험이 적어서 for문을 깔끔하게 쓰지 못했다.
 3. 조합 코드를 외우려고 노력해야겠다.
 */
