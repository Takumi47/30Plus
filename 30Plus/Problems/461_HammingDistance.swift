//
//  461_HammingDistance.swift
//  30Plus
//
//  Created by xander on 2023/3/18.
//

import Foundation

class Solution461 {
    static func runTest() {
        let t1 = (x: 1, y: 4, output: 2)
        let t2 = (x: 3, y: 1, output: 1)
        [t1, t2].forEach { t in
            let result = Xoo461().hammingDistance(t.0, t.1)
            print("\(result)")
            if result != t.2 { print("❌❌❌❌❌\n") }
        }
    }
}

// MARK: - Brian Kernighan's Algorithm

/*
 Turn off rightmost 1-bit
 => x & (x - 1)
 */

class Xoo461 {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var xor = x ^ y
        var distance = 0
        while xor != 0 {
            distance += 1
            xor = xor & (xor - 1)
        }
        return distance
    }
}
