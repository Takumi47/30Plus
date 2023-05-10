//
//  203_RemoveLinkedListElements.swift
//  30Plus
//
//  Created by xander on 2023/5/11.
//

import Foundation

class Solution203 {
    static func runTest() {
        let a7 = ListNode(6)
        let a6 = ListNode(5, a7)
        let a5 = ListNode(4, a6)
        let a4 = ListNode(3, a5)
        let a3 = ListNode(6, a4)
        let a2 = ListNode(2, a3)
        let a1 = ListNode(1, a2)
        let t1 = (head: a1, val: 6)
        let t2: (ListNode?, Int) = (head: nil, val: 1)

        let b4 = ListNode(7)
        let b3 = ListNode(7, b4)
        let b2 = ListNode(7, b3)
        let b1 = ListNode(7, b2)
        let t3 = (head: b1, val: 7)

        [t1, t2, t3].forEach { t in
            if let result = Xoo203().removeElements(t.0, t.1) {
                print("\(result)")
            } else {
                print("Empty List")
            }
        }
    }
}

class Xoo203 {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let sentinel: ListNode? = ListNode(0, head)
        var node = sentinel
        while let curr = node, let next = node?.next {
            if next.val == val {
                curr.next = next.next
            } else {
                node = next
            }
        }
        return sentinel?.next
    }
}
