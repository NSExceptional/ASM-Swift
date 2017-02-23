//
// Transfer.swift
// Instructions to transfer values between variables.
//

import Foundation


// MARK: Storing values

/// Conveniently move any value into ra
public func mova(_ value: Any) {
    ra = value
}

/// Conveniently move the value of another variable into ra
public func mova(_ src: Variable) {
    ra = src.value
}

/// Move the value of the second variable into the first variable
public func mov(_ dest: Variable, _ src: Variable) {
    var d = dest
    d.value = src.value
}

/// Move `value` into the given variable
public func mov(_ dest: Variable, _ value: Any) {
    var v = dest
    v.value = value
}

/// Move the value at the given address into the given variable
public func mov(_ dest: Variable, _ addr: Address) {
    var d = dest
    d.value = Stack.peek(addr)
}


// MARK: Swapping

/// Swaps the values of `via` and ra (EXCHANGE)
public func xchg(_ via: Variable) {
    var v   = via
    
    let tmp = ra
    ra      = via.value
    v.value = tmp
}

/// Swaps the values of the given variables
public func xchg(_ a: Variable, _ b: Variable) {
    var A = a
    var B = b
    
    let tmp = A.value
    A.value = B.value
    B.value = tmp
}
