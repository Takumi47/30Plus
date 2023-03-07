//
//  Queue.swift
//  30Plus
//
//  Created by xander on 2023/3/7.
//

import Foundation

class Queue<T> {
    private var leftStack: [T] = [] // Dequeue
    private var rightStack: [T] = [] // Enqueue
    
    var isEmpty: Bool { leftStack.isEmpty && rightStack.isEmpty }
    var count: Int { leftStack.count + rightStack.count }
    var peek: T? { leftStack.isEmpty ? rightStack.first : leftStack.last }
    
    func enqueue(_ element: T) {
        rightStack.append(element)
    }
    
    func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        "\(Array(leftStack.reversed()) + rightStack)"
    }
}
