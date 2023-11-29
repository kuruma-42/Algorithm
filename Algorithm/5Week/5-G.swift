//
//  5-G.swift
//  Algorithm
//  baekjoon 1664 소수의 연속합
//  Created by Yong Jun Cha on 2023/11/29.
//

import Foundation


/**
 연속된 소수의 합으로 나타낼 수 있는 경우의 수 구하기
 라인 스위핑을 써야할 것 같다.
 소수를 만들어야 한다.
 소수의 정의: 1과 자기 자신만이 나눠지는 수
 소수를 어떻게 판별할까?
 
 에라토스테네스의 체로 판별해야한다.
 예외를 잘 찾아야 한다.
 1인 경우도 문제에 포함되어 있으므로 예외처리 해준다.
 
 투포인터 문제의 경우에는 이게 맞나 싶은 생각이 들 때가 있는데
 일단 뚝심있게 생각을 밀고나가는 게 핵심인 것 같다.
 */
let n = Int(readLine()!)!
var a = Array(repeating: 0, count: n + 1)
var idxl = 0
var idxr = 0
var ret = 0
var ans = 0
var isFirst = true


func isPrime(_ num: Int, _ numArray: inout [Int]) {
    
    for i in 2...num {
        numArray[i] = i
    }
    
    for i in 2...num {
        
        if numArray[i] == 0 { continue }
        
        for j in stride(from: i+i, through: num, by: i) {
            numArray[j] = 0
        }
    }
    
    numArray = numArray.filter({ $0 != 0 })
}

if n != 1 {
    isPrime(n, &a)
    
    while idxl <= idxr && idxl < a.count  && idxr < a.count {
        
        if isFirst {
            ret += a[0]
            isFirst = false
        } else {
            ret += a[idxr]
        }
        
        
        if ret == n {
            ans += 1
        }
        
        else if ret > n {
            while ret >= n{
                ret -= a[idxl]
                idxl += 1
                if ret == n {
                    ans += 1
                    break
                }
            }
            
        }
        
        idxr += 1
    }

    print(ans)

} else {
    print(ans)
}

