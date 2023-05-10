//
//  258_AddDigits.swift
//  30Plus
//
//  Created by xander on 2023/5/11.
//

import Foundation

class Solution258{
    static func runTest() {
        let t1 = (num: 38, output: 2)
        let t2 = (num: 0, output: 0)
        let t3 = (num: 2147483647, output: 1)
        [t1, t2, t3].forEach { t in
            let result = Xoo258_B().addDigits(t.0)
            print("\(result)")
            if result != t.1 { print("❌❌❌❌❌\n") }
        }
    }
}

class Xoo258 {
    func addDigits(_ num: Int) -> Int {
        var num = num
        
        while num / 10 != 0 {
            var digit = num % 10
            repeat {
                num /= 10
                digit += num % 10
            } while num / 10 != 0
            
            if digit / 10 != 0 {
                num = digit
            } else {
                return digit
            }
        }
        
        return num
    }
}

class Xoo258_A {
    func addDigits(_ num: Int) -> Int {
        var num = num
        var res = num
        
        while num >= 10 {
            res = 0
            while num > 0 {
                res += num % 10
                num /= 10
            }
            if res >= 10 {
                num = res
            }
        }
        
        return res
    }
}

// MARK: - 1. Mathematical: Digital Root

/*
 10 = 9*1 + 1
 100 = 9*11 + 1
 1000 = 9*111 + 1
 */

/** The original number is divisible by 9 if and only if the sum of its digits is divisible by 9. */
class Xoo258_1 {
    func addDigits(_ num: Int) -> Int {
        if num == 0 { return 0 }
        if num % 9 == 0 { return 9 }
        return num % 9
    }
}

class Xoo258_B {
    func addDigits(_ num: Int) -> Int {
        num == 0 ? 0 : 1 + (num - 1) % 9
    }
}
