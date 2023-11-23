//
//  priorityQueue.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/11/21.
//

import Foundation

struct PriorityQueue<T: Comparable> {
    var heap: Heap<T>
    
    init(_ elements: [T] = [], _ sort: @escaping (T,T) -> Bool) {
        heap = Heap(elements: elements, sortFunction: sort)
    }
    
    var count: Int {
        return heap.count
    }
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    func top() -> T? {
        return heap.peek
    }
    mutating func clear() {
        while !heap.isEmpty {
            _ = heap.remove()
        }
    }
    mutating func pop() -> T? {
        heap.remove()
    }
    mutating func push(_ element: T) {
        heap.insert(node: element)
    }
}

