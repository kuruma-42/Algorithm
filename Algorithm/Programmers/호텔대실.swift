//
//  호텔 대실.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 9/2/24.
//

import Foundation

func solution(_ book_time:[[String]]) -> Int {
    var bookTime: [(Int, Int)] = []
    var rooms: [(Int, Int)] = []
    
    for book in book_time {
        let s = book[0].components(separatedBy: ":")
        let e = book[1].components(separatedBy: ":")
        // 초로 전환
        let startTime = Int(s[0])!*60 + Int(s[1])!
        let endTime = Int(e[0])!*60 + Int(e[1])! + 10
        
        bookTime.append((startTime, endTime))
    }
    
    // 시작 시간이 낮은 순서대로 정렬
    bookTime.sort(by: {
        $0.0 < $1.0
    })
    
    // 예약 순서대로 반복문
loop1: for book in bookTime {
    // 룸 인덱스와 룸 값이 나온다
    for (i, room) in rooms.enumerated() {
        // 룸의 시작 시간과 끝나는 시간 사이에 방의 시작 시간이 없다면
        // rooms[i] = 예약이 된다.
        if !(room.0..<room.1 ~= book.0) {
            rooms[i] = book
            continue loop1
        }
    }
    // 룸의 시작 시간과 끝나는 시간과 끝나는 시간 사이에 방이 있다면
    // 새로운 방이 예약이 된다.
    rooms.append((book.0, book.1))
}
    return rooms.count
}
