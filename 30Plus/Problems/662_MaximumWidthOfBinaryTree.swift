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
        
        [t1, t2, t3].forEach { t in
            let result = Xoo662().widthOfBinaryTree(t.0)
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
