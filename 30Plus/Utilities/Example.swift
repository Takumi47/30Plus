//
//  Example.swift
//  30Plus
//
//  Created by xander on 2023/3/7.
//

import Foundation

enum Difficulty: String {
    case easy   = "🟢"
    case medium = "🟠"
    case hard   = "🔴"
}

class Example {
    static var beforeEach: (() -> Void)? = nil
    
    static func of(_ difficulty: Difficulty? = nil, _ description: String, action: () -> Void) {
        beforeEach?()
        printHeader(description, difficulty)
        action()
    }
    
    private static func printHeader(_ message: String, _ difficulty: Difficulty?) {
        print("\n\(difficulty == nil ? "⭐️" : difficulty!.rawValue) \(message)")
        let length = Float(message.count + 3) * 1.2
        print(String(repeating: "-", count: Int(length)))
    }
}
