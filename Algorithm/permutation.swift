//
//  permutation.swift
//  Algorithm
//
//  Created by Yong Jun Cha on 2022/11/09.
//

import Foundation

//정수 한 개 입력
private let input = Int(readLine() ?? "")!
var data = [1,2,3]

func perm(_ k: Int) {
    if k == data.count {
        print(data)
        return
    }

    for i in k..<data.count {
        data.swapAt(k, i)  // swap 하면서 k를 선택한 것이 된다.
        perm(k+1)
        data.swapAt(k, i)  // 순열을 돌고나서 다시 원위치 시켜줘야한다.
    }
}
