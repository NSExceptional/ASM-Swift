//
// Learn to think in Assembly through Swift!
//
// Rules:
// - You may not assign (=) to any variables directly inside functions
// - You may not declare any variables or constants inside main()
// - You may not declare any types whatsoever
// - You may not use any types other than String, Array, and any numbers (no Bools)
// - You may not use String literals ("...") inside main() (numbers are allowed)
// - You may not use the `nil` keyword whatsoever
// - You may not use Swift's control flow keywords (if/else, while, for)
// - You may declare and use functions, but any functions used:
//     - must not take any (explicit) parameters
//     - must not return a value using the `return` keyword
//   excluding the provided functions, which only take any of the following:
//     - `Variable`
//     - `[Variable]`
//     - `FPVariable`
//     - `[FPVariable]`
//     - `Address`
//
// Note: at the moment, there is no supported way to write to variables
//       you declare outside of main(), but you may still declare them
//       and load their values into the provided Variables (ra, rb, ...).
//
// Put your code in main(), excluding function and variable declarations.
// You may use any of the provided functions except those in Private.swift.
//
// Good luck!
//

import Foundation


let hello  = "Hello World! Name: %@, Age: %@"
let name   = "Tanner"
let age    = 22
let boxMsg = "Volume of box: %@"

func main() {
    // printf() variadic arguments on Stack
    mov(.ra, name)
    mov(.rb, age)
    Stack.push([.rb, .ra]) // reverse order
    
    // Load printf() args, call printf()
    mova(hello)
    mov(.rb, 2)
    printf()
    
    ////////////////////////////////////////////////////////
    // Examples for creating and using your own functions //
    ////////////////////////////////////////////////////////
    
    // volume = calculateArea_variableParams(3, 4, 5)
    mov(.ra, 3)
    mov(.rb, 4)
    mov(.rc, 5)
    calculateVolume_variableParams()
    
    // printf(boxMsg, volume)
    Stack.push([.ra]) // volume arg
    mov(.rb, 1) // only printing volume (1 "%@" arg)
    mov(.ra, boxMsg)
    printf()
    
    // volume = calculateArea_variableParams(3, 4, 5)
    Stack.push([5, 4, 3])
    calculateVolume_stackParams()
    
    // printf(boxMsg, volume)
    Stack.push([.ra]) // volume arg
    mov(.rb, 1) // only printing volume (1 "%@" arg)
    mov(.ra, boxMsg)
    printf()
}

/// Calculates volume of a box (integer multiplication).
/// Takes arguments passed in Variables.
/// - parameters:
///    - width: width of box (in ra)
///    - height: height of box (in rb)
///    - depth: depth of box (in rc)
/// - returns: volume of box (into ra)
func calculateVolume_variableParams() {
    Stack.pushf()   // Save flags we might clobber
    
    // width in ra, height in rb, depth in rc
    
    imul()          // ra = width * height
    mov(.rb, .rc)   // rb = depth
    imul()          // ra = (width*height) * depth, done
    

    Stack.popf()    // Restore flags
}

/// Calculates rectangle area (integer multiplication).
/// Takes two arguments passed on the stack (width on top).
/// Removes parameters from stack when done.
/// - parameters:
///    - width: width of box
///    - height: height of box
///    - depth: depth of box
/// - returns: volume of box (into ra)
func calculateVolume_stackParams() {
    // For your debugging needs
    // ensures stack is clean at end of function
    Debug.guardStack(argc: 3) // 3 args
    
    // Save flags and registers we might clobber
    Stack.push([.rf])
    mov(.rf, .rs)
    Stack.push([.rb, .rc])
    Stack.pushf()
    
    // After preserving registers and such as above,
    // the first stack arg is at rf - 1, and the
    // second at rf - 2, and so on.
    
    mov(.ra, .rf - 1)   // ra = width
    mov(.rb, .rf - 2)   // rb = height
    mov(.rc, .rf - 3)   // rc = depth
    
    
    imul()          // ra = width * height
    mov(.rb, .rc)   // rb = depth
    imul()          // ra = (width*height) * depth, done
    
    // Restore flags and registers in reverse order
    Stack.popf()
    Stack.pop([.rc, .rb])
    mov(.rs, .rf)
    Stack.pop([.rf])
    
    // Deallocate parameters from stack
    // by decrementing the stack pointer
    sub(.rs, 3)
    
    // Debugging still
    Debug.checkStackGuard()
}

main()
