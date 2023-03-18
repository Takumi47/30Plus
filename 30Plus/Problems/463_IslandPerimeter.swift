//
//  463_IslandPerimeter.swift
//  30Plus
//
//  Created by xander on 2023/3/18.
//

import Foundation

class Solution463 {
    static func runTest() {
        let t1 = (grid: [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]], output: 16)
        let t2 = (grid: [[1]], output: 4)
        let t3 = (grid: [[1,0]], output: 4)
        [t1, t2, t3].forEach { t in
            let result = Xoo463().islandPerimeter(t.0)
            print("\(result)")
            if result != t.1 { print("❌❌❌❌❌\n") }
        }
    }
}

class Xoo463 {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var perimeter = 0
        let dirs = [0, 1, 0, -1, 0]
        for i in 0..<m {
            for j in 0..<n {
                guard grid[i][j] == 1 else { continue }
                for d in 0..<4 {
                    let x = i + dirs[d]
                    let y = j + dirs[d + 1]
                    if x < 0 || x >= m || y < 0 || y >= n || grid[x][y] == 0 {
                        perimeter += 1
                    }
                }
            }
        }
        return perimeter
    }
}
