//
//  5-J.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/11/30.
//

import Foundation

// baekjoon 1700 멀티탭 스케줄링

/**
 3구 멀티탭
 키보드
 헤어드라이기
 핸드폰 충전기
 디지털 카메라 충전기
 키보드
 헤어드라이기
 
 멀티탭 최대 100구
 총 사용횟수 100개
 
 플러그는 처음에 비어있다.
 
 포인터를 n개 생성해야해서 안 될듯
 
 */

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[1]
let k = input[0]
var a = readLine()!.split(separator: " ").map { Int($0)! }

var v: [Int] = []
var visited = Array(repeating: 0, count: 104)
var cnt = 0
var INF = 987654321


// 사용 횟수 n
for i in 0..<n {
    // 방문하지 않았다면(멀티탭에 없는 것)
    if visited[a[i]] == 0 {
        // 멀티탭의 갯수와 같다면
        if v.count == k {
            // 마지막 인덱스
            var lastIdx = 0
            // 지울 요소
            var pos: Int = 0
            // 멀티탭 요소 반복문
            for _a in v {
                // 가장 먼 미래에 참조될 요소 선택
                // 기본 값이 987654321이기 때문에 만약 요소가 안 나오면 가장 먼 미래에 있는 요소가 된다.
                var here_pick = INF
                
                // j는 멀티탭이 꽉찬 후 붙터의 인덱스
                for j in i+1..<n {
                    
                    // 멀티탭에 있는 요소가 미래에 나오는 인덱스
                    if _a == a[j] {
                        // 현재 요소가 미래에 나오는 인덱스 저장
                        here_pick = j
                        break
                    }
                }
                
                // 마지막 인덱스 보다 이번 인덱스가 크면
                if lastIdx < here_pick {
                    // 라스트 인덱스를 교체해준다.
                    lastIdx = here_pick
                    // 지워질 멀티탭 요소를 pos에 저장해준다.
                    pos = _a
                }
            }
            
            // 지울 요소의 방문처리를 0을 만들고
            visited[pos] = 0
            // 카운트를 올려준다.
            cnt += 1
            // 요소를 지워준다.
            v.remove(at: v.firstIndex(of: pos)!)
        }
        // 멀티탭 카운트가 적다면 요소를 push해주고
        v.append(a[i])
        // 방문 처리를 한다.
        visited[a[i]] = 1
    }
}

print(cnt)
