//
//  1-N.swift
//  Algorithm
//  BaekJoon 1629
//  Created by Yong Jun Cha on 2023/03/08.
//

/**
 2,147,483,647 이하의 자연수
 (a*b)%c = a%c * a%c
 상기의 두 가지 개념을 가지고 접근해야하고
 입력이 크기 때문에 반복문으로 돌리기 보다는 log(n)이 나오게 풀어야 한다.
 그리고 +,-,* 연산은 CPU 연산의 부하가 적지만 나누기 연산은 부하가 크다.
 나누기 연산이 이 많이 들어가거나 반복문에 들어갈 때는 조심해야한다.
 정답일 수 도 있지만, 정답이 아니거나 런타임 에러가 나는 경우에는 나눗셈을 줄이는 방법을 생각해봐야 한다.
 */

var input = readLine()!.split(separator: " ").map { CLongLong($0)! }

var a = input[0]
var b = input[1]
var c = input[2]


func go(a: CLongLong, b: CLongLong) -> CLongLong {
    if b == 1 {
        return a % c
    }
    
    var result = go(a: a, b: b/2)
    result = (result * result) % c
    
    if b % 2 != 0{
        result = (result * a) % c
    }
    return result
}

print("\(go(a: a, b: b))")
