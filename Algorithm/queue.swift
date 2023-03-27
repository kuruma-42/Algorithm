//
//  queue.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/03/27.
//

/// 가장 쉬운 방식으로 만드는 Queue
/// - Description: 하기의 방식으로 큐를 만든다면 구현 면에서는 편하지만 dequeue 과정에서 성능 문제가 생긴다.
///                 배열의 특성상 맨앞의 요소를 지우게 되면 O(n)의 시간 복잡도가 생긴다.
///                 따라서 dequeue를 하는 과정에서 removeFirst를 계속 하게 된다면 O(n)의 로직을 계속 처리하는 결과가 생긴다.
struct ArrayQueue<T> {
    private var queue: [T] = []
    
    public var count: Int {
        queue.count
    }
    
    public var isEmpty: Bool {
        queue.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
    
    public mutating func clear() {
        queue.removeAll()
    }
    
}



/// 스택 두 개를 사용해 removeFirst에서 O(n)의 시간 복잡도가 걸리는 것을 개선했다.
/// - Description
/// inbox는 enqueue에 대한 동작만을 수행한다.
/// outbox는 dequeue에 대한 동작만을 수행한다.
/// dequeue할 때 outbox가 비어있으면 inbox에 있는 것들의 resverse를 사용해 뒤집어서 outbox에 넣어준다.
/// outbox에서 popLast를 수행하면 O(1)의 시간 복잡도로 removeFirst를 수행할 수 있게 된다. Reversed 또한 O(1)의 시간 복잡도를 갖기 때문에
/// 상기의 Array Stack 보다 효율적임을 알 수 있다.
struct DoubleStackQueue<T> {
    private var inbox: [T] = []
    private var outbox: [T] = []
    
    var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        inbox.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.popLast()
    }
}
