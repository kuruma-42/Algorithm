//
//  4-F.swift
//  Algorithm
//  baekjoon 1062 가르침
//  Created by Yong Jun Cha on 2023/11/03.
//

import Foundation


/**
 - Description
 모든 단어는 "anta" "tica"로 끝남
 단어는 N개 밖에 없음
 K개의 글자로 이루어진 글자만 읽을 수 있음
 어떤 K개의 글자를 가르쳐야
 최대한 많은 단어를 읽을 수 있는지
 
 재귀 구현하는 게 상당히 어렵다.
 문제도 살짝 잘못이해해서 헤맸다.
 
 스위프트로 풀면 현재 시간초과가 나는데
 이를 해결할 방법을 좀 찾아야겠다.
 스위프트는 아무래도 함수 호출 비용에 오버헤드가 많이 생기는 것 같다.
 
 그래도 비트마스킹에 대한 감이 점점 생기는 것 같다.
 */

var input = readLine()!.split(separator: " ").map { Int($0)! }
var n = input[0]
var k = input[1]
var words: [Int] = Array(repeating: 0, count: n)


for i in 0..<n {
    let a = Array(readLine()!).map { String($0) }
    for s in a {
        words[i] |= ( 1 << (UnicodeScalar(s)!.value - 97))
    }
}

func count(mask: Int) -> Int {
    var cnt: Int = 0
    for word in words {
        // 단어가 0이 아니고, 단어랑 마스킹이 같을 때 읽혔다고 판단한다.
        if word != 0 && (word & mask) == word {
            cnt += 1
        }
    }
    return cnt
}

func go(index: Int, k: Int, mask: Int) -> Int {
    // 배울 수 있는 단어가 없으면 리턴
    // 0이라고 리턴 되는 게 아니다 -1부터 리턴
    // 배울 수 있는 단어가 더 없어도
    // 안 배우고 넘어가는 선택지가 있기 때문에 모든 경우의 수를 돌 수 있다.
    if (k < 0) {
        return 0
    }
    
    // 알파벳 마지막 까지 왔으면
    if index == 26 {
        // 알파벳 다 배웠으면
        return count(mask: mask)
    }
    
    // 알파벳 하나 배운다.
    var ret = go(index: index + 1, k: k - 1, mask: mask | (1 << index))
    
    // index 가 a,n,t,i,c이 아니면 (antic)안배우는 경우의 수는 없다
    if index != (UnicodeScalar("a").value - 65) && index != UnicodeScalar("n").value - 65 && index != UnicodeScalar("t").value - 65 && index != UnicodeScalar("i").value - 65 && index != UnicodeScalar("c").value - 65 {
        // 안 배우고 넘어간다.
        ret = max(ret, go(index: index+1, k: k, mask: mask));
    }
    return ret
    
}

print(go(index: 0, k: k, mask: 0))

/**
 ```
 
 var bit = 0
 var k2 = k - 5
 var a: [[String]] = []
 //a n t i c 은 무조건 배워야한다.
 //0 13 19 8 2
 bit |= (1 << 0)
 bit |= (1 << 13)
 bit |= (1 << 19)
 bit |= (1 << 8)
 bit |= (1 << 2)
 var bitResetValue = bit
 var ret = 0


 for i in 0..<n {
     // 비트 값 초기화 (a,n,t,i,c 을 배워놓은 상태 )
     bit = bitResetValue
     // 배울 수 있는 단어 수 초기화 (a,n,t,i,c 제외)
     k2 = k - 5
     
     for j in 0..<a[i].count {
         // 단어의 인덱스 구하고
         let idx = UnicodeScalar(a[i][j])!.value - 97
         print("idx:: \(idx)")
         // 비트가 켜져있다면 ?
         if bit & (1 << idx) != 0 {
             // 넘어가
             print("bit on :: \(a[i][j])")
         } else {
             // 비트가 안 켜져있따면?
             // 배울 수 있는 단어의 수가 남아있을 경우
             if k2 > 0 {
                 // 단어를 배운다.
                 // 비트를 켠다
                 bit |= (1 << idx)
                 // 배울 수 있는 단어 수 차감
                 k2 -= 1
             } else {
                 // 비트가 안 켜져있고
                 // 배울 수 있는 단어의 수가 안 남아있으면 넘어간다.
                 print("break: \(a[i][j])  \(a[i])")
                 break
             }
         }
         // 끝까지 다 읽었으면
         if j == a[i].count - 1 {
             ret += 1
         }
         
     }
 }
 print("a: \(a)")
 print("ret: \(ret)")

 ```
 */
