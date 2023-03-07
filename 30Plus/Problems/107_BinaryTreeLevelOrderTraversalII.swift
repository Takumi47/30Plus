//
//  107_BinaryTreeLevelOrderTraversalII.swift
//  30Plus
//
//  Created by xander on 2023/3/7.
//

import Foundation

class Solution107 {
    static func runTest() {
        let a5 = TreeNode(7)
        let a4 = TreeNode(15)
        let a3 = TreeNode(20, a4, a5)
        let a2 = TreeNode(9)
        let a1 = TreeNode(3, a2, a3)
        let t1: (TreeNode?, [[Int]]) = (root: a1, output: [[15,7],[9,20],[3]])
        
        let b1 = TreeNode(1)
        let t2: (TreeNode?, [[Int]]) = (root: b1, output: [[1]])
        
        let t3: (TreeNode?, [[Int]]) = (root: nil, output: [])
        
        [t1, t2, t3].forEach { t in
            let result = Xoo107_1().levelOrderBottom(t.0)
            print("\(result)")
            if result != t.1 { print("❌❌❌❌❌\n") }
        }
    }
}

// MARK: - 1. Recursion: DFS Preorder Traversal

class Xoo107_1 {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var res: [[Int]] = []
        dfs(root, 0, &res)
        return res.reversed()
    }
    
    private func dfs(_ node: TreeNode?, _ level: Int, _ res: inout [[Int]]) {
        guard let node = node else { return }
        if level == res.count {
            res.append([])
        }
        res[level].append(node.val)
        
        dfs(node.left, level + 1, &res)
        dfs(node.right, level + 1, &res)
    }
}

// MARK: - 2. Iteration: BFS Traversal

class Xoo107_2 {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        let q = Queue<TreeNode>()
        q.enqueue(root)
        
        var res: [[Int]] = []
        while !q.isEmpty {
            var level: [Int] = []
            for _ in 0..<q.count {
                guard let node = q.dequeue() else { continue }
                level.append(node.val)
                if let left = node.left { q.enqueue(left) }
                if let right = node.right { q.enqueue(right) }
            }
            res.append(level)
        }
        return res.reversed()
    }
}
