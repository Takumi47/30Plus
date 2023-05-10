//
//  106_ConstructBinaryTreeFromInorderAndPostorderTraversal.swift
//  30Plus
//
//  Created by xander on 2023/5/11.
//

import Foundation

class Solution106 {
    static func runTest() {
        let t1 = (inorder: [9,3,15,20,7], postorder: [9,15,7,20,3])
        let t2 = (inorder: [-1], postorder: [-1])
        [t1, t2].forEach { t in
            if let result = Xoo106_1().buildTree(t.0, t.1) {
                print("\(result)")
            } else {
                print("Empty Tree")
            }
        }
    }
}

class Xoo106 {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        var lookup: [Int: Int] = [:]
        inorder.enumerated().forEach { i, num in
            lookup[num] = i
        }
        return build(postorder, lookup, postorder.count - 1, 0, inorder.count - 1)
    }
    
    private func build(_ postorder: [Int], _ lookup: [Int: Int], _ postorderIdx: Int, _ l: Int, _ r: Int) -> TreeNode? {
        guard postorderIdx >= 0, l <= r else { return nil }
        let root = TreeNode(postorder[postorderIdx])
        
        let inorderIdx = lookup[root.val] ?? 0
        root.right = build(postorder, lookup, postorderIdx - 1, inorderIdx + 1, r)
        root.left = build(postorder, lookup, postorderIdx - 1 - (r - inorderIdx), l, inorderIdx - 1)
        return root
    }
}

// MARK: - 1. Recursion

class Xoo106_1 {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        var lookup: [Int: Int] = [:]
        inorder.enumerated().forEach { i, num in
            lookup[num] = i
        }
        
        var postorderIdx = postorder.count - 1
        return build(postorder, lookup, &postorderIdx, 0, inorder.count - 1)
    }
    
    private func build(_ postorder: [Int], _ lookup: [Int: Int], _ postorderIdx: inout Int, _ l: Int, _ r: Int) -> TreeNode? {
        guard postorderIdx >= 0, l <= r else { return nil }
        let root = TreeNode(postorder[postorderIdx])
        postorderIdx -= 1
        
        let inorderIdx = lookup[root.val] ?? 0
        root.right = build(postorder, lookup, &postorderIdx, inorderIdx + 1, r)
        root.left = build(postorder, lookup, &postorderIdx, l, inorderIdx - 1)
        return root
    }
}
