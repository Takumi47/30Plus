//
//  621_TaskScheduler.swift
//  30Plus
//
//  Created by xander on 2023/5/11.
//

import Foundation

class Solution621 {
    static func runTest() {
        let t1: ([Character], Int, Int) = (tasks: ["A","A","A","B","B","B"], n: 2, output: 8)
        let t2: ([Character], Int, Int) = (tasks: ["A","A","A","B","B","B"], n: 0, output: 6)
        let t3: ([Character], Int, Int) = (tasks: ["A","A","A","A","A","A","B","C","D","E","F","G"], n: 2, output: 16)
        [t1, t2, t3].forEach { t in
            let result = Xoo621().leastInterval(t.0, t.1)
            print("\(result)")
            if result != t.2 { print("❌❌❌❌❌\n") }
        }
    }
}

class Xoo621 {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var freq: [Character: Int] = [:]
        for t in tasks {
            freq[t, default: 0] += 1
        }
        
        let pq = PriorityQueue<Int>([], >)
        for (_, f) in freq {
            pq.enqueue(f)
        }
        
        let n = n + 1 // ⭐️⭐️⭐️
        var res = 0
        while !pq.isEmpty {
            let k = min(n, pq.count)
            var tmp: [Int] = []
            
            for _ in 0..<k {
                guard let f = pq.dequeue() else { continue }
                if f - 1 > 0 {
                    tmp.append(f - 1)
                }
            }
            
            if tmp.isEmpty {
                res += k
            } else {
                res += n
                for f in tmp {
                    pq.enqueue(f)
                }
            }
        }
        return res
    }
}

// MARK: - 1. Greedy

class Xoo621_1 {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var frequencies: [Int] = Array(repeating: 0, count: 26)
        for task in tasks {
            let idx = index(of: task)
            frequencies[idx] += 1
        }
        frequencies.sort()
        
        let maxFrequency = frequencies[25]
        var idleTime = (maxFrequency - 1) * n
        for i in (0..<25).reversed() {
            idleTime -= min(maxFrequency - 1, frequencies[i])
        }
        idleTime = max(idleTime, 0)
        
        return tasks.count + idleTime
    }
    
    private func index(of c: Character) -> Int {
        Int(c.asciiValue! - Character("A").asciiValue!)
    }
}

// MARK: - 2. Math

class Xoo621_2 {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var frequencies: [Int] = Array(repeating: 0, count: 26)
        for task in tasks {
            let idx = index(of: task)
            frequencies[idx] += 1
        }
        
        var maxF = 0
        for f in frequencies {
            maxF = max(maxF, f)
        }
        
        var maxN = 0
        for f in frequencies {
            if f == maxF {
                maxN += 1
            }
        }
        
        return max(tasks.count, (maxF - 1) * (n + 1) + maxN)
    }
    
    private func index(of c: Character) -> Int {
        Int(c.asciiValue! - Character("A").asciiValue!)
    }
}
