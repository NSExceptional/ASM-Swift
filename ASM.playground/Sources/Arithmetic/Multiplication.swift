//
// Multiplication.swift
// Various integer multiplication instructions.
//

import Foundation


/// Multiplies ra and rb together and stores the result in ra (UN-SIGNED INTEGER MULTIPLICATION)
public func imul() {
    ra = Math.toUInt(ra) * Math.toUInt(rb)
}

/// Adds ra and rb together and stores the result in ra (SIGNED INTEGER MULTIPLICATION)
public func imuls() {
    ra = Math.toInt(ra) * Math.toInt(rb)
}
