//
//  79_WordSearch.swift
//  30Plus
//
//  Created by xander on 2023/5/11.
//

import Foundation

class Solution79 {
    static func runTest() {
        let t1 = (board: [[Character("A"),"B","C","E"],["S","F","C","S"],["A","D","E","E"]], word: "ABCCED", output: true)
        let t2 = (board: [[Character("A"),"B","C","E"],["S","F","C","S"],["A","D","E","E"]], word: "SEE", output: true)
        let t3 = (board: [[Character("A"),"B","C","E"],["S","F","C","S"],["A","D","E","E"]], word: "ABCB", output: false)
        [t1, t2, t3].forEach { t in
            let result = Xoo79_1().exist(t.0, t.1)
            print("\(result)")
            if result != t.2 { print("❌❌❌❌❌\n") }
        }
    }
}

class Xoo79 {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let m = board.count
        let n = board[0].count
        var board = board
        let word = Array(word)
        for i in 0..<m {
            for j in 0..<n {
                if search(&board, word, i, j, 0) {
                    return true
                }
            }
        }
        return false
    }
    
    private func search(_ board: inout [[Character]], _ word: [Character], _ i: Int, _ j: Int, _ d: Int) -> Bool {
        let m = board.count
        let n = board[0].count
        guard i >= 0 && i < m && j >= 0 && j < n && board[i][j] == word[d] else { return false }
        if d == word.count - 1 { return true }
        
        let curr = board[i][j]
        board[i][j] = "0"
        let found = search(&board, word, i + 1, j, d + 1)
        || search(&board, word, i - 1, j, d + 1)
        || search(&board, word, i, j + 1, d + 1)
        || search(&board, word, i, j - 1, d + 1)
        board[i][j] = curr
        return found
    }
}

// MARK: - 1. Backtracking

class Xoo79_1 {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let m = board.count
        let n = board[0].count
        var board = board
        let word = Array(word)
        for i in 0..<m {
            for j in 0..<n {
                if backtrack(&board, word, i, j, 0) {
                    return true
                }
            }
        }
        return false
    }
    
    private func backtrack(_ board: inout [[Character]], _ word: [Character], _ r: Int, _ c: Int, _ idx: Int) -> Bool {
        guard board[r][c] == word[idx] else { return false }
        if idx == word.count - 1 { return true }
        
        let m = board.count
        let n = board[0].count
        let dirs = [0, 1, 0, -1, 0]
        let char = board[r][c]
        
        var res = false
        board[r][c] = "."
        for d in 0..<4 {
            let nr = r + dirs[d]
            let nc = c + dirs[d + 1]
            guard nr >= 0 && nr < m && nc >= 0 && nc < n else { continue }
            res = res || backtrack(&board, word, nr, nc, idx + 1)
        }
        board[r][c] = char
        return res
    }
}
