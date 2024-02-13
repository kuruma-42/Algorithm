//
//  27866.swift
//  Algorithm
//  baekjoon 28866 문자와 문자열
//  Created by Yong Jun Cha on 2/13/24.
//

import Foundation

/**
 String Index를 사용하는 문제
 Python에 비해서는 String 인덱스를 사용하기가 까다롭다.
 Python은 그냥 String을 배열과 똑같이 쓰면 되는데 말이다.
 */
var s = readLine()!
var n = Int(readLine()!)!
var idx = s.index(s.startIndex, offsetBy: n - 1)

print(s[idx])

