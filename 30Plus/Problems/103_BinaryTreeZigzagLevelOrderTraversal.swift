//
//  103_BinaryTreeZigzagLevelOrderTraversal.swift
//  30Plus
//
//  Created by xander on 2023/5/11.
//

import Foundation

class Solution103 {
    static func runTest() {
        let a5 = TreeNode(7)
        let a4 = TreeNode(15)
        let a3 = TreeNode(20, a4, a5)
        let a2 = TreeNode(9)
        let a1 = TreeNode(3, a2, a3)
        let t1: (TreeNode?, [[Int]]) = (root: a1, output: [[3],[20,9],[15,7]])
        
        let b1 = TreeNode(1)
        let t2: (TreeNode?, [[Int]]) = (root: b1, output: [[1]])
        
        let t3: (TreeNode?, [[Int]]) = (root: nil, output: [])
        
        [t1, t2, t3].forEach { t in
            let result = Xoo103_2().zigzagLevelOrder(t.0)
            print("\(result)")
            if result != t.1 { print("❌❌❌❌❌\n") }
        }
    }
}

// MARK: - 1. BFS (Breadth-First Search)

class Xoo103_1 {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var res: [[Int]] = []
        var q = Queue<TreeNode>()
        q.enqueue(root)
        
        var level = 0
        while !q.isEmpty {
            var currLevel: [Int] = []
            for _ in 0..<q.count {
                guard let node = q.dequeue() else { continue }
                currLevel.append(node.val)
                if let left = node.left { q.enqueue(left) }
                if let right = node.right { q.enqueue(right) }
            }
            
            if level % 2 == 1 {
                currLevel = currLevel.reversed()
            }
            res.append(currLevel)
            level += 1
        }
        return res
    }
}

// MARK: - 2. DFS (Depth-First Search)

class Xoo103_2 {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var res: [[Int]] = []
        dfs(root, 0, &res)
        return res
    }
    
    private func dfs(_ node: TreeNode?, _ level: Int, _ res: inout [[Int]]) {
        guard let node = node else { return }
        
        if level == res.count {
            res.append([node.val])
        } else {
            if level % 2 == 0 {
                res[level].append(node.val)
            } else {
                res[level].insert(node.val, at: 0)
            }
        }
        
        dfs(node.left, level + 1, &res)
        dfs(node.right, level + 1, &res)
    }
}
