//
// Private.swift
// Used internally by this playround.
//

import Foundation


extension Variable {
    var value: Any {
        get { return valueOf(self) }
        set { set(value: newValue, of: self) }
    }
}

extension FPVariable {
    var value: Double {
        get { return valueOf(self) }
        set { set(value: newValue, of: self) }
    }
}

extension Stack {
    static func peekd(_ idx: Address) -> Double {
        return _Stack.impl.peekd(below: idx)
    }
    
    static func peek(_ idx: Address) -> Any {
        return _Stack.impl.peekd(below: idx)
    }
}

extension Flags {
    static var size: Int {
        return MemoryLayout<Flags>.size
    }
}

func valueOf(_ variable: Variable) -> Any {
    switch variable {
    case .ra:
        return ra
    case .rb:
        return rb
    case .rc:
        return rc
    case .rd:
        return rd
    case .rs:
        return rs
    case .rf:
        return rf
    case .ri:
        return ri
    case .ro:
        return ro
    }
}

func set(value: Any, of variable: Variable) {
    switch variable {
    case .ra:
        ra = value
    case .rb:
        rb = value
    case .rc:
        rc = value
    case .rd:
        rd = value
    case .rs:
        rs = value
    case .rf:
        rf = value
    case .ri:
        ri = value
    case .ro:
        ro = value
    }
}

func valueOf(_ variable: FPVariable) -> Double {
    switch variable {
    case .f0:
        return f0
    case .f1:
        return f1
    case .f2:
        return f2
    case .f3:
        return f3
    }
}

func set(value: Double, of variable: FPVariable) {
    switch variable {
    case .f0:
        f0 = value
    case .f1:
        f1 = value
    case .f2:
        f2 = value
    case .f3:
        f3 = value
    }
}

class _Stack {
    static let impl = _Stack()
    
    private var storage: [Any] = [Any].init(repeating: 0, count: 128)
    var pointer: Address {
        get { return Math.toAddress(rs) }
        set { rs = newValue }
    }
    
    private init() {}
    
    func push(_ values: [Variable]) {
        for r in values {
            insert(r.value)
        }
    }
    
    func pop(_ values: [Variable]) {
        for var r in values {
            r.value = remove()
        }
    }
    
    func push(_ integers: [Int]) {
        for i in integers {
            insert(i)
        }
    }
    
    func pushf() {
        insert(Flags.current)
    }
    
    func popf() {
        var thing = remove()
        if let flags = thing as? Flags {
            Flags.current = flags
        } else {
            // Truncate or extend to sizeof(Flags) bytes
            Flags.current = withUnsafePointer(to: &thing, { (raw) -> Flags in
                return UnsafeRawPointer(raw).assumingMemoryBound(to: Flags.self).pointee
            })
        }
    }
    
    func peekd(below address: Address) -> Double {
        return Math.toDouble(peek(below: address))
    }
    
    func peek(below address: Address) -> Any {
        guard address > 0 && address <= 128 else { fatalError("Attempted to peek stack value out of range") }
        return storage[Int(address) - 1]
    }
    
    func insert(_ v: Any) {
        guard pointer < 128 else {
            fatalError("Stack overflow: ran out of stack space")
        }
        
        storage[Int(pointer)] = v
        pointer += 1
    }
    
    func remove() -> Any {
        guard pointer > 0 else {
            fatalError("Segmentation fault: attempted to pop from empty stack")
        }
        
        pointer -= 1
        return storage[Int(pointer)]
    }
    
    class var description: String {
        return "\(impl.storage)"
    }
}

class Math {
    class func toDouble(_ val: Any) -> Double {
        let v = val is Variable ? (val as! Variable).value : val
        
        switch v {
        case is Int:
            return Double(v as! Int)
        case is Int8:
            return Double(v as! Int8)
        case is Int16:
            return Double(v as! Int16)
        case is Int32:
            return Double(v as! Int32)
        case is Int64:
            return Double(v as! Int64)
            
        case is UInt:
            return Double(v as! UInt)
        case is UInt8:
            return Double(v as! UInt8)
        case is UInt16:
            return Double(v as! UInt16)
        case is UInt32:
            return Double(v as! UInt32)
        case is UInt64:
            return Double(v as! UInt64)
            
        case is Double:
            return v as! Double
        case is Float:
            return Double(v as! Float)
            
        default:
            return unsafeBitCast(v, to: Double.self)
        }
    }
    
