//
//  151_ReverseWordsInAString.swift
//  30Plus
//
//  Created by xander on 2023/4/21.
//

import Foundation

class Solution151 {
    static func runTest() {
        let t1 = (s: "the sky is blue", output: "blue is sky the")
        let t2 = (s: "  hello world  ", output: "world hello")
        let t3 = (s: "a good   example", output: "example good a")
        let t4 = (s: "  Bob    Loves  Alice   ", output: "Alice Loves Bob")
        let t5 = (s: "Alice does not even like bob", output: "bob like even not does Alice")
        [t1, t2, t3, t4, t5].forEach { t in
            let result = Xoo151_A().reverseWords(t.0)
            print("\(result)")
            if result != t.1 { print("❌❌❌❌❌\n") }
        }
    }
}

class Xoo151 {
    func reverseWords(_ s: String) -> String {
        s.split(separator: " ")
            .reversed()
            .joined(separator: " ")
    }
}

class Xoo151_A {
    func reverseWords(_ s: String) -> String {
        let s = Array(" ".appending(s).appending(" "))
        let stack = Stack<String>()
        
        let n = s.count
        var word = ""
        for i in 1..<n {
            if s[i - 1] == " " && s[i] != " " {
                word = ""
            }
            
            if s[i] != " " {
                word.append(s[i])
            }
            
            if s[i - 1] != " " && s[i] == " " {
                stack.push(word)
            }
        }
        
        var res = ""
        while let word = stack.pop() {
            res.append(word)
            if !stack.isEmpty {
                res.append(" ")
            }
        }
        return res
    }
}
