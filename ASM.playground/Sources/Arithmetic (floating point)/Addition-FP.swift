//
// Addition-FP.swift
//

import Foundation


/// Adds f0 and f1 together, stores the result in f0,
/// then shifts the other values up the fp stack
public func fadd() {
    f0 += f1
    f1 = f2
    f2 = f3
}

/// Subtracts f1 from f0, stores the result in f0,
/// then shifts the other values up the fp stack
public func fsub() {
    f0 -= f1
    f1 = f2
    f2 = f3
}
