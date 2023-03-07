//
//  957_PrisonCellsAfterNDays.swift
//  30Plus
//
//  Created by xander on 2023/3/7.
//

import Foundation

class Solution957 {
    static func runTest() {
        let t1 = (cells: [0,1,0,1,1,0,0,1], n: 7, output: [0,0,1,1,0,0,0,0])
        let t2 = (cells: [1,0,0,1,0,0,1,0], n: 1000000000, output: [0,0,1,1,1,1,1,0])
        [t1, t2].forEach { t in
            let result = Xoo957().prisonAfterNDays(t.0, t.1)
            print("\(result)")
            if result != t.2 { print("❌❌❌❌❌\n") }
        }
    }
}

class Xoo957 {
    func prisonAfterNDays(_ cells: [Int], _ n: Int) -> [Int] {
        var map: [Int: Int] = [:]
        let k0 = (0..<8).reduce(0) { $0 | (cells[$1] << $1) }
        var days = 0
        var k = k0
        while map[k] == nil {
            if days == n { break }
            map[k] = days
            days += 1
            k = ~((k >> 1)^(k << 1)) & 0b1111110
        }
        if days != n, let start = map[k] {
            let count = days - start
            for _ in 0..<(n - start) % count {
                k = ~((k >> 1)^(k << 1)) & 0b1111110
            }
        }
        return (0..<8).map { (k >> $0) & 1 }
    }
}
