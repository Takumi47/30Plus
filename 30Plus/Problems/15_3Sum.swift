//
//  15_3Sum.swift
//  30Plus
//
//  Created by xander on 2023/3/21.
//

import Foundation

class Solution15 {
    static func runTest() {
        let t1 = (nums: [-1,0,1,2,-1,-4], output: [[-1,-1,2],[-1,0,1]])
        let t2 = (nums: [Int](), output: [[Int]]())
        let t3 = (nums: [0], output: [[Int]]())
        let t4 = (nums: [-1,-1,-1,1,1,1,0], output: [[-1,0,1]])
        let t5 = (nums: [0,0,0], output: [[0,0,0]])
        [t1, t2, t3, t4, t5].forEach { t in
            let result = Xoo15_B().threeSum(t.0)
            print("\(result)")
            if result != t.1 { print("❌❌❌❌❌\n") }
        }
    }
}

// MARK: - Hashtable

/// Time complexity: O(n^2)
/// Space complexity: O(n)
class Xoo15_A {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let n = nums.count
        let nums = nums.sorted()
        var mappingCount: [Int: Int] = [:]
        nums.forEach { mappingCount[$0, default: 0] += 1 }
        
        var ans: [[Int]] = []
        for i in 0..<n {
            if i > 0 && nums[i] == nums[i - 1] { continue } //
            for j in (i + 1)..<n {
                if j != i + 1 && nums[j] == nums[j - 1] { continue } //
                
                let target = 0 - nums[i] - nums[j]
                if target < nums[j] { continue } // Keep nums[i] <= nums[j] <= nums[k] (target)
                if mappingCount[target] == 0 { continue }
                
                // Make sure count is enough ex.(0,0,0)
                var needed = 1
                if nums[i] == target { needed += 1 }
                if nums[j] == target { needed += 1 }
                
                if let count = mappingCount[target], count >= needed {
                    ans.append([nums[i], nums[j], target])
                }
            }
        }
        return ans
    }
}

// MARK: - Two Pointers

/// Time complexity: O(n^2)
/// Space complexity: O(1)
class Xoo15_B {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let n = nums.count
        let nums = nums.sorted()
        var ans: [[Int]] = []
        for i in 0..<n {
            if i > 0 && nums[i] == nums[i - 1] { continue }
            
            /*
             How to move points?
             Let target = 0 - nums[i]
             1. nums[j] + nums[k] > target, too large, decrease k
             2. nums[j] + nums[k] < target, too small, increase j
             */
            var j = i + 1
            var k = n - 1
            while j < k {
                if nums[j] + nums[k] > -nums[i] {
                    k -= 1
                } else if nums[j] + nums[k] < -nums[i] {
                    j += 1
                } else {
                    ans.append([nums[i], nums[j], nums[k]])
                    while j < k && nums[j] == nums[j + 1] { j += 1 }
                    while j < k && nums[k] == nums[k - 1] { k -= 1 }
                    j += 1
                    k -= 1
                }
            }
        }
        return ans
    }
}
