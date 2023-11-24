//
//  baekjoon2170.swift
//  Algorithm
//  baekjoon 2170 선 긋기
//  Created by Yong Jun Cha on 2023/11/24.
//

import Foundation

/**
 라인에 점을 찍고
 한 번에 탐색하면서 길이를 잰다.
 라인스위핑으로 풀어야 하고
 빠른 입력을 적용해야 풀린다.
 조건을 잘 생각해야한다.
 */

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}


var file = FileIO()
//var n = Int(readLine()!)!
var n = file.readInt()
var a: [(Int,Int)] = []
for i in 0..<n {
    var l: [Int] = [file.readInt(), file.readInt()]//    var l = readLine()!.split(separator: " ").map { Int($0)! }
    a.append((l[0],l[1]))
}

a = a.sorted(by: {
    if $0.0 == $1.0 {
        return $0.1 < $1.1
    } else {
        return $0.0 < $1.0
    }
})

var l = 0
var r = 0
var ret = 0
var ans = 0
var isCalculate: Bool = false

l = a[0].0
r = a[0].1

for i in 1..<n {
    if r < a[i].0 {
        ret += r - l
        l = a[i].0
        r = a[i].1
    } else if a[i].0 <= r && a[i].1 >= r {
        r = a[i].1
    }
}

ret += r - l
print(ret)
