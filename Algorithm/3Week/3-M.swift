//
//  3-M.swift
//  Algorithm
//  baekjoon 2529 부등호
//  Created by Yong Jun Cha on 2023/09/20.
//

import Foundation

/**
 - Description
 >  부등호를 받는다.
 0 ~ 9 까지의 부등호 사이사이에 넣을 수 있고
 수가 중복되면 안 되고, 관계도 다 맞아야한다.
 10! 나온다.
 
 아스키 코드를 써서 풀 생각을 못하는 것 같다.
 하기의 문제는 아스키 코드를 사용하여 풀어야 한다.
 점화식을 만들 생각도 해야하는데

 부등호의 인덱스 0
 이전의 고른 숫자의 인덱스 0, 지금 고른 숫자 인덱스 1
 부등호[idx - 1]
 이전 숫자[idx -1] 지금 숫자[idx] 를 비교하는 것이다
 
 그리고 사용하는 숫자들을 정수형으로 접근하기 보다는
 문자라고 생각하고 접근해서 하기와 같이 아스키 벨류를 만들어서
 
 ```
 zeroValue = Int(UnicodeScalar("0").value)
 oneValue = Int(UnicodeScalar("1").value)
 ```
 
 Character(UnicodeScalar(i + zeroValue)!)
 이런 식으로 캐릭터 값을 만들어주면 비교가 더 쉽다.
 
 이 문제 전의 문제에서도 알파벳에 대해서
 Int(UnicodeScalar(a[ny][nx])!.value) - Int(UnicodeScalar("A").value)
 상기와 같은 방법으로 visited를 체킄하는 방법이 있었는데
 유념해서 풀어봐야할 것 같다.
 C++코드 보다 ASCII를 사용하는 자유도가 조금은 떨어지는 것 같다.
 
 */

var zeroValue = Int(UnicodeScalar("0").value)
var check = Array(repeating: false, count: 10)
var ret: [String] = []
//var num: String = ""
var n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").map { String($0) }


func good(x: Character, y: Character, op: String) -> Bool {
    
    if x > y && op == ">" {
        return true
    }
    
    if x < y && op == "<" {
        return true
    }
    
    return false
}


func go(idx: Int, num: String) {
    if num.count == n + 1 {
        ret.append(num)
        return
    }
   
    for i in 0..<10 {
        if check[i] {
            continue
        }
        if idx == 0 ||
            good(
                x: num[num.index(num.startIndex, offsetBy: idx - 1)],
                y: Character(UnicodeScalar(i + zeroValue)!),
                op: a[idx - 1]
            ){
            check[i] = true
            go(idx: idx+1, num: num + "\(i)")
            check[i] = false
        }
    }
}

go(idx: 0, num: "")

print("\(ret.last!)")
print("\(ret.first!)")

