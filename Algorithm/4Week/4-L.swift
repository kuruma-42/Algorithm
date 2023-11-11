//
//  4-L.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/11/11.
//

import Foundation

// baekjoon 5430 AC

/**
 - Description
 디큐 방식으로 푸는 방법과
 투 포인터로 구현하는 방법이 있다.
 
 디큐 방법으로 구현했으나 reversed가 O(1)임에도 불구하고
 시간초과가 났다. 그리고 다른 스위프트 풀이들을 보니
 디큐를 구현해서 푼 사람이 없었다.
 삭제 로직이 들어가는 순간 시간초과가 나는 것 아닌가 싶다.
 
 강의 같은 곳에서도 대부분이 디큐로 푸는 방법이 많았다
 그렇지만 스위프트에서는 틀린 풀이같지 않지만 언어 특성상 안 풀리는 것 같았다.
 
 dequeue로 푸는 방식
 ```
 for i in 0..<t {
     let p = Array(readLine()!).map { String($0) }
     let n = Int(readLine()!)!
     var arr: [Int] = readLine()!.dropFirst().dropLast().split(separator: ",").map{Int(String($0))!}

         isError = false
         isReverse = false
     for i in 0..<p.count {
         if p[i] == "R" {
             isReverse.toggle()
             continue
         }

         if p[i] == "D" {
             if arr.count > 0 {
                 if isReverse {
                     arr.popLast()
                 } else {
                     // drop first
                     // reversed O(1)인데 안 풀리네
                     arr = arr.reversed()
                     arr.popLast()
                     arr = arr.reversed()
                 }
             } else {
                 print("error")
                 isError = true
                 break
             }
         }

     }
     if !isError {
         if isReverse {
             arr = arr.reversed()
             print("\(arr)")
         } else {
             print("\(arr)")
         }
     }
 }
 ```
 그리고 출력 부분에서 좀 특이한 점이 있었는데
 스트링으로 joined를 사용하여 출력을 하지 않으면
 엄청 큰 출력이 들어왔을 때 출력이 달라지는 것 같다 (확인할 방법은 없다)
 브루트 포스로 직접 물리적으로 삭제하는 방법도 일단은 해보긴 했는데
 당연히 안 될걸 알았지만 일단은 구현해봤다.
 오랜만에 투 포인터 문제를 풀었던 것 같다.
 */

var t = Int(readLine()!)!
var isError: Bool = false
var isReverse: Bool = false
var head: Int = 0
var tail: Int = 0
for i in 0..<t {
    let p = Array(readLine()!).map { String($0) }
    let n = Int(readLine()!)!
    var arr: [String] = readLine()!.dropFirst().dropLast().split(separator: ",").map{String($0)}
    
    // 인덱스 할당, 헤드는 0부터
    head = 0
    tail = arr.count - 1
    isError = false
    isReverse = false
    
    for i in 0..<p.count {
        if p[i] == "R" {
            isReverse.toggle()
            continue
        }
        
        if p[i] == "D" {
            
            if head > tail {
                print("error")
                isError = true
                break
            }
            
            if isReverse {
                tail -= 1
            } else {
                // drop first
                // reversed O(1)인데 안 풀리네
                head += 1
            }
            
        }
        
    }
    
    if !isError {
        if head > tail {
            print("[]")
        } else {
            if isReverse {
                print("[\(arr[head...tail].reversed().joined(separator: ","))]")
            } else {
                print("[\(arr[head...tail].joined(separator:","))]")
            }
        }
    }
}

