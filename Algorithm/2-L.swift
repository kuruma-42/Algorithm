//
//  2-L.swift
//  Algorithm
//  baekjoon 2852
//  Created by Yong Jun Cha on 2023/07/21.
//

import Foundation

var n: Int = 0
var o: Int = 0
var a: Int = 0
var b: Int = 0
var aSum: Int = 0
var bSum: Int = 0
var s: String = ""
var prev: String = ""

/// 시간 만들어 주는 로직
/// - Parameter a: 이기고 있는 시간(초 단위)이 들어옴
/// - Returns: MM:ss 폼의 스트링이 감
/// - Description : 00을 설정해 놓고 a가 한 자리든 두 자리든 대처할 수 있게 끝 자리 두 개만 채택하게 함
func print(a: Int) -> String {
    var d: String = "00" + String(a / 60)
    var e: String = "00" + String(a % 60)
    return d.suffix(2) + ":" + e.suffix(2)
}

/// MM:ss의 형태의 스트링을 작은 단위인 Int 초의 형태로 바꿔주는 로직
/// - Parameter a: MM:ss 형태의 String
/// - Returns: 초로 환산된 값이 리턴 됨
func changeToInt(a: String) -> Int {
    var min: Int = 0
    var sec: Int = 0
    min = Int(a.split(separator: ":" )[0])! * 60
    sec = Int(a.split(separator: ":" )[1])!
    return min + sec
}

/// 이기고 있거나 지고 있을 때의
/// - Parameters:
///   - sum: 이기고 있는 시간의 합
///   - s: 득점한 시간
func go(sum: inout Int, s: String) {
    sum += (changeToInt(a: s) - changeToInt(a: prev))
}

// 총 득점 횟수가 주어짐
n = Int(readLine()!)!

for _ in 0..<n {
    // 득점 팀과 시간이 주어짐
    var input = readLine()!.split(separator: " ").map { String($0) }
    // 득점 팀
    o = Int(input[0])!
    // 득점 시간
    s = input[1]
    
    // a가 이기고 있는 경우
    if(a > b) {
        // a에 이기고 있는 시간을 더한다
        go(sum: &aSum, s: s)
    }
    
    // b가 이기고 있는 경우
    if (b > a) {
        // b에 이기고 있는 시간을 더한다
        go(sum: &bSum, s: s)
    }
    
    // 이렇게 되면 자연스럽게 비기고 있는 경우는 생각하지 않게 된다.
    // 첫 골이 터진 경우까지 로직이 커버가 된다.
    
    // 득점한 팀에게 + 1
    o == 1 ? {a += 1}() : {b += 1}()
    // 전 시간을 prev에 저장해둔다.
    prev = s
}

// 마지막 종료 시점을 더해줘야한다.
if a > b {
    go(sum: &aSum, s: "48:00")
}

// 마지막 종료 시점을 더해줘야한다.
if b > a {
    go(sum: &bSum, s: "48:00")
}

// 초로 되어있던 결과를 MM:ss로 바꿔준다.
var result1: String = print(a: aSum)
var result2: String = print(a: bSum)

//출력
print("\(result1)")
print("\(result2)")

/**
 - Description
 prev을 정의해 이전 값과 현재 값의 비교로 풀어야 한다는 것은 알았지만
 시간을 하나의 단위로 통일하고 더해 나가야 되는 아이디어가 떠오르지 않았다.
 아이디어 자체를 외우고 이해해야겠다.
 */

