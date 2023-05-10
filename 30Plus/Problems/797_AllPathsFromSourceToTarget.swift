//
//  797_AllPathsFromSourceToTarget.swift
//  30Plus
//
//  Created by xander on 2023/5/11.
//

import Foundation

class Solution797 {
    static func runTest() {
        let t1 = (graph: [[1,2],[3],[3],[]], output: [[0,1,3],[0,2,3]])
        let t2 = (graph: [[4,3,1],[3,2,4],[3],[4],[]], output: [[0,4],[0,3,4],[0,1,3,4],[0,1,2,3,4],[0,1,4]])
        [t1, t2].forEach { t in
            let result = Xoo797().allPathsSourceTarget(t.0)
            print("\(result)")
            if result != t.1 { print("❌❌❌❌❌\n") }
        }
    }
}

class Xoo797 {
    
    /// graph: DAG
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var paths: [[Int]] = []
        dfs(graph, 0, [0], &paths)
        return paths
    }
    
    private func dfs(_ graph: [[Int]], _ node: Int, _ curr: [Int], _ paths: inout [[Int]]) {
        let n = graph.count
        if node == n - 1 {
            paths.append(curr)
            return
        }
        
        for next in graph[node] {
            dfs(graph, next, curr + [next], &paths)
        }
    }
}
