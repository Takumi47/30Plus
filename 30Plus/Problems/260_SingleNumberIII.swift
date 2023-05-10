//
//  260_SingleNumberIII.swift
//  30Plus
//
//  Created by xander on 2023/5/11.
//

import Foundation

class Solution260 {
    static func runTest() {
        let t1 = (nums: [1,2,1,3,2,5], output: [3,5])
        let t2 = (nums: [-1,0], output: [-1,0])
        let t3 = (nums: [0,1], output: [1,0])
        [t1, t2, t3].forEach { t in
            let result = Xoo260_1().singleNumber(t.0)
            print("\(result)")
            if Set(result) != Set(t.1) { print("❌❌❌❌❌\n") }
        }
    }
}

// MARK: - 1. Hashmap

class Xoo260_1 {
    func singleNumber(_ nums: [Int]) -> [Int] {
        var map: [Int: Int] = [:]
        for num in nums {
            map[num, default: 0] += 1
        }
        var res: [Int] = []
        for (k, v) in map {
            if v == 1 {
                res.append(k)
            }
        }
        return res
    }
}
