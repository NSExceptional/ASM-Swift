//
// Addition.swift
// Various integer addition instructions.
//

import Foundation


// MARK: Un-signed integer addition

/// Adds ra and rb together and stores the result in ra
public func add() {
    ra = Math.toUInt(ra) + Math.toUInt(rb)
}

/// Adds rb and the given variable together and stores the result in ra
public func add(_ variable: Variable) {
    ra = Math.toUInt(rb) + Math.toUInt(variable)
}

/// Adds the given variable and the given literal together and stores the result in `src`
public func add(_ src: Variable, const: UInt) {
    var dest = src
    dest.value = Math.toUInt(src) + const
}

/// Adds the given variable and the given literal together and stores the result in ra
public func adda(_ variable: Variable, const: UInt) {
    ra = Math.toUInt(variable) + const
}

/// Adds `dest` and `src` together and stores the result in `dest`
public func add(_ dest: Variable, src: Variable) {
    var d = dest
    d.value = Math.toUInt(dest) + Math.toUInt(src)
}


// MARK: Signed integer addition

/// Adds ra and rb together and stores the result in ra
public func adds() {
    ra = Math.toInt(ra) + Math.toInt(rb)
}

/// Adds rb and the given variable together and stores the result in ra
public func adds(_ variable: Variable) {
    ra = Math.toInt(rb) + Math.toInt(variable)
}

/// Adds the given variable and the given literal together and stores the result in `src`
public func adds(_ src: Variable, const: Int) {
    var dest = src
    dest.value = Math.toInt(src) + const
}

/// Adds the given variable and the given literal together and stores the result in ra (SIGNED INTEGER ADDITION)
public func addsa(_ variable: Variable, const: Int) {
    ra = Math.toInt(variable) + const
}

/// Adds `dest` and `src` together and stores the result in `dest` (UN-SIGNED INTEGER ADDITION)
public func adds(_ dest: Variable, src: Variable) {
    var d = dest
    d.value = Math.toInt(dest) + Math.toInt(src)
}
