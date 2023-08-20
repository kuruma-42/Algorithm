//
//  2-M.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/07/27.
//

import Foundation

var input = Int(readLine()!)! - 1
var x = 666
while input != 0 {
    
    x += 1
    
    var temp = x
    while temp >= 666 {
        if temp % 1000 == 666 {
            input -= 1
            break
        }
        temp /= 10
    }
//    if String(x).contains("666") {
//        input -= 1
//    }
    
}
print("\(x)")

/**
 - Description: BruteForce로 풀 수 있다고 해서 현재 푸는중이다
 상기와 같이 String Contains로 했을 때 다른 언어들에서는 시간 초과가 나지 않는 것 같은데
 스위프트에서는 시간 초과가 나는 것 같다. ( C++, Python 에서는 시간 초과가 안 남)
 
 Int 를 스트링으로 변환하는 과정이이 시간을 많이 잡아먹는다고 해서,
 이 부분을 나머지 연산자로 만들어서 풀어야 할 것 같다.
 
 */
