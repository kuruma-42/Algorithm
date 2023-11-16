//
//  4-M.swift
//  Algorithm
//  baekjoon 14450 피카츄
//  Created by Yong Jun Cha on 2023/11/16.
//

import Foundation

// baekjoon 14450 피카츄

/**
 pi ka chu
 우선 부르트 포스로 pi ka. chu 모든 문자열을 탐색
 알파벳이 26개 비트마스킹을 쓴다 ?
 ex)
 i가 들어왔을 때 이전에 p가 켜있으면 넘어간다.
 a가 들어와있을 때 이전에 k가 켜있으면 넘어간다.
 h가 들어와 있을 때 이전에 c가 있으면 넘어간다.
 u가 들어와있을 때 이전에 h가 있으면 넘어간다.
 
 다른 알파벳 pikachu를 제외한 알파벳이 들어오면 NO를 출력한다.
 p = 15 번째
 i = 8
 k = 10
 a = 0
 c = 2
 h = 7
 u = 20
 */
var input = readLine()!
var t = Array(input).map { String($0) }
var bit = 0
var temp = ""
var isNo: Bool = false

for i in 0..<t.count {
    isNo = false
    let c = UnicodeScalar(t[i])!.value - 97

    // p, i, k, a, c, h, u
    if c == 15 || c == 8 || c == 10 || c == 0 || c == 2 || c == 7 || c == 20 {


        if c == 15 || c == 10 || c == 2 {
            if bit == 0 {
                // pkc가 중복 되었는지 체크
                if bit & (1 << c) != 0 {
                    // p가 중복 되었다면 pp
                    isNo = true
                    break
                } else {
                    // pkc의 비트를 켠다.
                    bit |= (1 << c)
                }
            } else {
                // pkc 중 하나가 먼저 들어와 있는 경우
                isNo = true
                break
            }
        } else {

            if t[i] == "i" {
                // p가 있다면 bit 초기화하고 넘어간다.
                if bit & (1 << 15) != 0 {
                    bit = 0
                    continue
                } else {
                    // i만 따로 들어온 경우다.
                    isNo = true
                    break
                }
            } else if t[i] == "a" {
                // k가 있다면 bit 초기화하고 넘어간다.
                if bit & (1 << 10) != 0 {
                    bit = 0
                    continue
                } else {
                    // i만 따로 들어온 경우다.
                    isNo = true
                    break
                }
            } else if t[i] == "h" {
                // c가 있다면 bit h 비트를 키고 넘어간다.
                if bit & (1 << 2) != 0 {

                    // h 중복을 막아 chhu를 막기 위해
                    if bit & (1 << c) != 0 {
                        // h가 중복된 경우
                        isNo = true
                        break
                    } else {

                        // h로 끝난 경우 pikach
                        if i == t.count - 1 {
                            isNo = true
                            break
                        } else {
                            // 비트를 켠다
                            bit |= (1 << c)
                        }
                    }

                } else {
                    // h만 따로 들어온 경우다.
                    isNo = true
                    break
                }
            }
            else if t[i] == "u" {
                // h가 있다면 bit 초기화하고 넘어간다.
                if bit & (1 << 2) != 0  && bit & (1 << 7) != 0{
                    bit = 0
                    continue
                } else {
                    // i만 따로 들어온 경우다.
                    isNo = true
                    break
                }
            }
        }
    } else {
        isNo = true
        break
    }



}

if isNo {
    print("NO")

} else {
    // 위에서 검증을 다 한 후 물리적으로 pi ka chu를 지워준다.
    // 위에서 검증만 하고 YES 를 출력했을 때는 예외 상황을 못 찾아냈음
    input = input.replacingOccurrences(of: "pi", with: "")
    input = input.replacingOccurrences(of: "ka", with: "")
    input = input.replacingOccurrences(of: "chu", with: "")
    
    if input == "" {
        print("YES")
    } else {
        print("NO")
    }
}
