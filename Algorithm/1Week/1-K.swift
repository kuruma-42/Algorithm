//
//  1-K.swift
//  Algorithm
//  BaekJoon 1213
//  Created by Yong Jun Cha on 2023/03/01.
//

import Foundation

var input = Array(readLine()!.map {String($0)})

var alphabetDictionary: [String:Int] = [:]

for i in 0..<input.count {
    if var value = alphabetDictionary[input[i]] {
        alphabetDictionary[input[i]]! += 1
    } else {
        alphabetDictionary[input[i]] = 1
    }
}

var oddCheck: Int = 0
var oddAlphabet: String = ""
alphabetDictionary.keys.forEach { key in
    
    if (alphabetDictionary[key] ?? 0) % 2 == 1 {
        oddCheck += 1
        oddAlphabet = key
    }
}

var resultArray: [String] = []
if oddCheck < 2{
    if oddAlphabet != "" {
        
        resultArray.append(oddAlphabet)
        
        for i in stride(from: 90, to: 64, by: -1) {
            
            let alphabet = String(UnicodeScalar(i)!)
            
            if let count = alphabetDictionary[alphabet] {
                for _ in 0..<count/2 {
                    resultArray.insert(alphabet, at: 0)
                    resultArray.append(alphabet)
                }
            }
        }
        
        var resultString = ""
        resultArray.forEach {
            resultString.append($0)
        }
                                              
        print("\(resultString)")
    } else {
        for i in stride(from: 90, to: 64, by: -1) {
            
            let alphabet = String(UnicodeScalar(i)!)
            
            if let count = alphabetDictionary[alphabet] {
                for _ in 0..<count/2 {
                    resultArray.insert(alphabet, at: 0)
                    resultArray.append(alphabet)
                }
            }
        }
        
        var resultString = ""
        resultArray.forEach {
            resultString.append($0)
        }
                                              
        print("\(resultString)")
        
    }
    
} else {
    print("I'm Sorry Hansoo")
}

/**
 Review
 짝수나 홀수를 나눌 생각을 했지만
 팰린드롬이 안 되는 조건에 대해서 생각을 잘못했다.
 
 Difficult
 1. 한 글자 ex) A는 팰린드롬이 아니다 라고 생각해서 99% 에서 틀렸고
 2. 홀수개의 알파벳을 모두 첫 배열에 append해서 틀렸다 ( 원래는 홀수개의 알파벳 중 하나만 append 해야함)
 
 Insight
 - 정렬 순서가 없는 Dictionary라고 할지라도, ASCII Code를 사용해 정렬된 것 처럼 사용할 수 있었다.
 - Stride를 지금까지는 처음 써봤는데 아주 유용하다는 것을 꺠달았다.
 */
