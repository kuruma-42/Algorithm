//
//  4-D.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/10/22.
//

import Foundation

// baekjoon 1987 알파벳
/**
 - Description
 dfs로 탐색을해서 중복되지 않는
 최대 이동 거리를 출력하면 된다.
 
 비트마스킹으로 알파벳을 지나갔는지 안 지나갔는지
 체크하면서 없으면 비트를 켜고 있으면 탐색을 멈추는 형식으로 하면 될 것 같다.
 97 65 아스키 코드 기억하고.
 백트레킹? 도 써야한다.
 비트마스킹은 하나의 불리언 벡터를 하나의 숫자로 표현한 것이다.
 
 ```
 func dfs(y: Int, x: Int, cnt: Int) {
 
     let idx = UnicodeScalar(a[y][x])!.value - 65
 
     // idx번 비트가 켜져있으면
     // 기저사례
     if used & 1 << idx != 0 {
         print("비트 켜짐 \(a[y][x])")
         // 탐색 카운트 최대값 비교
         ret = max(ret, cnt - 1)
         return
     }
 
     // n번 인덱스 켜기
     used |= 1 << idx
 
     for i in 0..<4 {
         let ny = y + dy[i]
         let nx = x + dx[i]
 
         if ny < 0 || ny >= r || nx < 0 || nx >= c {
             continue
         }
 
         // 탐색
         dfs(y: ny, x: nx, cnt: cnt + 1)
 
         // 탐색이 끝나면 알파벳 비트를 꺼준다.
         used &= ~(1 << idx)
 
     }
 
 }

 ```
 상기의 코드는 전역변수와 dfs를 비트를 직접 꺼주고 켜주고 하게 계산했지만
 그러는 과정에서 자꾸만 결과값이 다르게 나왔다
 하기의 go 처럼 탐색 식을 바뀌니 풀렸다.
 
 그리고 함수가 불릴 때 마다 ASCII코드를 연산하는 것 보다
 미리 예시를 입력 받을 때 INT값으로 받는 것이 시간초과를 넘기는 방법이다.
 */


let input = readLine()!.split(separator: " ").map { Int($0)! }
let r = input[0]
let c = input[1]
var a: [[Int]] = Array(repeating: [], count: r)

// 2진수로 보면 00000000000000000000000000 이렇게 보고 알파벳을 켜고 끄면 된다.
var used = 0
var ret = 0

var dy = [1, 0, -1, 0]
var dx = [0, 1, 0, -1]

for i in 0..<r {
    let temp = Array(readLine()!).map { Int($0.asciiValue!) }
    a[i] = (temp)
}

func go(y: Int, x: Int, num: Int, cnt: Int) {
    ret = max(ret, cnt)
    
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        if ny < 0 || ny >= r || nx < 0 || nx >= c {
            continue
        }
        
        let _next =  1 << (a[ny][nx] - 65)
        
        if num & _next == 0 {
            go(y: ny, x: nx, num: num | _next, cnt: cnt + 1)
        }
        
    }
}

go(y: 0, x: 0, num: 1 << (a[0][0] - 65) , cnt: 1)

print("\(ret)")


func dfs(y: Int, x: Int, cnt: Int) {

    let idx = UnicodeScalar(a[y][x])!.value - 65

    // idx번 비트가 켜져있으면
    // 기저사례
    if used & 1 << idx != 0 {
        print("비트 켜짐 \(a[y][x])")
        // 탐색 카운트 최대값 비교
        ret = max(ret, cnt - 1)
        return
    }

    // n번 인덱스 켜기
    used |= 1 << idx

    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]

        if ny < 0 || ny >= r || nx < 0 || nx >= c {
            continue
        }

        // 탐색
        dfs(y: ny, x: nx, cnt: cnt + 1)

        // 탐색이 끝나면 알파벳 비트를 꺼준다.
        used &= ~(1 << idx)

    }

}
