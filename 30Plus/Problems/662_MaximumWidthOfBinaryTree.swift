//
//  662_MaximumWidthOfBinaryTree.swift
//  30Plus
//
//  Created by xander on 2023/3/21.
//

import Foundation

class Solution662 {
    static func runTest() {
        let a6 = TreeNode(9)
        let a5 = TreeNode(3)
        let a4 = TreeNode(5)
        let a3 = TreeNode(2, nil, a6)
        let a2 = TreeNode(3, a4, a5)
        let a1 = TreeNode(1, a2, a3)
        let t1 = (root: a1, output: 4)
        
        let b4 = TreeNode(3)
        let b3 = TreeNode(5)
        let b2 = TreeNode(3, b3, b4)
        let b1 = TreeNode(1, b2, nil)
        let t2 = (root: b1, output: 2)
        
        let c4 = TreeNode(5)
        let c3 = TreeNode(2)
        let c2 = TreeNode(3, c4, nil)
        let c1 = TreeNode(1, c2, c3)
        let t3 = (root: c1, output: 2)
        
        let d7 = TreeNode(7)
        let d6 = TreeNode(6)
        let d5 = TreeNode(9, d7, nil)
        let d4 = TreeNode(5, d6, nil)
        let d3 = TreeNode(2, nil, d5)
        let d2 = TreeNode(3, d4, nil)
        let d1 = TreeNode(1, d2, d3)
        let t4 = (root: d1, output: 7)
        
        [t1, t2, t3, t4].forEach { t in
            let result = Xoo662_1().widthOfBinaryTree(t.0)
            print("\(result)")
            if result != t.1 { print("❌❌❌❌❌\n") }
        }
    }
}

// MARK: - DFS

class Xoo662 {
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        var ids: [Int] = []
        return dfs(root, 0, 0, &ids)
    }
    
    private func dfs(_ root: TreeNode?, _ level: Int, _ id: Int, _ ids: inout [Int]) -> Int {
        guard let root = root else { return 0 }
        if level == ids.count { ids.append(id) }
        let newId = id - ids[level]
        return max(newId + 1, dfs(root.left, level + 1, 2 * newId, &ids), dfs(root.right, level + 1, 2 * newId + 1, &ids))
    }
}

// MARK: - BFS

class Xoo662_1 {
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var q = Queue<(TreeNode, Int)>()
        q.enqueue((root, 0))
        
        var maxWidth = 0
        var level = 0
        var ids: [Int] = [] // Save the min. id in each level
        while !q.isEmpty {
            for _ in 0..<q.count {
                guard let (curr, id) = q.dequeue() else { continue }
                if ids.count == level { ids.append(id) }
                
                let newId = id - ids[level]
                maxWidth = max(maxWidth, newId + 1)
                
                if let left = curr.left { q.enqueue((left, 2 * newId + 1)) }
                if let right = curr.right { q.enqueue((right, 2 * newId + 2)) }
            }
            level += 1
        }
        return maxWidth
    }
}
