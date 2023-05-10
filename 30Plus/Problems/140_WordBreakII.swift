//
//  140_WordBreakII.swift
//  30Plus
//
//  Created by xander on 2023/5/11.
//

import Foundation

class Solution140 {
    static func runTest() {
        let t1 = (s: "catsanddog", wordDict: ["cat","cats","and","sand","dog"], output: ["cats and dog","cat sand dog"])
        let t2 = (s: "pineapplepenapple", wordDict: ["apple","pen","applepen","pine","pineapple"], output: ["pine apple pen apple","pineapple pen apple","pine applepen apple"])
        let t3 = (s: "catsandog", wordDict: ["cats","dog","sand","and","cat"], output: [String]())
        [t1, t2, t3].forEach { t in
            let result = Xoo140().wordBreak(t.0, t.1)
            print("\(result)")
            if Set(result) != Set(t.2) { print("❌❌❌❌❌\n") }
        }
    }
}

class Xoo140 {
    class TrieNode {
        var isWord = false
        var children: [TrieNode?] = Array(repeating: nil, count: 26)
    }
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        let root: TrieNode? = .init()
        for word in wordDict {
            var node = root
            for c in word {
                guard let n = node else { continue }
                let idx = index(of: c)
                if n.children[idx] == nil {
                    n.children[idx] = .init()
                }
                node = n.children[idx]
            }
            node?.isWord = true
        }
        
        var res: [String] = []
        var memo: [Bool] = Array(repeating: false, count: s.count) // isFailed
        _ = dfs(Array(s), 0, root, [], &memo, &res)
        return res
    }
    
    private func dfs(_ s: [Character], _ i: Int, _ root: TrieNode?, _ words: [String], _ memo: inout [Bool], _ res: inout [String]) -> Bool {
        let n = s.count
        guard i < n else {
            res.append(words.joined(separator: " "))
            return true
        }
        
        if memo[i] { return false }
        
        var word = ""
        var node = root
        var isValid = false
        for j in i..<n {
            word.append(s[j])
            let idx = index(of: s[j])
            guard let child = node?.children[idx] else { break }
            if child.isWord {
                if dfs(s, j + 1, root, words + [word], &memo, &res) {
                    isValid = true
                }
            }
            node = child
        }
        memo[i] = !isValid
        return isValid
    }
    
    private func index(of c: Character) -> Int {
        Int(c.asciiValue! - Character("a").asciiValue!)
    }
}
