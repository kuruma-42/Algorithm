//
//  stack.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/11/25.
//

import Foundation

struct Stack<T> {
    private var stack: [T] = []
    
    public var count: Int {
        return stack.count
    }
    
    public var isEmpty: Bool {
        return stack.isEmpty
    }
    
    public var top: T? {
        return isEmpty ? nil : stack.last
    }
    
    public mutating func push(_ element: T) {
        stack.append(element)
    }
    
    public mutating func pop() -> T?{
        return isEmpty ? nil : stack.popLast()
    }
}
