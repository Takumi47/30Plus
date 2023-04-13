//
//  100_SameTree.swift
//  30Plus
//
//  Created by xander on 2023/4/13.
//

import Foundation

class Solution100 {
    static func runTest() {
        let a3 = TreeNode(3)
        let a2 = TreeNode(2)
        let a1 = TreeNode(1, a2, a3)
        let b3 = TreeNode(3)
        let b2 = TreeNode(2)
        let b1 = TreeNode(1, b2, b3)
        let t1 = (p: a1, q: b1, output: true)
        
        let c2 = TreeNode(2)
        let c1 = TreeNode(1, c2, nil)
        let d2 = TreeNode(2)
        let d1 = TreeNode(1, nil, d2)
        let t2 = (p: c1, q: d1, output: false)
        
        let e3 = TreeNode(1)
        let e2 = TreeNode(2)
        let e1 = TreeNode(1, e2, e3)
        let f3 = TreeNode(2)
        let f2 = TreeNode(1)
        let f1 = TreeNode(1, f2, f3)
        let t3 = (p: e1, q: f1, output: false)
        
        let g1 = TreeNode(1)
        let h2 = TreeNode(2)
        let h1 = TreeNode(1, nil, h2)
        let t4 = (p: g1, q: h1, output: false)
        
        [t1, t2, t3, t4].forEach { t in
            let result = Xoo100_2().isSameTree(t.0, t.1)
            print("\(result)")
            if result != t.2 { print("❌❌❌❌❌\n") }
        }
    }
}

// MARK: - 1. Recursion

class Xoo100_1 {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard let p = p, let q = q, p.val == q.val else { return p == q }
        return isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
    }
}

// MARK: - 2. Iteration

class Xoo100_2 {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard let p = p, let q = q, p.val == q.val else { return p === q }
        
        var queueP = Queue<TreeNode>()
        var queueQ = Queue<TreeNode>()
        queueP.enqueue(p)
        queueQ.enqueue(q)
        
        while let x = queueP.dequeue(), let y = queueQ.dequeue() {
            if let l1 = x.left, let l2 = y.left, l1.val == l2.val {
                queueP.enqueue(l1)
                queueQ.enqueue(l2)
            } else if !(x.left == nil && y.left == nil) {
                return false
            }
            
            if let r1 = x.right, let r2 = y.right, r1.val == r2.val {
                queueP.enqueue(r1)
                queueQ.enqueue(r2)
            } else if !(x.right == nil && y.right == nil) {
                return false
            }
        }
        
        return queueP.isEmpty && queueQ.isEmpty
    }
}
