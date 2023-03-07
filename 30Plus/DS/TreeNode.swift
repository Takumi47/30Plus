//
//  TreeNode.swift
//  30Plus
//
//  Created by xander on 2023/3/7.
//

import Foundation

class TreeNode {
    
    // MARK: - Properties
    
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    // MARK: - Lifecycle
    
    init(_ val: Int = 0, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

// MARK: - Description

extension TreeNode: CustomStringConvertible {
    var description: String { diagram(for: self) }
    
    private func diagram(for node: TreeNode?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else { return root + "nil\n" }
        
        if node.left == nil && node.right == nil {
            return root + "\(node.val)\n"
        }
        
        return diagram(for: node.right, top + " ", top + "┌──", top + "│ ")
            + root
            + "\(node.val)\n"
            + diagram(for: node.left, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}

// MARK: - Traversal

extension TreeNode {
    func traverseInOrder(_ visit: (Int) -> Void) {
        left?.traverseInOrder(visit)
        visit(val)
        right?.traverseInOrder(visit)
    }
    
    func traversePreOrder(_ visit: (Int) -> Void) {
        visit(val)
        left?.traversePreOrder(visit)
        right?.traversePreOrder(visit)
    }
    
    func traversePostOrder(_ visit: (Int) -> Void) {
        left?.traversePostOrder(visit)
        right?.traversePostOrder(visit)
        visit(val)
    }
}

// MARK: - Hashable

extension TreeNode: Hashable {
    static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
        lhs === rhs
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
