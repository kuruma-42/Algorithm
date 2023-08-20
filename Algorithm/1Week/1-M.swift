//
//  1-M.swift
//  Algorithm
//  BaekJoon 3986
//  Created by Yong Jun Cha on 2023/03/03.
//

/**
 ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 팰린드롬의 응용 같지만 단순히 팰린드롬을 풀었던 방법과는 다른 방법으로 접근해야한다.
 '좋은 단어'란 아치형 곡선으로 단어의 위에서 단어와 단어 사이를 '교차 없이' 짝 지을 수 있는 게 좋은 단어이다.
 '교차 없이' 교차가 없는 조건을 정해야 한다.
 
 교차가 없을 조건은
 - 앞 뒤의 단어가 적어도 하나는 현재 자신과 같아야 한다.
 - 같은 단어가 3개 이상 중복되면 교차가 발생한다.
 - 단어의 갯수가 홀수개일 교차가 반드시 일어나기 때문에 짝수일 때를 찾아야 한다.
 
 
 ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
 상기의 생각을 열심히 해봤지만
 자료구조로 푸는 문제였다.
 발상의 전환을 해야한다.
 
 무언가 순차로 들어오다 짝이 맞고, 그 것을 제거하는 형태의 문제면
 스택을 사용해서 푸는 것이 가장 좋다.
 
 String인덱스를 찾아서 For문을 돌리는 것 보다 ForEach가 편했고
 입력에서 최대한 로직을 간다하게 해서 입력 시간을 아껴야 한다.
 
 스택을 직접 구현해봤는데, 손으로 쓸 수 있을 정도로 외워야겠다.
 */


public struct Stack<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: T) {
        return array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public var top: T? {
        return array.last
    }
}

var input = Int(readLine()!)!
var wordArray: [String] = []
var goodWordCount: Int = 0

for _ in 0..<input {
    let words = readLine()!
    var stack = Stack<Character>()
    
    words.forEach {
        if !stack.isEmpty && stack.top == $0 {
            stack.pop()
        } else {
            stack.push($0)
        }
    }
    if stack.count == 0 {
        goodWordCount += 1
    }
}

print("\(goodWordCount)")

