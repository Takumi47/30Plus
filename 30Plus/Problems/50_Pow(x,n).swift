//
//  50_Pow(x,n).swift
//  30Plus
//
//  Created by xander on 2023/4/21.
//

import Foundation

class Solution50 {
    static func runTest() {
        let t1 = (x: 2.00000, n: 10, output: 1024.00000)
        let t2 = (x: 2.10000, n: 3, output: 9.26100)
        let t3 = (x: 2.00000, n: -2, output: 0.25000)
        [t1, t2, t3].forEach { t in
            let result = String(format: "%.5f", Xoo50_3().myPow(t.0, t.1))
            print("\(result)")
            if result != String(format: "%.5f", t.2) { print("❌❌❌❌❌\n") }
        }
    }
}

// MARK: - 1. Brute Force

class Xoo50_1 {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var x = x
        var n = n
        if n < 0 {
            x = 1 / x
            n = -n
        }
        
        var res = 1.0
        for _ in 0..<n {
            res *= x
        }
        return res
    }
}

// MARK: - 2. Fast Power Algorithm Recursive

class Xoo50_2 {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var x = x
        var n = n
        if n < 0 {
            x = 1 / x
            n = -n
        }
        
        return fastPow(x, n)
    }
    
    /// Time complexity: O(log N)
    private func fastPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 { return 1.0 }
        
        let a = fastPow(x, n / 2)
        if n % 2 == 0 {
            return a * a
        } else {
            return a * a * x
        }
    }
}

// MARK: - 3. Fast Power Algorithm Iterative

class Xoo50_3 {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var x = x
        var n = n
        if n < 0 {
            x = 1 / x
            n = -n
        }
        
        return fastPow(x, n)
    }
    
    /// Time complexity: O(log N)
    private func fastPow(_ x: Double, _ n: Int) -> Double {
        var res = 1.0
        var x = x
        var n = n
        while n > 0 {
            if n % 2 == 1 { res *= x }
            x *= x
            n >>= 1
        }
        return res
    }
}
