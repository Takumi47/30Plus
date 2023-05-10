//
//  347_TopKFrequentElements.swift
//  30Plus
//
//  Created by xander on 2023/5/11.
//

import Foundation

class Solution347 {
    static func runTest() {
        let t1 = (nums: [1,1,1,2,2,3], k: 2, output: [1,2])
        let t2 = (nums: [1], k: 1, output: [1])
        [t1, t2].forEach { t in
            let result = Xoo347().topKFrequent(t.0, t.1)
            print("\(result)")
            if result != t.2 { print("❌❌❌❌❌\n") }
        }
    }
}

class Xoo347 {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var counter: [Int: Int] = [:]
        var maxFreq = 1
        for num in nums {
            counter[num, default: 0] += 1
            maxFreq = max(maxFreq, counter[num, default: 0])
        }
        
        var buckets: [Int: [Int]] = [:]
        for (val, freq) in counter {
            buckets[freq, default: []].append(val)
        }
        
        var ans: [Int] = []
        for freq in (1...maxFreq).reversed() {
            if let vals = buckets[freq] {
                ans.append(contentsOf: vals)
            }
            if ans.count == k { break }
        }
        return ans
    }
}
