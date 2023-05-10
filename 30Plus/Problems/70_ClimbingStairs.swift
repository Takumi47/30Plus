//
//  70_ClimbingStairs.swift
//  30Plus
//
//  Created by xander on 2023/5/11.
//

import Foundation

class Solution70 {
    static func runTest() {
        let t1 = (n: 2, output: 2)
        let t2 = (n: 3, output: 3)
        [t1, t2].forEach { t in
            let result = Xoo70_3().climbStairs(t.0)
            print("\(result)")
            if result != t.1 { print("❌❌❌❌❌\n") }
        }
    }
}

// MARK: - 1. Brute Force

class Xoo70_1 {
    func climbStairs(_ n: Int) -> Int {
        climb(0, n)
    }
    
    private func climb(_ i: Int, _ n: Int) -> Int {
        if i > n { return 0 }
        if i == n { return 1 }
        return climb(i + 1, n) + climb(i + 2, n)
    }
}

// MARK: - 2. Recursion with Memoization

class Xoo70_2 {
    func climbStairs(_ n: Int) -> Int {
        var memo: [Int] = Array(repeating: 0, count: n + 1)
        return dp(n, &memo)
    }
    
    private func dp(_ n: Int, _ memo: inout [Int]) -> Int {
        guard n > 2 else { return n }
        if memo[n] == 0 {
            memo[n] = dp(n - 1, &memo) + dp(n - 2, &memo)
        }
        return memo[n]
    }
}

// MARK: - 3. Dynamic Programming

class Xoo70_3 {
    func climbStairs(_ n: Int) -> Int {
        guard n > 2 else { return n }
        var dp1 = 1
        var dp2 = 2
        for _ in 3...n {
            let dp = dp1 + dp2
            dp1 = dp2
            dp2 = dp
        }
        return dp2
    }
}

// MARK: - 4. Fibonacci Number

class Xoo70_4 {
    func climbStairs(_ n: Int) -> Int {
        if n == 1 { return 1 }
        var a = 1
        var b = 1
        for _ in 2...n {
            let c = a + b
            a = b
            b = c
        }
        return b
    }
}
