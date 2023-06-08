//
//  2-E.swift
//  Algorithm
//  baekjoon 1992
//  Created by Yong Jun Cha on 2023/06/08.
//

import Foundation

// (Quad Tree)
// 우선 4로 분할 하는 것이 재귀로 들어가야 함.

var n = Int(readLine()!)!
var a: [[Int]] = []

for _ in 0..<n {
    var input = readLine()!.map { Int(String($0))! }
    a.append(input)
}


func quard(y: Int, x: Int, size: Int) -> String {
    let b: String = String(a[y][x])
    // 기저사례
    if size == 1 {
        return String(a[y][x])
    }
    var ret = ""
    for i in y..<y + size {
        for j in x..<x + size {
            // 0 또는 1이 섞여 있다면
            if (b != String(a[i][j]) ) {
                ret += "("
                ret += quard(y: y, x: x, size: size / 2)
                ret += quard(y: y, x: x + size / 2, size: size / 2)
                ret += quard(y: y + size / 2, x: x, size: size / 2)
                ret += quard(y: y + size / 2, x: x + size / 2, size: size / 2 )
                ret += ")"
                return ret
            }
        }
    }
    // 그대로면 b를
    return b
}

print("\(quard(y: 0, x: 0, size: n))")

/**
 - Description
 백준 정답률을 보면 67%로 높은 정답률을 보여주고 있다.
 재귀 부분의 코드를 만드는 것이 어려웠고 구현을 못했다
 
 ```
 // 앞의 것과 다르면 로직 실행
 if (b != String(a[i][j]) ) {
     // 4방향으로 나눠지는 로직
     // 로직 시작할 때 괄호를 열어준다.
     ret += "("
     ret += quard(y: y, x: x, size: size / 2)
     ret += quard(y: y, x: x + size / 2, size: size / 2)
     ret += quard(y: y + size / 2, x: x, size: size / 2)
     ret += quard(y: y + size / 2, x: x + size / 2, size: size / 2 )
     ret += ")"
     return ret
 }
 ```
 상기와 같은 핵심 코드를 이번 처럼 경험해 본 뒤 다시 풀어봐야겠다.
 */


