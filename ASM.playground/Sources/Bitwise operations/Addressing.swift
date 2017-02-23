//
// Addressing.swift
// Useful operators querying addresses in Variables.
//

import Foundation


prefix operator *

/// - RETURNS: the value in `rhs` interpreted as an Address
public prefix func *(rhs: Variable) -> Address {
    return Math.toAddress(rhs)
}

/// - RETURNS: the value in `lhs` interpreted as an Address negatively offset by `rhs`
public func -(lhs: Variable, rhs: Address) -> Address {
    return Math.toAddress(lhs) - rhs
}

/// - RETURNS: the value in `lhs` interpreted as an Address positively offset by `rhs`
public func +(lhs: Variable, rhs: Address) -> Address {
    return Math.toAddress(lhs) + rhs
}
