//
//  bitMasking.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2023/10/03.
//

import Foundation

/**
 불리언 배열의 역할을 하는 "하나의 숫자"를 만들어서
 "비트 연산자"를 통해 탐색, 수정등을 하는 것을 비트 마스킹이라고 한다.
 
 컴퓨터의 저장 공간인 메모리에는 0이나 1이 저장된다.
 이러한 메모리의 용량을 표현하는 단위는 여러가지가 있는데 그 중 최소 단위를 비트(Bit)라고 하며 이 비트는 0 또는 1이라는 값을 가진다.
 이를 기반으로 해당 비트를 켜거나(1로 만들거나) 끄거나(0으로 만들거나) 하는 "마스킹"하기 때문에 비트마스킹이라고 합니다.

 참고로 비트는 이진수의 약어다. 비트나 이진수나 똑같은 개념이라고 보면 된다. (BIT = Binary Digit)
 
 비트마스킹은 한계가 존재한다. 바로 31까지 가능하다.
 int형 숫자의 한계까지인 셈이다.
 */

// 특정 idx의 비트를 끄고 싶을 때
// 10010
var S = 18
// 끄고 싶은 비트의 인덱스
var idx = 1
// 하기의 코드를 외워야 함
S &= ~(1 << idx) // 10010 AND 11101 => 10000
print("\(S)")


/**
 idx번째 비트 XOR 연산(0은 1로, 1은 0으로) toggle
 10010 XOR 00010 = 10000 -> 10001 XOR 00010 10010
 */
S ^= (1<<idx)
print("\(S)")

/**
 최하위 켜져있는 비트 찾기
 최하위 비트란 오른쪽 부터 탐색해서 처음 1이 있는 경우이다
 0001000 4번째가 최하위 비트이다.
 S = 10010
 -S = ~(S+1)
 S = 0010010
 -S = 1101110
 S & -S  = 000010
 */
idx = (S & -S)
print("\(S)") // 2 최하위 요소 000010

/**
 크기가 n인 집합의 모든 비트를 켜기
 0 0 0 0 네 명의 모든 친구가 당구장을 가게 만들기
 0은 안 가고 1은 가는 것이고
 1010 두 명이 가기로 했는데 4명 다 가게 만들기
 
 16 = ( 1<<4) -> 10000
 (1<<4) - 1 = 1111
 */

var n = 5
print("\((1 << n) - 1)")


/**
 idx 번 째의 비트를 켜기
 10010 (18)
 10011 로 마지막 비트를 켜고 싶다.
 */
S |= (1 << idx)


/**
 idx번 째의 비트가 켜져있는지 확인하기
 10010
 01000
 & 연산
 00000
 
 10010
 10000
 & 연산
 10000 16
 */

if ((S & (1 << idx )) != 0) {
    print("해당 idx: \(idx)가 켜져있습니다.")
} else {
    print("해당 idx: \(idx)가 꺼져있습니다.")
}

/**
 비트마스킹을 이용한 경우의 수
 
 ```
 #include <bits/stdc++.h>
 using namespace std;
 const int n = 4;
 int main() {
     string a[n] = {"사과", "딸기", "포도", "배"};
     for(int i = 0; i < (1 << n); i++){
         string ret = "";
         for(int j = 0; j < n; j++){
             if(i & (1 << j)){
                 ret += (a[j] + " ");
             }
         }
         cout << ret << '\n';
     }
     return 0;
 }
 
 사과
 딸기
 사과 딸기
 포도
 사과 포도
 딸기 포도
 사과 딸기 포도
 배
 사과 배
 딸기 배
 사과 딸기 배
 포도 배
 사과 포도 배
 딸기 포도 배
 사과 딸기 포도 배


 ```
 */
