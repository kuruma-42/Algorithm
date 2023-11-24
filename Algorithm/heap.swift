//
//  heap.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/11/23.
//

import Foundation

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




//
//struct Heap<T: Comparable> {
//    private var elements: [T] = []
//    private var sortFunction: (T, T) -> Bool
//
//    var isEmpty: Bool {
//        return self.elements.count == 1
//    }
//    var peek: T? {
//        if self.isEmpty { return nil }
//        return self.elements.last!
//    }
//    var count: Int {
//        return self.elements.count - 1
//    }
//
//    init(elements: [T] = [], sortFunction: @escaping (T, T) -> Bool) {
//        if !elements.isEmpty {
//            self.elements = [elements.first!] + elements
//        } else {
//            self.elements = elements
//        }
//        self.sortFunction = sortFunction
//        if elements.count > 1 {
//            self.buildHeap()
//        }
//    }
//
//    func leftChild(of index: Int) -> Int {
//        return index * 2
//    }
//    func rightChild(of index: Int) -> Int {
//        return index * 2 + 1
//    }
//    func parent(of index: Int) -> Int {
//        return (index) / 2
//    }
//    mutating func add(element: T) {
//        self.elements.append(element)
//    }
//    mutating func diveDown(from index: Int) {
//        var higherPriority = index
//        let leftIndex = self.leftChild(of: index)
//        let rightIndex = self.rightChild(of: index)
//
//        if leftIndex < self.elements.endIndex && self.sortFunction(self.elements[leftIndex], self.elements[higherPriority]) {
//            higherPriority = leftIndex
//        }
//        if rightIndex < self.elements.endIndex && self.sortFunction(self.elements[rightIndex], self.elements[higherPriority]) {
//            higherPriority = rightIndex
//        }
//        if higherPriority != index {
//            self.elements.swapAt(higherPriority, index)
//            self.diveDown(from: higherPriority)
//        }
//    }
//    mutating func swimUp(from index: Int) {
//        var index = index
//        while index != 1 && self.sortFunction(self.elements[index], self.elements[self.parent(of: index)]) {
//            self.elements.swapAt(index, self.parent(of: index))
//            index = self.parent(of: index)
//        }
//    }
//    mutating func buildHeap() {
//        for index in (1...(self.elements.count / 2)).reversed() {
//            self.diveDown(from: index)
//        }
//    }
//    mutating func insert(node: T) {
//        if self.elements.isEmpty {
//            self.elements.append(node)
//        }
//        self.elements.append(node)
//        self.swimUp(from: self.elements.endIndex - 1)
//    }
//    mutating func remove() -> T? {
//        if self.isEmpty { return nil }
//        self.elements.swapAt(1, elements.endIndex - 1)
//        let deleted = elements.removeLast()
//        self.diveDown(from: 1)
//
//        return deleted
//    }
//}
//
