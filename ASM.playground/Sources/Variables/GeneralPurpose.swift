//
// GeneralPurpose.swift
// A set of general-purpose variables to use for computation.
//

import Foundation


// You are not to assign values to these variables directly.
// Use the bitwise functions provided to manipulate their values.

/// Typically used to store function return values.
/// Many of the provided functions return a value
/// into this register.
/// Also known as the [a]ccumulator.
var ra: Any = 0
/// Typically used to store a [b]uffer of some kind,
/// such as an address to some stack space.
var rb: Any = 0
/// Typically used to store a [c]ounter of some kind,
/// such as a loop control variable.
var rc: Any = 0
/// Used to store additional return value information
/// when the return value of a funciton is too large.
var rd: Any = 0
/// The [S]tack pointer. Points to the top of the Stack.
/// Increment this variable to allocate space on the Stack,
/// or decrement it to free previously allocated space.
var rs: Any = 0
/// Used to keep track of the function's stack [f]rame.
/// Known as the frame pointer.
var rf: Any = 0
/// Come up with your own neumonic. 'i' could stand for input.
var ri: Any = 0
/// Come up with your own neumonic. 'o' could stand for output.
var ro: Any = 0

/// Provided functions will take these as arguments
/// to prevent you from using literal values, and
/// to make moving values around easier.
public enum Variable {
    case ra
    case rb
    case rc
    case rd
    case rs
    case rf
    case ri
    case ro
}
