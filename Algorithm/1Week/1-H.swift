//
//  1-H.swift
//  Algorithm
//  BaekJoon 2559
//  Created by Yong Jun Cha on 2023/02/20.
//

import Foundation

var input = readLine()!.split(separator: " ").map { Int($0) }
var range = input[1] ?? 0
var count = input[0] ?? 0
var maxTemperature: Int = 0
var prefixSum: [Int] = Array(repeating: 0, count: count + 1)
var temp = 0

var prefixSum2: [Int] = Array(repeating: 0, count: count + 1)
var temperatures = readLine()!.split(separator: " ").map { Int($0)! }
//print("temperature :: \(temperatures)")
// prefixSum
for i in 0..<temperatures.count {
    prefixSum[i + 1] = temp + temperatures[i]
    temp = prefixSum[i + 1]
}

maxTemperature = prefixSum[range] - prefixSum[0]
for i in range+1..<prefixSum.count {
    let result = prefixSum[i] - prefixSum[i - range]
    if result > maxTemperature {
        maxTemperature = result
    }
    
}
//print("prefixSum :: \(prefixSum)")
print(maxTemperature)

/**
 이 문제를 O{n^2)으로 풀면 1000만 이상의 값이 들어오기 때문에 시간초과가 난다
 따라서 prefixSum으로 해당 문제를 풀어야한다. Prefix 개념을 다시 보고 오도록 하겠다.
 ```
 var input = readLine()!.split(separator: " ").map { Int($0) }
 var range = input[1] ?? 0
 var count = input[0] ?? 0
 var maxTemperature: Int = 0

 var temperatures = readLine()!.split(separator: " ").map { Int($0)! }

 for i in 0..<temperatures.count {
     if i + range <= temperatures.count {
         var temperaturesSum = 0
         
         temperaturesSum = temperatures[i..<i+range].map { $0 }.reduce(0,+)
         if temperaturesSum > maxTemperature {
             maxTemperature = temperaturesSum
         }
     }
 }

 print(maxTemperature)
 ```
 
 
 
 prefixSum을 구할 때 reduce를 사용하는 방법도 좋을 것 같다
 ```
 prefixSum2 = temperatures.reduce(into: [0]) { partialResult, element in
     print("partialResult :: \(partialResult.last)")
     print("element\(element)")
     partialResult.append(partialResult.last! + element)
 
 }
 ```
 
 제출했을 때 틀린 이유중에 가장 큰 것은
 maxtemperature의 초기값을 0으로 주고 연산을 진행했는데
 물론 예제 테스트케이스는 통과하지만, 모든 날이 영하인 경우에는
 maxtemperature가 0으로 선언되어 있기 때문에 최고 기온이 -1인 경우에는
 오답인 0을 리턴한다. 항상 임의의 값을 넣었다면 다시 연산할 때는 초기 값을 할당해서
 답이 틀릴 확률을 줄이도록 해야겠다.
 */
