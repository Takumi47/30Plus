//
//  PriorityQueue.swift
//  LeetCode
//
//  Created by xander on 2021/6/5.
//

import Foundation

class PriorityQueue<T: Equatable> {
    
    // MARK: - Properties
    
    private let heap: Heap<T>

    var isEmpty: Bool { heap.isEmpty }
    var count: Int { heap.count }
    var peek: T? { heap.peek }
    
    // MARK: - Lifecycle
    
    init(_ elements: [T] = [], _ sort: @escaping (T, T) -> Bool) {
        self.heap = Heap(elements, sort)
    }
    
    // MARK: - Implementation
    
    @discardableResult
    func enqueue(_ element: T) -> Bool {
        heap.insert(element)
        return true
    }
    
    func dequeue() -> T? {
        heap.remove()
    }
}
