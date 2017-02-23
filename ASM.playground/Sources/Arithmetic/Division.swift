//
// Division.swift
// Various integer division instructions.
//

import Foundation


/// Divides ra by rb and stores the quotient in ra and the remainder in rd (SIGNED INTEGER DIVISION)
public func idiv() {
    rd = Math.toInt(ra) % Math.toInt(rb)
    ra = Math.toInt(ra) / Math.toInt(rb)
}
