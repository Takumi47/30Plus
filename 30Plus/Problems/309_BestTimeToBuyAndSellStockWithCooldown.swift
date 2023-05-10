//
//  309_BestTimeToBuyAndSellStockWithCooldown.swift
//  30Plus
//
//  Created by xander on 2023/5/11.
//

import Foundation

class Solution309 {
    static func runTest() {
        let t1 = (prices: [1,2,3,0,2], output: 3)
        let t2 = (prices: [1], output: 0)
        let t3 = (prices: [7,1,5,3,6,4], output: 5)
        [t1, t2, t3].forEach { t in
            let result = Xoo309_1().maxProfit(t.0)
            print("\(result)")
            if result != t.1 { print("❌❌❌❌❌\n") }
        }
    }
}

class Xoo309 {
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        var sold = -1_000    // Can't buy, Can't sell
        var holding = -1_000 // Can't buy, Can sell
        var cooldown = 0     // Can buy, Can't sell
        
        for i in 0..<n {
            let s = sold
            let h = holding
            let c = cooldown
            sold = h + prices[i]
            holding = max(h, c - prices[i])
            cooldown = max(c, s)
        }
        
        return max(sold, cooldown)
    }
}

// MARK: - 1. Dynamic Programming with State Machine

class Xoo309_1 {
    func maxProfit(_ prices: [Int]) -> Int {
        var sold = Int.min
        var held = Int.min
        var reset = 0
        for price in prices {
            let prevSold = sold
            sold = held + price
            held = max(held, reset - price)
            reset = max(reset, prevSold)
        }
        return max(sold, reset)
    }
}
