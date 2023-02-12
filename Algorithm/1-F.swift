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
