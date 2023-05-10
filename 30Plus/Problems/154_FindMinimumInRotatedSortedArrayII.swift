//
//  154_FindMinimumInRotatedSortedArrayII.swift
//  30Plus
//
//  Created by xander on 2023/5/11.
//

import Foundation

class Solution154 {
    static func runTest() {
        let t1 = (nums: [1,3,5], output: 1)
        let t2 = (nums: [2,2,2,0,1], output: 0)
        let t3 = (nums: [10,1,10,10,10], output: 1)
        [t1, t2, t3].forEach { t in
            let result = Xoo154().findMin(t.0)
            print("\(result)")
            if result != t.1 { print("❌❌❌❌❌\n") }
        }
    }
}

class Xoo154 {
    func findMin(_ nums: [Int]) -> Int {
        let n = nums.count
        var left = 0
        var right = n - 1
        
        while left < right {
            let mid = left + (right - left) / 2
            
            if nums[mid] > nums[right] {
                left = mid + 1
            } else if nums[mid] < nums[right] {
                right = mid
            } else {
                right -= 1 // ⭐️⭐️⭐️
            }
        }
        return nums[left]
    }
}
