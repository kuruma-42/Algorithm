//
//  1-F.swift
//  Algorithm
//  BaekJoon 11655
//  Created by Yong Jun Cha on 2023/02/12.
//

import Foundation

var input = Array(readLine()!).map { String($0) }
var encryptedResult: String = ""
let alphabetDict: [String: Int] = [
    "a" : 1,
    "b" : 2,
    "c" : 3,
    "d" : 4,
    "e" : 5,
    "f" : 6,
    "g" : 7,
    "h" : 8,
    "i" : 9,
    "j" : 10,
    "k" : 11,
    "l" : 12,
    "m" : 13,
    "n" : 14,
    "o" : 15,
    "p" : 16,
    "q" : 17,
    "r" : 18,
    "s" : 19,
    "t" : 20,
    "u" : 21,
    "v" : 22,
    "w" : 23,
    "x" : 24,
    "y" : 25,
    "z" : 26,
]

for i in 0..<input.count {
    let inputAlphabet = input[i]
    if inputAlphabet == " " {
        encryptedResult.append(inputAlphabet)
    } else {
        if let inputAlphabetIndex = alphabetDict[inputAlphabet.lowercased()] {
            var encryptedIndex = inputAlphabetIndex + 13
            if encryptedIndex > 26 {
                encryptedIndex = encryptedIndex - 26
            }
            let encryptedAlphabetDict = alphabetDict.first {
                $0.1 == encryptedIndex
            }
            let encryptedAlphabet = encryptedAlphabetDict?.key
            if Character(inputAlphabet).isUppercase {
                encryptedResult.append(encryptedAlphabet?.uppercased() ?? "")
            } else {
                encryptedResult.append(encryptedAlphabet ?? "")
            }
        } else {
            encryptedResult.append(inputAlphabet)
        }
    }
}

print(encryptedResult)


/**
 ASCII Code 에 대해서 학습했다면 훨씬 좋은 코드를 만들었을 것이라고 생각한다.
 Dictionary로 풀다보니 풀리긴 풀렸으나 공간복잡도나 시간복잡도가 늘어났고
 Dictionart에 있는 함수들을 전부 알고있지는 않아서 공부가 필요하다고 생각했다.
 
 ASCII Code는 65가 대문자 A 97이 소문자 a이다
 65와 97을 외우면 모든지 풀 수 있다.
 
 ```
 // String to Ascii
 let ch = "C"
 let asciiIntValue_C = Int(UnicodeScalar(ch)!.value)
 let asciiIntValue_A = Int(UnicodeScalar("A").value)

 // Ascii Int Value to String
 let result = String(UnicodeScalar(asciiIntValue_A)!)
 ```
상기의 코드를 사용하였다면
 대소문자 구분이나, Dictionary를 쓰지않고 훨씬 쉽게 문제를 풀었을 것 갘다.
 */


