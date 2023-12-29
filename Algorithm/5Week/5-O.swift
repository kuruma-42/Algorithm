//
//  5-O.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/12/29.
//

import Foundation


// baekjoon 17406 배열 돌리기 4

/**
 배열은 회전 연산을 수행할 수 있다.
 회전 연산은 세 정수 (r, c, s)로 이루어져 있고,
 가장 왼쪽 윗 칸이 (r-s, c-s),
 가장 오른쪽 아랫 칸이 (r+s, c+s)인 정사각형을 시계 방향으로 한 칸씩 돌린다는 의미이다
 배열의 칸 (r, c)는 r행 c열을 의미한다.
 
 Review
 구현이 정말 복잡했다.
 배열을 돌리는 로직 + permutation을 섞어서 행의 최솟값을 내는 것이다.
 for문이 여러 번 중첩되고 불안하지만 N값을 볼 떄 가능한 수치였다.
 구현이 그렇게 쉽지만은 않은 문제였다.
 permutation이나 combination이 꼭 섞여 나올 때가 있으니 다시 한 번 개념을 봐주자.
 */


let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
let k = input[2]
var a: [[Int]] = []
var r: [[Int]] = []
var o: [[Int]] = []
var dy = [1, 0, -1, 0]
var dx = [0, 1, 0, -1]
var dir = 1
var INF = 987654321
var ans = INF

for _ in 0..<n {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    a.append(info)
    r = a
}

for _ in 0..<k {
    let t = readLine()!.split(separator: " ").map { Int($0)! }
    o.append(t)
    }

func perm(s: Int) {
    
    if s == o.count {
        // func
        go(arr: o)
        sum()
        reset()
    }
    
    for i in s..<o.count {
        o.swapAt(s, i)
        perm(s: s+1)
        o.swapAt(i, s)
    }
    
}

perm(s: 0)

func go(arr: [[Int]]) {
    for i in 0..<o.count {
        let t = arr[i]
        
        for i in 1...t[2] {
            // 문제에서는 1,1 부터 시작
            // 나는 0,0으로 가정했기 때문에 -1을 빼준다.
            let topLeft = [(t[0] - i) - 1, (t[1] - i) - 1]
            let bottomRight = [(t[0] + i) - 1, (t[1] + i) - 1]
            
            var temp1 = 0
            
            // ➡️
            for i in topLeft[1]...bottomRight[1] {
                
                if i == topLeft[1] {
                    temp1 = a[topLeft[0]][i]
                } else {
                    var t = a[topLeft[0]][i]
                    a[topLeft[0]][i] = temp1
                    temp1 = t
                }
            }
            
            // ⬇️
            for i in topLeft[0]...bottomRight[0] {
                if i != topLeft[0] {
                    var t = a[i][bottomRight[1]]
                    a[i][bottomRight[1]] = temp1
                    temp1 = t
                }
            }
            
            // ⬅️
            for i in stride(from: bottomRight[1], through: topLeft[1], by: -1) {
                if i != bottomRight[1] {
                    var t = a[bottomRight[0]][i]
                    a[bottomRight[0]][i] = temp1
                    temp1 = t
                }
            }
            
            // ⬆️
            for i in stride(from: bottomRight[0], through: topLeft[0], by: -1) {
                if i != bottomRight[0] {
                    var t = a[i][topLeft[1]]
                    a[i][topLeft[1]] = temp1
                    temp1 = t
                }
            }
        }
    }
}

func sum() {
    // 따로
    for i in 0..<n {
        var ret = 0
        for j in 0..<m {
           ret += a[i][j]
        }
        ans = min(ans, ret)
    }

}

func reset() {
    a = r
}

print(ans)
