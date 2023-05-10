//
//  210_CourseScheduleII.swift
//  30Plus
//
//  Created by xander on 2023/5/11.
//

import Foundation

class Solution210 {
    static func runTest() {
        let t1 = (numCourses: 2, prerequisites: [[1,0]], output: [0,1])
        let t2 = (numCourses: 4, prerequisites: [[1,0],[2,0],[3,1],[3,2]], output: [0,2,1,3])
        let t3 = (numCourses: 1, prerequisites: [[Int]](), output: [0])
        [t1, t2, t3].forEach { t in
            let result = Xoo210().findOrder(t.0, t.1)
            print("\(result)")
            if result != t.2 { print("❌❌❌❌❌\n") }
        }
    }
}

class Xoo210 {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var graph: [[Int]] = Array(repeating: [], count: numCourses)
        for p in prerequisites {
            graph[p[1]].append(p[0])
        }
        
        // 0: unknown, 1: visiting, 2: visited
        var visited: [Int] = Array(repeating: 0, count: numCourses)
        var ans: [Int] = []
        for i in 0..<numCourses {
            if dfs(i, graph, &visited, &ans) { return [] }
        }
        return ans.reversed()
    }
    
    private func dfs(_ course: Int, _ graph: [[Int]], _ visited: inout [Int], _ ans: inout [Int]) -> Bool {
        if visited[course] == 1 { return true } // has a cycle
        if visited[course] == 2 { return false }
        
        visited[course] = 1
        
        for n in graph[course] {
            if dfs(n, graph, &visited, &ans) { return true }
        }
        
        visited[course] = 2
        ans.append(course)
        return false
    }
}
