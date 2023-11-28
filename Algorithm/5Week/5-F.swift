//
//  baekjoon1202.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/11/22.
//

import Foundation

// baekjoon 1202 보석도둑
/**
 - Description
 상덕이 보석 털기로 함
 무게 M
 가격 V를 가지고 있다.
 각 가방에 담을 수 있는 무게는 C이다.
 가방에는 최대 1개의 보석을 넣을 수 있다.
 
 첫째 줄에 N과 K가 주어진다.
 N은 보석의 갯수
 K는 가방에 담을 수 있는 무게
 
 N K 300000개
 MN <= 1억
 
 하기는 N과 K가 1억이 넘어가면 초과가 날 걸 알았지만
 브루트 포스로 풀었다가 시간초과가 난 코드였다.
 이미 O(n^2)에서 1억을 넘어가기 때문에 1초의 시간을 받았을 경우 시간 초과가 나는 것이 당연하다
 그래서 부분 최적화를 위해 heap과 우선순위큐를 써야한다.
 정렬을 잘하고 앞서 어떤 기준으로 정렬이 진행되었는지 잘 기억하고
 다음 로직을 실행해야한다.
 heap과 우선순위 큐를 새로 공부해서 문제를 풀었어야 해서 꽤 시간이 걸렸지만
 heap에 대해서 개념적으로 더 이해를 잘하게 되었다.
 하지만 좀 더 문제를 풀어가야 시험 때도 쓸 수 있을 것 같다.
 ```
 var input = readLine()!.split(separator: " ").map { Int($0)! }
 var n = input[0]
 var k = input[1]
 var a: [(Int, Int)] = []
 var w: [Int] = []
 var ret = 0

 for _ in 0..<n {
     let info = readLine()!.split(separator: " ").map { Int($0)! }
     a.append((info[0],info[1]))
 }

 for _ in 0..<k {
     let m = Int(readLine()!)!
     w.append(m)
 }

 // 정렬을 무게로 하자
 a = a.sorted {
     // 가치가 같다면
     if $0.1 == $1.1 {
         // 무게가 가벼운 것으로
         return $0.0 < $1.0
     }
     // 가치가 다르다면
     else {
         // 가격이 높은 순으로
         return $0.1 > $1.1
     }
 }

 // 값어치 작은 애를 가장 작은 주머니에 넣으면 이득
 // 오름 차순 정렬
 w = w.sorted(by: <)


 var idx = 0
 for i in 0..<n {
     
     if w.isEmpty {
         break
     }
     
     for j in 0..<k {
         if a[i].0 <= w[j] {
             ret += a[i].1
             w.remove(at: j)
             k -= 1
             break
         }
     }
     
 }
 print(ret)

 ```
 */

public struct Heap<T> {
    
    private var nodes = [T]()
    
    private var orderCriteria: (T, T) -> Bool
    
    public init(sort: @escaping (T, T) -> Bool) {
        // 최대 힙인지 최소 힙인지 기준을 잡는다.
        self.orderCriteria = sort
    }
    
    public init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
        configureHeap(from: array)
    }
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var count: Int {
        return nodes.count
    }
    
    public func peek() -> T? {
        return nodes.first
    }
    
    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }
    
    public mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }
        
        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(0)
            return value
        }
    }
    
    public mutating func remove(at index: Int) -> T? {
        guard index < nodes.count else { return nil }
        
        let lastIndex = nodes.count-1
        if index != lastIndex {
            nodes.swapAt(index, lastIndex)
            shiftDown(from: index, until: lastIndex)
            shiftUp(index)
        }
        
        return nodes.removeLast()
    }
    
    // 변수를 직접 변경해야 하기 때문에 mutating 을 사용한다.
    private mutating func configureHeap(from array: [T]) {
        nodes = array
        
        /**
         * 힙 트리에서 n/2 - 1 은 하나 위 층위가 된다.
         * shiftDown을 하면서 자리를 잡을 것이기 때문에
         * 마지막 leaf 노드들은 할 필요가 없다.
         */
        for i in stride(from: nodes.count/2 - 1, through: 0, by: -1) {
            shiftDown(i)
        }
    }
    
    private func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1) / 2
    }
    
    private func leftChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 1
    }
    
    private func rightChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 2
    }
    
    /**
     * shiftUp은 자신과 부모를 비교해 바꿔준다.
     */
    private mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = nodes[childIndex] // 처음에 노드를 저장해두고 인덱스를 구한 후 바꿔준다.
        var parentIndex = self.parentIndex(ofIndex: index)
        
        while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }
        
        nodes[childIndex] = child
    }
    
    /**
     * shiftDown은 left, right 자식 중 적합한 녀석이 있으면 바꾸면서 바닥까지 내려간다.
     */
    private mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(ofIndex: index)
        let rightChildIndex = leftChildIndex + 1
        
        var first = index
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }
        if first == index { return }
        
        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }
    
    private mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: nodes.count)
    }
    
}







var input = readLine()!.split(separator: " ").map { Int($0)! }
var n = input[0]
var k = input[1]
var a: [(Int, Int)] = []
var w: [Int] = []
var ret = 0

for _ in 0..<n {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    a.append((info[0],info[1]))
}

for _ in 0..<k {
    let m = Int(readLine()!)!
    w.append(m)
}

// 정렬을 무게로 하자
a = a.sorted { $0.0 < $1.0 }

// 값어치 작은 애를 가장 작은 주머니에 넣으면 이득
// 오름 차순 정렬
w = w.sorted(by: <)

var heap = Heap<(Int, Int)>(array: [], sort: { $0.1 > $1.1})
var jamIdx = 0
for i in 0..<k {
    // 보석의 인덱스가 꽉 차거나 해당 인덱스의 보석의 무게가 가방보다 작을 때만 while문이 작동한다.
    while jamIdx < n, a[jamIdx].0 <= w[i] {
        // 가방 무게가 작은 것을 heap insert
        heap.insert(a[jamIdx])
        // 보석 인덱스를 올려준다.
        jamIdx += 1
    }
    
    // max remove를 한다.
    // 그럼 가방 무게 보다 낮으면서 가장 값어치가 높은 값이 나온다.
    ret += heap.remove()?.1 ?? 0
    
}

print(ret)
