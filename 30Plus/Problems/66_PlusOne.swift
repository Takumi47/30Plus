//
//  66_PlusOne.swift
//  30Plus
//
//  Created by xander on 2023/3/18.
//

import Foundation

class Solution66 {
    static func runTest() {
        let t1 = (digits: [1,2,3], output: [1,2,4])
        let t2 = (digits: [4,3,2,1], output: [4,3,2,2])
        let t3 = (digits: [9], output: [1,0])
        let t4 = (digits: [7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,0,6], output: [7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,0,7])
        let t5 = (digits: [9,9,9], output: [1,0,0,0])
        [t1, t2, t3, t4, t5].forEach { t in
            let result = Xoo66_A().plusOne(t.0)
            print("\(result)")
            if result != t.1 { print("❌❌❌❌❌\n") }
        }
    }
}

class Xoo66 {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        let n = digits.count
        for i in (0..<n).reversed() {
            if digits[i] == 9 {
                digits[i] = 0
            } else {
                digits[i] += 1
                return digits
            }
        }
        digits.insert(1, at: 0)
        return digits
    }
}

class Xoo66_A {
    func plusOne(_ digits: [Int]) -> [Int] {
        let n = digits.count
        var digits = digits
        var carry = 1
        
        for i in (0..<n).reversed() {
            let val = digits[i] + 1
            digits[i] = val % 10
            
            if val / 10 == 0 {
                carry = 0
                break
            }
        }
        
        if carry == 1 {
            digits.insert(1, at: 0)
        }
        return digits
    }
}
