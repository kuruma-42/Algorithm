//
//  5-A.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/11/25.
//

import Foundation

// baekjoon 2109 순회강연
/**
 n(0 ≤ n ≤ 10,000)개의 대학에서 강연 요청을 해 왔다.
 d(1 ≤ d ≤ 10,000)일 안에 와서 강연을 해 주면
 p(1 ≤ p ≤ 10,000)만큼의 강연료를 지불하겠다
 
 최소 = 최대를 크게, 최소를 작게
 우선순위 큐 문제는 기준을 잘 만들어야 한다.
 
 처음에 이렇게 기준을 잡았다가 많이 돌아갔다.
 - 정렬 기준을 우선 강연료가 비싼 순으로 정렬
 - 그리고 날짜가 가장 작은 순으로 정렬
 
 제대로 된 정렬 기준
 - 날짜가 작은 순서대로 오름차순 정렬
 - heap에서는 강연료가 쌀수록 위로 정렬
 문제를 좀 더 많이 풀어봐야할 것 같다.
 
 
```
 반례
6
10 1
1000 5
1000 5
1000 5
1000 5
1000 5


a = a.sorted(by: { $0.0 < $1.0})

d = a[0].0
p = a[0].1
h.insert(a[0])

for i in 1..<n {
    // 만약 날짜가 더 많은 것으로 바뀌었다면
    if d < a[i].0 {
        // 많아진 날짜 append
        d = a[i].0
        // 가장 top 값을 remove 해주고
        ret += h.remove()?.1 ?? 0
        // heap 초기화
        h = Heap(array: [], sort: {$0.1 > $1.1})
        h.insert(a[i])
    }

    if d == a[i].0 {
        // 만약 날짜가 같다면
        h.insert(a[i])
    }
}

ret += h.remove()?.1 ?? 0

print(ret)
```
 
 */

let n = Int(readLine()!)!
var a: [(Int, Int)] = []
var h: Heap<(Int, Int)> = Heap(array: [], sort: {$0.1 < $1.1})
var d = 0
var p = 0
var ret = 0

for i in 0..<n {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    a.append((info[1], info[0]))
}

// 날짜가 적은 순으로 정렬
a = a.sorted(by: { $0.0 < $1.0 })

for i in 0..<n {
    // 우선 인서트를 한다
    // 값이 작을 수록 최상위에 올라온다.
    // [(1, 20), (1, 2), (2, 100), (2, 8), (3, 10), (10, 50), (20, 5)] 예시
    /**
     (1,20)이 insert 된다.
     (1,2)가 insert된다.
     h.count = 2 이고 a[i].0  = 1이다.
     따라서 현재 강연료가 낮은 (1,2)가 heap의 최 상단에 있다.
     remove()를 통해 최상단 삭제를 진행하면
     최소 값이 남지 않게 된다.
     */
    h.insert(a[i])
    if h.count > a[i].0 {
        h.remove()
    }
}

while !h.isEmpty {
    ret += h.remove()?.1 ?? 0
}

print(ret)
