//
// IO.swift
// Functions related to I/O.
//

import Foundation


/// Prints the String in ra
public func print() {
    print(ra as! String)
}

/// Prints the formatted String in ra, with rb
/// holding the number of format arguments.
/// Push the format arguments on the stack
/// in reverse order so that the first is on top.
public func printf() {
    let format = ra as! String
    let argc = Math.toInt(rb)
    
    if argc == 0 {
        print()
    } else {
        var args: [CVarArg] = []
        for _ in 0..<argc {
            args.append(_Stack.impl.remove() as! NSObject)
        }
        
        print(String(format: format, arguments: args))
    }
}
