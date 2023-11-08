//
//  4-J.swift
//  Algorithm
//  baekjoon 14391 종이조각 골드3
//  Created by Yong Jun Cha on 2023/11/08.
//

import Foundation

/**
 - Description
 우선 탐색한 곳을 탐색을 안 하려는 형태로 생각을 하면
 이 문제를 풀 수 없다.
 해당 문제는 모든 종이 찢는 경우의 수를 더해
 가장 큰 합을 가진 것을 출력하는 것이다.
 
 비트마스킹을 사용해 해당 부분을 가로로 찢었는지
 세로로 찢었는지 확인한 후 가로 0 세로 1.
 가로 부터 검사하다가 세로가 나오면 총 합에 더한다.
 세로부터 검사하다가 가로가 나오면 총 합에 더한다.
 최대 4x4의 범위를 비트마시킁으로 나타내준다.
 
 설령 이런 아이디어를 얻었다고 해서
 가로 세로 검사하는 로직 구현이 쉬운 것이 아니었다.
 
 */
var a = [[Int]]()
var n = 0
var m = 0
var ret = 0

func calculateMaxSum(_ s: Int) -> Int {
    // 합
    var sum = 0
    // 가로에서 0을 체크하는 로직 (가로체크)
    for i in 0..<n {
        var cur = 0
        for j in 0..<m {
            let k = i * m + j
            if (s & (1 << k)) == 0 {
                // 세로운 것을 찾으면 기존 것에 10을 곱하고 새로운 것을 더해준다.
                // 원래 7이었는데 6을 발견한다면 7 * 10을해서 70을 만들고 6을 더해 76을 만든다.
                cur = cur * 10 + a[i][j]
            } else {
                // 가로가 아닌 세로다 이럴 떄는 값을 더해준다.
                sum += cur
                // 초기화
                cur = 0
            }
        }
        // 끝까지 가로가 없던 경우
        sum += cur
    }
    
    // 해당 부분은 m을 위에 써서 세로로 탐색을 한다.
    for j in 0..<m {
        var cur = 0
        for i in 0..<n {
            // 인덱스를 구하는 로직
            // 비트가 n*m이고 범위의 일 부분인 i와 j를 곱한 것에
            // j번 째 인자를 대입하면 된다.
            let k = i * m + j
            // 세로체크 (1이 있는지 없는지 체크한다)
            if (s & (1 << k)) != 0 {
                cur = cur * 10 + a[i][j]
            } else {
                sum += cur
                cur = 0
            }
        }
        sum += cur
    }
    return sum
}

if let input = readLine() {
    let inputArray = input.components(separatedBy: " ").compactMap { Int($0) }
    n = inputArray[0]
    m = inputArray[1]
    
    for _ in 0..<n {
        if let row = readLine() {
            let rowData = row.compactMap { Int(String($0)) }
            a.append(rowData)
        }
    }
    
    for s in 0..<(1 << (n * m)) {
        let sum = calculateMaxSum(s)
        // 최댓값 구한다.
        ret = max(ret, sum)
    }
    // 최댓값 출력
    print(ret)
}
