#  ReadLineList

정수 한 개 입력
let input = Int(readLine() ?? "")!

정수 여러 개 입력
let input1 = readLine()!.split(separator: " ").map { Int(String($0))! }

문자열 한 개 입력
let input = readLine()!

문자열 여러 개 입력
let input1 = readLine()!.split(separator: " ")
let input2 = readLine()!.split { $0 == " " }

연속적인 입력
let input = Array(readLine()!).map { Int(String($0))! }


let input1 = readLine()!.split(separator: " ")

print("\(input1)")

# 빠른 입출력 

백준에서 readLine의 속도가 느려서 시간초과가 많이 나서 
입출력을 빨리해주는 라이노님의 코드를 받아서 쓰기로 했다. 

import Foundation


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

상기의 코드를 import foundation 밑에 붙여주고 
하기와 같이 사용하면 된다. 

import Foundation

let fIO = FileIO()

let n = fIO.readInt()

print(n)
