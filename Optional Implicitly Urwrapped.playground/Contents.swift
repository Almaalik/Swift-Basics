import UIKit


var string1: String // Normal
var string2: String! // Implicitly unwrapped
var string3: String? // Optional

//print("String1 \(string1)") // This variable has no memory since gives an error
print("String2 \(string2)")
print("String3 \(string3)")

//string1 = string3
//Cannot able to assign nil to string1 due to it has no memory

//Optional Binding
if let value = string3 {
    string1 = value
    print("Value of string3 \(value)")
}

string3 = "Abdul Maalik"

if let value = string3 {
    string1 = value
    print("Value of string3 after given a name to it: \(value)")
}

//string1 = string2
//Occure run time error due to var string1 can't handle nil vale


//Optionals -- An optional in Swift is basically a constant or variable that can hold a value OR no value. The value can or cannot be nil. It is denoted by appending a "?" after the type declaration

var optionalVar: String?
optionalVar = "Maalik"

print("Optional value: \(optionalVar)")

//Optional Binding -- Use optional binding to find out whether an optional contains a value, and if so, to make that value available as a temporary constant or variable.

//1. If let
if let ifLetValue = optionalVar {
    print("Optional binding(if let): \(ifLetValue)")
}

//2. Guard let
func guardLet() {
    guard let guardValue = optionalVar else {
        return
    }
    print("Optional binding (guard let): \(guardValue)")

}
guardLet()

//3.Nil coalalasing operaotr
print("Nil colalasing operator \(optionalVar ?? "")")

//4.Force unwrapping
print("Force unwrapping: \(optionalVar!)")


//Optional Chaining -- Optional chaining is a process for querying and calling properties, methods, and subscripts on an optional that might currently be nil. If the optional contains a value, the property, method, or subscript call succeeds; if the optional is nil, the property, method, or subscript call returns nil. Multiple queries can be chained together, and the entire chain failes grcefully if any link in the chain is nil.


class Person {
    var residence: Residence?
}


class Residence {
    var numberOfRooms = 10
}

let john = Person()

//let roomCount = john.residence!.numberOfRooms
// this triggers a runtime error

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// Prints "Unable to retrieve the number of rooms."



john.residence = Residence()

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// Prints "John's residence has 1 room(s)."
