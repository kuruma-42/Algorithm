//
//  3-E.swift
//  Algorithm
//  baekjoon 12869
//  Created by Yong Jun Cha on 2023/09/01.
//

import Foundation
/**
 - Description
 > 최소값을 구해야한다고 해서 bfs로 풀어야겠다는 생각은 했다.
 그렇지만 실제 SCV의 체력을 배열에서 깎는 선택은 하면 안 된다.
 
 n마리의 SCV의 체력을(최대 60)을 가정하고
 n마리의 SCV의 체력을 좌표라고 생각하면 약 60 x 60 x 60 정도의 방문좌표가 나온다.
 거기서 60에서 에러를 방지하기 위해 4칸 정도의 여분을 주고 배열을 생성한다.
 
 여기서 중요한 부분은 SCV에게 공격을 하는 방밥을 정할 수 있다는 것이다.
 뮤탈리스크의 한 번의 공격은 SCV세 마리에게 9,3,1 순서로 데미지를 입힌다.
 
 ** 가장 중요한 부분은 hint 쪽에서 공격 방법을 정할 수 있다는 것인데
 힌트가 문제를 푸는데 제일 중요하고 심지어 고려하지 않으면 잘못된 생각을 한다.
 잘못된 문제 풀이 방식은 하단에 존재한다.
 
 공격 순서를 정하면 하기와 같은 6가지의 경우가 생긴다.
 
 var _a[6][3] = {
     {9, 3, 1},
     {9, 1, 3},
     {3, 1, 9},
     {3, 9, 1},
     {1, 3, 9},
     {1, 9, 3}
 }
 
 dfs, bfs를 좌표에서 할 때 사방을 탐색하던 것을 생각해보면
 
 3차원 자표를 6방으로 탐색한다는 생각을 하면 된다.
 이 생각을 하기가 정말 힘들다.
 */

var n = Int(readLine()!)!
var a = Array(repeating: 0, count: 3)
var SCV = readLine()!.split(separator:" ").map { Int($0)! }
var visit = Array(repeating: Array(repeating: Array(repeating: 0, count: 64), count: 64), count: 64)

// 이게 6방 탐색을 한다고 생각하면 된다.
var _a = [
    [9, 3, 1],
    [9, 1, 3],
    [3, 1, 9],
    [3, 9, 1],
    [1, 3, 9],
    [1, 9, 3]
]

var q: [[Int]] = []

for i in 0..<n {
    a[i] = SCV[i]
}

func solve(a: Int, b: Int, c: Int) -> Int {
    visit[a][b][c] = 1
    q.append([a,b,c])
    while !q.isEmpty {
        var a = q.first![0]
        var b = q.first![1]
        var c = q.first![2]
        q.removeFirst()
        // 세 개의 SCV의 체력이 0인 경우
        if a == 0 && b == 0 && c == 0{
            break
        }
        for i in 0..<6 {
            let na = max(0, a - _a[i][0])
            let nb = max(0, b - _a[i][1])
            let nc = max(0, c - _a[i][2])
            
            if visit[na][nb][nc] != 0 {
                continue
            }
            visit[na][nb][nc] = visit[a][b][c] + 1
            q.append([na, nb, nc])
        }
    }
    return visit[0][0][0] - 1
}

print("\(solve(a: a[0], b: a[1], c: a[2]))")










/**
 - Description
 뮤탈리스크
 첫 번째로 공격받는 SCV는 체력 9를 잃는다.
 두 번째로 공격받는 SCV는 체력 3을 잃는다.
 세 번째로 공격받는 SCV는 체력 1을 잃는다.
 
 SCV 마리 수 체력이 각각 주어지는데
 최소 몇 번 공격해야하는지 찾으시오
 
 bfs로 풀어야 하고 총 세 번 방문하면
 끊어야 한다.
 
 */

var damage = [9, 3, 1]
var cnt = 0
var ret = 0
var dead = 0
var attackCnt = 0
var visited = Array(repeating: 0, count: n)

print("n: \(n)")
print("SCV :: \(SCV)")

attack()

/// 이렇게 짜면 최대 효율은 안 나옴
/// 예를 들면 체력이 많은 SCV 부터 데미지 9를 맞춘다면 최소 1-2번의 공격을 최소화 할 수 있다.
/// 그래서 예시 1 번과 2번이 차이가 난다.
/// Sorted로 풀려고 해도 완벽하게 맞지는 않는다.
/// 줄여봤자 1번 정도의 공격을 줄일 수 있다.
/// Hint를 살펴보면 꽤 정교하게 맞춰야 2번이 나온다.
/// 1, 3, 2 순서대로 공격을 하면, 남은 체력은 (12-9, 10-1, 4-3) = (3, 9, 1)이다. 2, 1, 3 순서대로 공격을 하면, 남은 체력은 (0, 0, 0)이다.
func attack() {
    // 리턴 값 카운트 추가
    while dead != n {

        print("SCV RET :: \(SCV)")
        // 방문 초기화
        visited = Array(repeating: 0, count: n)
        // 죽은 SCV 개체 수 초기화
        dead = 0
        // 공격 횟수 초기화
        cnt = 0

        // SCV의 수는 최대 3개이다.
        SCV = SCV.sorted { $0 > $1 }

        for i in 0..<n {

            // 한 번의 공격에 SCV는 여러 번 공격받지 않는다.
            if visited[i] != 0 {
                continue
            }

            // SCV 죽은 상태
            if SCV[i] <= 0 {
                dead += 1
                print("dead :: \(i)")
                continue
            }

            // SCV 공격로직
            SCV[i] = SCV[i] - damage[cnt]

            // 방문 처리
            visited[i] = 1

            // 공격 횟수
            cnt += 1

            // 공격 세 번이면 브레이크
            if cnt == 3 {
                break
            }

        }
        ret += 1
    }
    print("ret :: \(ret - 1)")

}
