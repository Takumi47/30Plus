//
//  264_UglyNumberII.swift
//  30Plus
//
//  Created by xander on 2023/3/18.
//

import Foundation

class Solution264 {
    static func runTest() {
        let t1 = (n: 10, output: 12)
        let t2 = (n: 1, output: 1)
        let t3 = (n: 1690, output: 2123366400)
        [t1, t2, t3].forEach { t in
            let result = Xoo264_A().nthUglyNumber(t.0)
            print("\(result)")
            if result != t.1 { print("❌❌❌❌❌\n") }
        }
    }
}

// MARK: - Brute Force

class Xoo264 {
    func nthUglyNumber(_ n: Int) -> Int {
        let MAX = (1 << 31) - 1
        var nums: [Int] = []
        
        var a = 1
        while a < MAX {
            var b = a
            while b < MAX {
                var c = b
                while c < MAX {
                    nums.append(c)
                    c *= 5
                }
                b *= 3
            }
            a *= 2
        }
        nums.sort()
        return nums[n - 1]
    }
}

// MARK: - Dynamic Programming

class Xoo264_A {
    func nthUglyNumber(_ n: Int) -> Int {
        var nums: [Int] = [1]
        var (i, j, k) = (0, 0, 0)
        for _ in 1..<n {
            let next = min(nums[i] * 2, nums[j] * 3, nums[k] * 5)
            if next == nums[i] * 2 { i += 1 }
            if next == nums[j] * 3 { j += 1 }
            if next == nums[k] * 5 { k += 1 }
            nums.append(next)
        }
        return nums[n - 1]
    }
}
