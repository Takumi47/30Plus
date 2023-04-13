//
//  1344_AngleBetweenHandsOfAClock.swift
//  30Plus
//
//  Created by xander on 2023/4/13.
//

import Foundation

class Solution1344 {
    static func runTest() {
        let t1 = (hour: 12, minutes: 30, output: 165.0)
        let t2 = (hour: 3, minutes: 30, output: 75.0)
        let t3 = (hour: 3, minutes: 15, output: 7.5)
        [t1, t2, t3].forEach { t in
            let result = Xoo1344_1().angleClock(t.0, t.1)
            print("\(result)")
            if result != t.2 { print("❌❌❌❌❌\n") }
        }
    }
}

// MARK: - 1. Math

class Xoo1344_1 {
    func angleClock(_ hour: Int, _ minutes: Int) -> Double {
        let (angleOneMin, angleOneHour) = (6.0, 30.0)
        let angleMins = Double(minutes) * angleOneMin
        let angleHour = (Double(hour % 12) + Double(minutes) / 60.0) * angleOneHour
        let diff = abs(angleMins - angleHour)
        return min(diff, 360 - diff)
    }
}
