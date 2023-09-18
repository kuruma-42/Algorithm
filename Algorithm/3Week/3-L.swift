//
//  3-L.swift
//  Algorithm
//  baekjoon 1987 알파벳
//  Created by Yong Jun Cha on 2023/09/18.
//

import Foundation

/**
 - Description
 > 지나간 길의 알파벳이 겹치면 안 된다.
 갈 수 있는 최대의 칸 수는 bfs로 할 수 있다?
 bfs 넘어갈 때 배열 주고?
 근데 배열 주면 ... 배열에서 이 알파벳이 있는지 체크할 때 contains O(n)쓸 거고
 dfs로 cnt를 주면서 완탐을 해야한다, 약간 시간 초과가 의심되긴 한다.
 백 트래킹과 아스키 코드를 쓸 생각을 해야함
 FileIO를 사용하여 빠른 입력 까지 사용해봤지만 8%대에서 시간초과가 생겼다.
 Swift는 다른 언어와 다르게 함수를 부를 때 ( 재귀나 백트레킹 등)에서 오버헤드가 발생한다고 한다.
 해당 문제는 빠른 입출력 + 비트마스킹 까지 써야 풀 수 있는 문제라고 한다.
 아직 비트마스킹은 진도가 안 나갔으니 다시 차후에 도전하겠다.
 ```
 // String to Ascii
 let ch = "C"
 let asciiIntValue_C = Int(UnicodeScalar(ch)!.value)
 let asciiIntValue_A = Int(UnicodeScalar("A").value)

 // Ascii Int Value to String
 let result = String(UnicodeScalar(asciiIntValue_A)!)
 ```
 
 */
let fIO = FileIO()

let r = fIO.readInt()
let c = fIO.readInt()


var bt = Array(repeating: false, count: 26)
var dy = [1, 0, -1, 0]
var dx = [0, 1, 0, -1]

var a: [[String]] = []
var ret = 0

for _ in 0..<r {
    let info = Array(fIO.readString()).map { String($0) }
    a.append(info)
}

func dfs(y: Int, x: Int, cnt: Int ) {
    ret = max(ret, cnt)
    
    for i in 0..<4 {
        
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        // 오버플로우 체크
        if ny < 0 || ny >= r || nx < 0 || nx >= c {
            continue
        }
        
        let next = Int(UnicodeScalar(a[ny][nx])!.value) - Int(UnicodeScalar("A").value)
        
        if bt[next] == false  {
            bt[next] = true
            dfs(y: ny, x: nx, cnt: cnt + 1)
            bt[next] = false
        }
        
    }
    
}
var first = Int(UnicodeScalar(a[0][0])!.value) - Int(UnicodeScalar("A").value)
bt[first] = true
dfs(y: 0, x: 0, cnt: 1)
print("\(ret)")
