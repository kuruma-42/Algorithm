//
//  5-B(Stack).swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/11/25.
//

import Foundation

// baekjoon 9935 문자열 폭발
/**
 - Description
 erase와 스택으로 풀면 된다.
 폭탄 문자의 마지막 문자와 같다면 n개만큼 꺼낸다.
 폭탄 문자가 맞다면 그대로 진행하면 된다.
 */

var a = Array(readLine()!).map { String($0) }
var b = Array(readLine()!).map { String($0) }
var stk: [String] = []

for i in 0..<a.count {
    
    stk.append(a[i])
    // 스택의 크기가 폭탄의 길이만큼 크거나 같고
    // 스택의 마지막 문자가 폭탄의 마지막 문자와 같을 때
    if stk.count >= b.count && a[i] == b.last {
        // 임시 스트링 배열을 선언
        var t: [String] = []
        
        for _ in 0..<b.count {
            // 폭탄의 문자 갯수만큼 꺼낸다.
            t.append(stk.removeLast())
        }
        // 스택은 순서가 반대로 나오기 때문에 뒤집어 줘야한다.
        t = t.reversed()
        
        // 같은 경우
        // 같지 않으면
        if b != t {
            // 다시 넣어준다.
            stk.append(contentsOf: t)
        }
    }
}


if stk.isEmpty {
    print("FRULA")
} else {
    var s = ""
    for i in 0..<stk.count {
        s += stk[i]
    }
    print(s)
}

// 46% 시간 초과 erase 풀이 잠시 보류
//
//var a = readLine()!
//var b = readLine()!
//
//var temp = a.count
//var isFirst = true
//
//while true {
//    if temp > a.count {
//        temp = a.count
//        a = a.replacingOccurrences(of: b, with: "")
//    } else if temp == a.count && !isFirst {
//        break
//    } else {
//        // 처음인 경우
//        a = a.replacingOccurrences(of: b, with: "")
//        isFirst = false
//    }
//}
//
//if a.count == 0 {
//    print("FRULA")
//} else {
//    print(a)
//}