    class func toInt(_ val: Any) -> Int {
        let v = val is Variable ? (val as! Variable).value : val
        
        switch v {
        case is Int:
            return v as! Int
        case is Int8:
            return Int(v as! Int8)
        case is Int16:
            return Int(v as! Int16)
        case is Int32:
            return Int(v as! Int32)
        case is Int64:
            return Int(v as! Int64)
            
        case is UInt:
            return Int(v as! UInt)
        case is UInt8:
            return Int(v as! UInt8)
        case is UInt16:
            return Int(v as! UInt16)
        case is UInt32:
            return Int(v as! UInt32)
        case is UInt64:
            return Int(Int64(bitPattern: v as! UInt64))
            
        case is Double:
            return Int(v as! Double)
        case is Float:
            return Int(v as! Float)
            
        default:
            return unsafeBitCast(v, to: Int.self)
        }
    }
    
    class func toUInt(_ val: Any) -> UInt {
        let v = val is Variable ? (val as! Variable).value : val
        
        switch v {
        case is Int:
            return UInt(v as! Int)
        case is Int8:
            return UInt(v as! Int8)
        case is Int16:
            return UInt(v as! Int16)
        case is Int32:
            return UInt(v as! Int32)
        case is Int64:
            return UInt(UInt64(bitPattern: v as! Int64))
            
        case is UInt:
            return v as! UInt
        case is UInt8:
            return UInt(v as! UInt8)
        case is UInt16:
            return UInt(v as! UInt16)
        case is UInt32:
            return UInt(v as! UInt32)
        case is UInt64:
            return UInt(v as! UInt64)
            
        case is Double:
            return UInt(v as! Double)
        case is Float:
            return UInt(v as! Float)
            
        default:
            return unsafeBitCast(v, to: UInt.self)
        }
    }
    
    class func toAddress(_ val: Any) -> Address {
        let v = val is Variable ? (val as! Variable).value : val
        
        switch v {
        case is Int:
            return Address(truncatingBitPattern: v as! Int)
            
        case is Int16:
            return Address(truncatingBitPattern: v as! Int16)
        case is Int32:
            return Address(truncatingBitPattern: v as! Int32)
        case is Int64:
            return Address(truncatingBitPattern: v as! Int64)
            
        case is UInt:
            return Address(truncatingBitPattern: v as! UInt)
        case is UInt8:
            return v as! UInt8
        case is UInt16:
            return Address(truncatingBitPattern: v as! UInt16)
        case is UInt32:
            return Address(truncatingBitPattern: v as! UInt32)
        case is UInt64:
            return Address(truncatingBitPattern: v as! UInt64)
            
        case is Float32:
            return Address(truncatingBitPattern: unsafeBitCast(v as! Float32, to: Int32.self))
        case is Float64:
            return Address(truncatingBitPattern: unsafeBitCast(v as! Float64, to: Int64.self))
            
        default:
            return unsafeBitCast(v, to: Address.self)
        }
    }
}

public class Debug {
    private static var cleanSP = 0
    private static var function = ""
    
    public class func registers() {
        print("ra = \(ra)")
        print("rb = \(rb)")
        print("rc = \(rc)")
        print("rd = \(rd)")
        print("rs = \(rs)")
        print("rf = \(rf)")
        print("ri = \(ri)")
        print("ro = \(ro)")
    }
    
    public class func stack() {
        print("stack:\n" + _Stack.description)
    }
    
    /// `argc` is the function's argument count
    public class func guardStack(argc: Int, `function`: String = #function) {
        self.cleanSP = Math.toInt(rs) - argc
        self.function = function
    }
    
    /// `argc` is the function's argument count
    public class func checkStackGuard(_ silent: Bool = false) {
        let sp = Math.toInt(rs)
        if sp != cleanSP {
            fatalError("Stack guard check failed for \(function): off by \(sp - cleanSP)")
        } else if !silent {
            print("[Debug] \(function): stack is clean")
        }
    }
}

