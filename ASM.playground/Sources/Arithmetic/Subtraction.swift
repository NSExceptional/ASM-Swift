//
// Subtraction.swift
// Various integer subtraction instructions.
//

import Foundation


// MARK: Un-signed integer subtraction

/// Subtracts rb from ra and stores the result in ra
public func sub() {
    ra = Math.toUInt(ra) - Math.toUInt(rb)
}

/// Subtracts ra from rb and stores the result in ra
public func subr() {
    ra = Math.toUInt(rb) - Math.toUInt(ra)
}

/// Subtracts the given variable from rb and stores the result in ra
public func sub(_ variable: Variable) {
    ra = Math.toUInt(rb) - Math.toUInt(variable)
}

/// Subtracts the given literal from `src` and stores the result in `src`
public func sub(_ src: Variable, _ const: UInt) {
    var dest = src
    dest.value = Math.toUInt(src) - const
}

/// Subtracts the given literal from the given variable and stores the result in ra
public func suba(_ variable: Variable, _ const: UInt) {
    ra = Math.toUInt(variable) - const
}

/// Adds `dest` and `src` and stores the result in `dest`
public func sub(_ dest: Variable, _ src: Variable) {
    var d = dest
    d.value = Math.toUInt(dest) - Math.toUInt(src)
}


// MARK: Signed integer subtraction

/// Subtracts rb from ra and stores the result in ra
public func subs() {
    ra = Math.toInt(ra) - Math.toInt(rb)
}

/// Subtracts ra from rb and stores the result in ra
public func subsr() {
    ra = Math.toInt(rb) - Math.toInt(ra)
}

/// Subtracts the from rb given variable and stores the result in ra
public func subs(_ variable: Variable) {
    ra = Math.toInt(rb) - Math.toInt(variable)
}

/// Subtracts the given literal from `src` and stores the result in `src`
public func subs(_ src: Variable, _ const: Int) {
    var dest = src
    dest.value = Math.toInt(src) - const
}

/// Subtracts the given literal from the given variable and stores the result in ra (SIGNED INTEGER subtraction)
public func subsa(_ variable: Variable, _ const: Int) {
    ra = Math.toInt(variable) - const
}

/// Adds `dest` and `src` together and stores the result in `dest` (UN-SIGNED INTEGER subtraction)
public func subs(_ dest: Variable, _ src: Variable) {
    var d = dest
    d.value = Math.toInt(dest) - Math.toInt(src)
}
