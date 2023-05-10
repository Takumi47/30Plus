//
//  67_AddBinary.swift
//  30Plus
//
//  Created by xander on 2023/5/11.
//

import Foundation

class Solution67 {
    static func runTest() {
        let t1 = (a: "11", b: "1", output: "100")
        let t2 = (a: "1010", b: "1011", output: "10101")
        let t3 = (a: "10100000100100110110010000010101111011011001101110111111111101000000101111001110001111100001101", b: "110101001011101110001111100110001010100001101011101010000011011011001011101111001100000011011110011", output: "110111101100010011000101110110100000011101000101011001000011011000001100011110011010010011000000000")
        [t1, t2, t3].forEach { t in
            let result = Xoo67_A().addBinary(t.0, t.1)
            print("\(result)")
            if result != t.2 { print("❌❌❌❌❌\n") }
        }
    }
}

class Xoo67 {
    func addBinary(_ a: String, _ b: String) -> String {
        var n = a.count - 1
        var m = b.count - 1
        let a = a.map(String.init)
        let b = b.map(String.init)
        
        var ans = ""
        var carry = "0"
        while n >= 0 || m >= 0 || carry == "1" {
            let x = n >= 0 ? (Int(a[n]) ?? 0) : 0
            let y = m >= 0 ? (Int(b[m]) ?? 0) : 0
            let c = Int(carry) ?? 0
            
            ans = "\(x ^ y ^ c)" + ans
            if c == 1 {
                carry = "\(x | y)"
            } else {
                carry = "\(x & y)"
            }
            
            n -= 1
            m -= 1
        }
        return ans
    }
}

class Xoo67_A {
    func addBinary(_ a: String, _ b: String) -> String {
        var a = a.compactMap { Int(String($0)) }
        var b = b.compactMap { Int(String($0)) }
        var carry = 0
        var res = ""
        
        while !a.isEmpty || !b.isEmpty || carry != 0 {
            let x = a.popLast() ?? 0
            let y = b.popLast() ?? 0
            carry += x + y
            res.append(String(carry % 2))
            carry >>= 1
        }
        return String(res.reversed())
    }
}

// MARK: - 1. Bit-by-Bit Computation

class Xoo67_1 {
    func addBinary(_ a: String, _ b: String) -> String {
        let m = a.count
        let n = b.count
        if m < n { return addBinary(b, a) }
        
        let a = Array(a)
        let b = Array(b)
        var res = ""
        var carry = 0
        var j = n - 1
        for i in (0..<m).reversed() {
            if a[i] == "1" { carry += 1 }
            if j >= 0 && b[j] == "1" { carry += 1 }
            j -= 1
            
            res.append((carry % 2 == 1) ? "1" : "0")
            carry >>= 1
        }
        
        if carry == 1 { res.append("1") }
        return String(res.reversed())
    }
}
