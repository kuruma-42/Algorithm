//
//  2-T.swift
//  Algorithm
// baekjoon 17298 오큰수
//  Created by Yong Jun Cha on 2023/08/16.
//

import Foundation

/**
 
 4
 3 5 2 7
 
 첫 째줄에 N의 갯수가 주어진다.
 첫 째 요소 부터 오른쪽에 자기보다 큰 수가 있으면 출력한다.
 큰 수가 없다면 -1 출력
 O(n^2) 가 복잡도가 나오면 안 됨
 
 * stack에 인덱스를 저장하는 아이디어가 안 떠올랐다.
 짝맞추기 문제는 스택으로 풀라고 하지만, 짝맞추기 문제인지 알아채기 어렵다
 */

var n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }
var ret = Array(repeating: -1, count: n)
var s: [Int] = []

for i in 0..<n {
    
    // 스택이 비어있지 않고 스택의 마지막 인덱스의 어레이 값이 다음 값보다 작을 때 까지
    while !s.isEmpty && arr[s.last!] < arr[i] {
        // ret 스택의 마지막 인덱스가 ret의 인덱스가 되면서 arr값을 저장한다.
        ret[s.last!] = arr[i]
        // 저장 후 스택 팝
        s.popLast()
    }
    // stack에 인덱스를 저장한다.
    s.append(i)
}

for i in 0..<n {
    print("\(ret[i])", terminator: " ")
}
