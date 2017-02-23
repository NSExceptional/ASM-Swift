//
// Loading-FP.swift
// A set of instructions to move values to and from the FPS.
//

import Foundation


// MARK: Constants

/// Pushes pi onto the FPS
public func fldpi() {
    f3 = f2
    f2 = f1
    f1 = f0
    f0 = Double.pi
}

/// Pushes e onto the FPS
public func flde() {
    f3 = f2
    f2 = f1
    f1 = f0
    f0 = M_E
}

/// Pushes 1 onto the FPS
public func fld1() {
    f3 = f2
    f2 = f1
    f1 = f0
    f0 = 1
}

/// Pushes 0 onto the FPS
public func fldz() {
    f3 = f2
    f2 = f1
    f1 = f0
    f0 = 0
}


// MARK: Loading from the Stack

/// Moves the integer value pointed to by `offset` into f0, where `offset`
/// is an offset into the Stack, but first moves f0 into f1, and so on.
///
/// Example: given `offset = 7` and
/// the following stack (bottom to top): [a b c d w x y z]
/// the value `c` would be retrieved.
///
/// Example usages:
///
/// ```
/// fild(*ra)
/// fild(rb - 5)
/// fild(rs + 2)
/// fild(84) // not reccomended
/// ```
public func fild(_ offset: Address) {
    f3 = f2
    f2 = f1
    f1 = f0
    f0 = Stack.peekd(offset)
}
