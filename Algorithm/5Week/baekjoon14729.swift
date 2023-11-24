//
//  baekjoon14729.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/11/24.
//

import Foundation


// baekjoon 14729 칠무해
/**
 첫째 줄에 학생의 수 N( 8<=N<=10,000,000)이 주어진다.
 둘째 줄 부터 N개의 줄에는 학생들의 성적이 무작위로 주어진다.
 성적은 최소 0점 부터 최대 100점 까지이다.
 
 성적이 안 좋은 7명의 점수를 뽑아보자
 
 10000000 입력이 천만 정도 주어질 수 있기 때문에
 O(n^2)으로 문제를 풀게된다면 시간초과가 날 확률이 높다.
 따라서 O(logn)으로 문제를 해결할 수 있는 방밥을 사용해야한다.
 Priority Queue를 사용해서 풀어야한다.
 
 출력에서 소수점 3자리까지 출력하는 것을 까먹지 말자
 */

let n = Int(readLine()!)!
var a: [Float] = []
var pq: Heap<Float> = Heap(array: [], sort: { $0 < $1 })
var ret: [Float] = []

for i in 0..<n {
    let g = Float(readLine()!)!
    pq.insert(g)
}

for i in 0..<7 {
    print(String(format: "%.3f", pq.remove()!))
}
