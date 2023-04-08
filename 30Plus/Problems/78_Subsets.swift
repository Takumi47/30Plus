//
//  78_Subsets.swift
//  30Plus
//
//  Created by xander on 2023/4/8.
//

import Foundation

class Solution78 {
    static func runTest() {
        let t1 = (nums: [1,2,3], output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]])
        let t2 = (nums: [0], output: [[],[0]])
        [t1, t2].forEach { t in
            let result = Xoo78_3().subsets(t.0)
            print("\(result)")
            if Set(result) != Set(t.1) { print("❌❌❌❌❌\n")}
        }
    }
}

// MARK: - 1. Cascading

class Xoo78_1 {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var output: [[Int]] = [[]]
        
        for num in nums {
            var newSubsets: [[Int]] = []
            for subset in output { newSubsets.append(subset + [num]) }
            for subset in newSubsets { output.append(subset) }
        }
        
        return output
    }
}

// MARK: - 2. Backtracking

/** Power set is all possible combinations of all possible lengths, from 0 to n. */
class Xoo78_2 {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var ans: [[Int]] = []
        var curr: [Int] = []
        for len in 0...nums.count {
            dfs(nums, len, 0, &curr, &ans)
        }
        return ans
    }
    
    private func dfs(_ nums: [Int], _ len: Int, _ start: Int, _ curr: inout [Int], _ ans: inout [[Int]]) {
        if curr.count == len {
            ans.append(curr)
            return
        }
        
        for i in start..<nums.count {
            curr.append(nums[i])
            dfs(nums, len, i + 1, &curr, &ans)
            curr.removeLast()
        }
    }
}

// MARK: - 3. Lexicographic (Binary Sorted) Subsets

class Xoo78_3 {
    func subsets(_ nums: [Int]) -> [[Int]] {
        let n = nums.count
        var ans: [[Int]] = []
        for mask in 0..<(1 << n) {
            var curr: [Int] = []
            for i in 0..<n {
                if mask & (1 << i) > 0 {
                    curr.append(nums[i])
                }
            }
            ans.append(curr)
        }
        return ans
    }
}

