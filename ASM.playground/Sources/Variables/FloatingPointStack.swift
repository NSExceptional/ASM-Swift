//
// FloatingPointStack.swift
// A set of variables used for floating-point computations.
//

import Foundation


// A general-purpose variable is said to "point to" some
// value located somewhere on the Stack if that variable
// holds the value of the Stack pointer (rs) after having
// pushed the variable onto the Stack.

// These variables together act like a stack, with f0 being the top of the stack.
// Loading/pushing a value onto the FP stack (FPS) will insert a value into f0 and
// push the old values down the stack, such that f1 contains the old value of f0,
// f2 contains the old value of f1, and so on. Popping a value from the stack will
// propogate values up the stack, without modifying the very last FP variable (f3).

var f0: Double = 0
var f1: Double = 0
var f2: Double = 0
var f3: Double = 0

/// Provided functions will take these as arguments
/// to prevent you from using literal values, and
/// to make moving values around easier.
public enum FPVariable {
    case f0
    case f1
    case f2
    case f3
}
