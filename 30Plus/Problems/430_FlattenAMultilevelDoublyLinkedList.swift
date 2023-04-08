//
//  430_FlattenAMultilevelDoublyLinkedList.swift
//  30Plus
//
//  Created by xander on 2023/4/8.
//

import Foundation

class Solution430 {
    static func runTest() {
        let a12 = Node430(12)
        let a11 = Node430(11)
        let a10 = Node430(10)
        let a9 = Node430(9)
        let a8 = Node430(8)
        let a7 = Node430(7)
        let a6 = Node430(6)
        let a5 = Node430(5)
        let a4 = Node430(4)
        let a3 = Node430(3)
        let a2 = Node430(2)
        let a1 = Node430(1)
        a1.next = a2
        a2.prev = a1
        a2.next = a3
        a3.prev = a2
        a3.next = a4
        a4.prev = a3
        a4.next = a5
        a5.prev = a4
        a5.next = a6
        a6.prev = a5
        a3.child = a7
        a7.next = a8
        a8.prev = a7
        a8.next = a9
        a9.prev = a8
        a9.next = a10
        a10.prev = a9
        a8.child = a11
        a11.next = a12
        a12.prev = a11
        
        let b3 = Node430(3)
        let b2 = Node430(2)
        let b1 = Node430(1)
        b1.next = b2
        b2.prev = b1
        b1.child = b3
        
        let c1: Node430? = nil
        
        [a1, b1, c1].forEach { t in
            if let result = Xoo430_1().flatten(t) {
                print("\(result)")
            } else {
                print("Empty List")
            }
        }
    }
}

class Node430 {
    var val: Int
    var prev: Node430?
    var next: Node430?
    var child: Node430?
    init(_ val: Int) {
        self.val = val
        self.prev = nil
        self.next = nil
        self.child  = nil
    }
}

// MARK: - 1. DFS by Recursion

class Xoo430_1 {
    func flatten(_ head: Node430?) -> Node430? {
        let sentinel = Node430(0)
        _ = dfs(sentinel, head)
        sentinel.next?.prev = nil
        return sentinel.next
    }
    
    private func dfs(_ prev: Node430?, _ curr: Node430?) -> Node430? {
        guard let curr = curr else { return prev }
        curr.prev = prev
        prev?.next = curr
        
        let next = curr.next
        let tail = dfs(curr, curr.child)
        curr.child = nil
        return dfs(tail, next)
    }
}
