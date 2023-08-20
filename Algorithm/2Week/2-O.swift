//
//  2-O.swift
//  Algorithm
//  baekjoon 4949
//  Created by Yong Jun Cha on 2023/08/01.
//

import Foundation

/**
 - Description
모든 왼쪽 소괄호("(")는 오른쪽 소괄호(")")와만 짝을 이뤄야 한다.
모든 왼쪽 대괄호("[")는 오른쪽 대괄호("]")와만 짝을 이뤄야 한다.
모든 오른쪽 괄호들은 자신과 짝을 이룰 수 있는 왼쪽 괄호가 존재한다.
모든 괄호들의 짝은 1:1 매칭만 가능하다. 즉, 괄호 하나가 둘 이상의 괄호와 짝지어지지 않는다.
짝을 이루는 두 괄호가 있을 때, 그 사이에 있는 문자열도 균형이 잡혀야 한다.
 
 2-N과 비슷한 문제지만 쓰는 문자열이 2배로 늘었다.
 [] () 둘 다 균형이 맞았을 때 yes를 출력하면 된다.
 중간에 -가 되면 안 되고 하나도 문자열이 안 들어올 때도 균형이 맞는 것으로 보면 된다.
 
 짝이 안 맞는 경우중 ([)]이렇게 되는 경우를 제외해야한다.
 * 짝을 짓는 문제는 스택으로 풀어야한다.
 */

while var line = readLine() {
    // '.'이 오면 더 이상 받지 않는다.
    if line == "." {
        break
    }
    // 스택 처럼 쓸 예정
    var stk: [Character] = []
    // 한 글자씩 탐색
    for i in 0..<line.count {
        let idx = line.index(line.startIndex, offsetBy: i)
        let s = line[idx]
        
        // 열리는 괄호는 푸쉬
        if s == "(" {
            stk.append(s)
        }
        
        // 여기서 스택
        if s == ")" {
            
            if stk.count == 0 {
                stk.append(s)
                break
            }
            
            if stk.count != 0 {
                
                // 스택의 짝이 탑이 안 맞으면
                if stk.last != "(" {
                    break
                }
                
                // 스택의 탑이 짝이 맞으면
                if stk.last == "(" {
                    // pop
                    stk.removeLast()
                }
            }
            
        }
        
        // 열리는 괄호는 푸쉬
        if s == "[" {
            stk.append(s)
        }
        
        // 여기서 스택
        if s == "]" {
            
            // 스택이 비어있는데 닫히는 괄호가 나온다면
            if stk.count == 0 {
                stk.append(s)
                break
            }
            
            // 스택 카운트가 0이 아닌 경우 (참조 오류 방지)
            if stk.count != 0 {
                
                // 마지막이 짝이 안 맞으면
                if stk.last != "[" {
                    // no 출력
                    break
                }
                
                // 마지막이 짝이 맞는다면
                if stk.last == "[" {
                    // pop
                    stk.removeLast()
                }

            }
            
        }
        
    }
    
    if stk.isEmpty {
        print("yes")
    }
    
    if !stk.isEmpty {
        print("no")
    }
    
}

// 처음 잘못 풀었던 아이디어 스택을 사용할 생각을 못했다.
//
//var input = readLine()!.split(separator: ".")
//
//while var line = readLine() {
//
//    var t1 = 0
//    var t2 = 0
//
//    var isT1First = false
//    var isT2First = false
//
//    for i in 0..<line.count {
//
//        var idx = line.index(line.startIndex, offsetBy: i)
//
//        var s = line[idx]
//        print("t1: \(t1)")
//        print("t2: \(t2)")
//
//        print("s: \(s)")
//
//
//        if t1 < 0 || t2 < 0 {
//            break
//        }
//
//        if s == "(" {
//            t1 += 1
//            continue
//        }
//
//        if s == ")" {
//            t1 -= 1
//            continue
//        }
//
//        if s == "[" {
//            t2 += 1
//            continue
//        }
//
//        if s == "]" {
//            t2 -= 1
//            continue
//        }
//
//    }
//
//    if t1 == 0 && t2 == 0 {
//        print("yes")
//    }
//
//    if t1 != 0 || t2 != 0 {
//        print("no")
//    }
//
//
//}


