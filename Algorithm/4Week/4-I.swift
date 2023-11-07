//
//  4-I.swift
//  Algorithm
//  baekjoon 11723 집합
//  Created by Yong Jun Cha on 2023/11/07.
//

import Foundation

/**
 구현 문제
 20개의 정수 1 - 20이 쓰였는지 안 쓰였는지에 0 1의 조건으로 연산할 수 있다.
 비트 연산으로 크고 끄기를 반복하면 될 것 같다.
 실제로 집합에 넣을 필요도 없을 것 같다.
 
 시간초과가 너무 심하게나서
 FileIO까지 사용했지만 시간초과를 막을 수 없었다.
 결국 '라이노'라는 사람이 이 문제를 풀기위해
 FileIO를 커스텀한 것을 이용해 입력을 더욱 빠르게 받도록 바꿨다.
 문자열을 byte로 받고 모든 바이트를 더한 byte sum이라는 것을 사용해
 입력을 받는 방법을 택했다.
 
 //"add"
 // 297

 //"remove"
 // 654

 //"check"
 // 510

 //"all"
 // 313

 //"empty"
 // 559

 //"toggle"
 // 642

 */

var file = FileIOByte()

var n = file.readInt()
var bit = 0
var result = ""

while n != 0{
    switch file.readStirngSum(){
    case 297:
        bit |= (1 << file.readInt())
    case 654:
        bit &= ~(1 << file.readInt())
    case 510:
        
        if (bit & (1 << file.readInt()) != 0){
            result.append("1\n")
        }else{
            result.append("0\n")
        }
    case 642:
        bit ^= (1 << file.readInt())
    case 313:
        bit |= (~0)
    case 559:
        bit &= 0
    default:
        break
    }
    n -= 1
}
print(result)

