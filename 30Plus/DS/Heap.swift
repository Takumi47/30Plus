//
//  Heap.swift
//  LeetCode
//
//  Created by xander on 2021/6/5.
//

import Foundation

class Heap<T: Equatable> {
    
    // MARK: - Properties
    
    var elements: [T] = []
    var sort: (T, T) -> Bool
    
    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }
    var peek: T? { elements.first }
    
    // MARK: - Lifecycle
    
    init(_ elements: [T] = [], _ sort: @escaping (T, T) -> Bool) {
        self.elements = elements
        self.sort = sort
        buildHeap()
    }
    
    private func buildHeap() {
        guard !isEmpty else { return }
        let firstNonLeafNode = parentIndex(ofChildAt: count - 1)
        stride(from: firstNonLeafNode, through: 0, by: -1).forEach { siftDown(from: $0) }
    }
    
    // MARK: - Methods
    
    func leftChildIndex(ofParentAt index: Int) -> Int { 2 * index + 1 }
    func rightChildIndex(ofParentAt index: Int) -> Int { 2 * index + 2 }
    func parentIndex(ofChildAt index: Int) -> Int { (index - 1) / 2 }
}

// MARK: - Removing

extension Heap {
    func remove() -> T? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, count - 1)
        defer { siftDown(from: 0) }
        return elements.removeLast()
    }
    
    func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            
            var candidate = parent
            if left < count && sort(elements[left], elements[candidate]) { candidate = left }
            if right < count && sort(elements[right], elements[candidate]) { candidate = right }
            
            if candidate == parent { return }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
}

// MARK: - Inserting

extension Heap {
    func insert(_ element: T) {
        elements.append(element)
        siftUp(from: count - 1)
    }
    
    func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(ofChildAt: child)
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }
}

// MARK: - Searching

extension Heap {
    func index(of element: T, startingAt i : Int) -> Int? {
        guard i < count && sort(elements[i], element) else { return nil }
        if element == elements[i] { return i }
        
        if let j = index(of: element, startingAt: leftChildIndex(ofParentAt: i)) { return j }
        if let j = index(of: element, startingAt: rightChildIndex(ofParentAt: i)) { return j }
        
        return nil
    }
}
