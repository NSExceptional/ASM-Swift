//
// MemoryStack.swift
//

import Foundation


public typealias Address = UInt8

/// The Stack is a place to temporarily store values when
/// you want to save the value of a variable, say between
/// function calls, or when you've simply run out of variables
/// to use.
///
/// Stack storage is limited to 128 entries. Attempting to
/// store more than 128 values will result in a fatal error.
/// Attempting to pop a value from the stack when it is
/// empty will result in a fatal error.
///
/// Note that you must push and variables in opposite order if you wish
/// to save and restore their values. `push([.ra, .rb])` followed by
/// `pop([.ra, .rb])` will swap the values of `ra` and `rb`.
///
/// When you push something to the stack, the Stack pointer (rs)
/// will point just "above" the last thing that was pushed.
public struct Stack {
    
    /// Store the given variables on the stack in the given order.
    ///
    /// Examples: `Stack.push([.ra, .rb])`
    public static func push(_ values: [Variable]) {
        guard !values.isEmpty else { fatalError("Must supply variables to push onto the stack") }
        _Stack.impl.push(values)
    }
    
    /// Retrieve values from the stack and store them
    /// in the given variables in the given order.
    public static func pop(_ values: [Variable]) {
        guard !values.isEmpty else { fatalError("Must supply variables to pop into from the stack") }
        _Stack.impl.pop(values)
    }
    
    /// Store integer values on the stasck in the given order.
    /// Useful for working with the fp stack.
    public static func push(_ integers: [Int]) {
        guard !integers.isEmpty else { fatalError("Must supply numbers to push onto the stack") }
        _Stack.impl.push(integers)
    }
    
    /// Use to save the Flags before calling a function,
    /// or at the start of your own functions
    public static func pushf() {
        _Stack.impl.pushf()
    }
    
    /// Use to restore the Flags after calling a function,
    /// or at the end of your own functions
    public static func popf() {
        _Stack.impl.popf()
    }
}
