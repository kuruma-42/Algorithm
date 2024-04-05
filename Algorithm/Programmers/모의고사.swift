//
//  모의고사.swift
//  Algorithm
//  Programmers 모의고사 (완전탐색)
//  Created by Yong Jun Cha on 4/5/24.
//

/// answer의 갯수가 1만개 까지 된다고 했다.
/// O(n^2)이 되면 10억이 되기때문에 터질 것이다.
/// 선형탐색 한 번에 끝내야 하는 문제이고
/// 딕셔너리를 쓸지, 아니면 배열을 쓸지는 선택이다.

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    var number1 = [1, 2, 3, 4, 5]
    var number2 = [2, 1, 2, 3, 2, 4, 2, 5]
    var number3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    var scores: [Int] = Array(repeating: 0, count: 3)
    var ans: [Int] = []
    
    
    for i in 0..<answers.count {
        if answers[i] == number1[i % 5] {
            scores[0] += 1
        }
        
        if answers[i] == number2[i % 8] {
            scores[1] += 1
        }
        
        if answers[i] == number3[i % 10] {
            scores[2] += 1
        }
        
    }
    var temp = 0
    var maxValue = scores.max()!
    for i in 0..<scores.count {
        if scores[i] == maxValue {
            ans.append(i+1)
        }
    }
    
    return ans.sorted()
}
