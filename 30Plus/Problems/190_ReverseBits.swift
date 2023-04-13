//
//  190_ReverseBits.swift
//  30Plus
//
//  Created by xander on 2023/4/13.
//

import Foundation

class Solution190 {
    static func runTest() {
        let t1 = (n: 0b00000010100101000001111010011100, output: 964176192) // 00111001011110000010100101000000
        let t2 = (n: 0b11111111111111111111111111111101, output: 3221225471) // 10111111111111111111111111111111
        [t1, t2].forEach { t in
            let result = Xoo190_1().reverseBits(t.0)
            print("\(result)")
            if result != t.1 { print("❌❌❌❌❌\n") }
        }
    }
}

// MARK: - 1. Bit by Bit

class Xoo190_1 {
    func reverseBits(_ n: Int) -> Int {
        var n = n
        var res = 0
        var power = 31
        while n != 0 {
            res += (n & 1) << power
            n >>= 1
            power -= 1
        }
        return res
    }
}
