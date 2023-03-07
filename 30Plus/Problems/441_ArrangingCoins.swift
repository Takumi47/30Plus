//
//  441_ArrangingCoins.swift
//  30Plus
//
//  Created by xander on 2023/3/7.
//

import Foundation

class Solution441 {
    static func runTest() {
        let t1 = (n: 5, output: 2)
        let t2 = (n: 8, output: 3)
        let t3 = (n: 2147483647, output: 65535)
        [t1, t2, t3].forEach { t in
            let result = Xoo441_2().arrangeCoins(t.0)
            print("\(result)")
            if result != t.1 { print("❌❌❌❌❌\n") }
        }
    }
}

// MARK: - 1. Binary Search

class Xoo441_1 {
    func arrangeCoins(_ n: Int) -> Int {
        var lo = 1
        var hi = n
        while lo < hi {
            let k = lo + (hi - lo + 1) / 2
            let val = k * (k + 1) / 2
            if val <= n {
                lo = k
            } else {
                hi = k - 1
            }
        }
        return lo
    }
}

// MARK: - 2. Math (Completing the square) (配方法)

class Xoo441_2 {
    
    /*
     1. k*(k + 1) <= 2*n
     
     2. (k + 1/2)^2 - 1/4 <= 2*n
     
     3. k <= sqrt(2*n + 1/4) - 1/2
     */
    func arrangeCoins(_ n: Int) -> Int {
        Int(sqrt(Double(2 * n) + 0.25) - 0.5)
    }
}
