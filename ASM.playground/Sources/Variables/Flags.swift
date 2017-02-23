//
// Flags.swift
// Flags used by various instructions to aid in control flow.
//

import Foundation


/// Do not modify these flags manually.
public struct Flags {
    /// You may freely push this to and pop this from the stack
    static var current = Flags()
    
    /// Indicates whether overflow occured
    var overflow  = false
    /// Indicates whether underflow occured
    var underflow = false
    /// Indicates whether a carry-out occured
    var carryOut  = false
    /// Indicates the parity of the lowest-order byte of the result of arithmetic (true = odd)
    var parity    = false
    /// Indicates result of arithmetic was negative
    var zero      = false
    /// Indicates result of arithmetic was negative
    var negative  = false
    
    /// Used by some copy operations to indicate direction
    var forward   = false
    var reverse: Bool { return !forward }
}
