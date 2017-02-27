//
// FlowControl.swift
// Instructions to conditionally change the flow of a program and declare labels.
//

import Foundation


// MARK: Labels

public typealias Code = () -> Void

public class Label {
    internal static var all: [String: Label] = [:]
    
    internal let body: Code
    
    @discardableResult
    public convenience init(_ name: String, _ body: @escaping Code) {
        self.init(name, body, runNow: true)
    }
    
    @discardableResult
    public init(_ name: String, _ body: @escaping Code, runNow: Bool) {
        self.body = body
        Label.all[name] = self
        
        if runNow {
            body()
        }
    }
}

// MARK: Jumping

/// Does not work as intended yet
internal func jmp(_ label: String, _ file: String = #file, _ line: Int = #line) {
    Label.named(label, file, line).body()
}

/// Use with caution
public func jnz(_ label: String, _ file: String = #file, _ line: Int = #line) {
    if !Flags.current.zero {
        Label.named(label, file, line).body()
    }
}

/// Use carefully
public func loop(_ label: String, _ file: String = #file, _ line: Int = #line) {
    rc = Math.toInt(rc) - 1
    if Math.toInt(rc) != 0 {
        Label.named(label, file, line).body()
    }
}
