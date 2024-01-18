import UIKit

/*
 Any - Can represent an instance of any type at all, including functional type and optional type
 
 AynObject - can represent an instance of any class type
 
 Generic - code enables you to write flexible, reusable functions and types that can wokr with any types, subject to requirement the you define.
 */

//MARK: - Any & AnyObject
var name: Any? //Optional
var age: Any // Non-Optional

name = "Abdul"
name = 100
age = 26

//Name will print as 100 due to "name = 100" is the latest assignment
print("Name: \(name) & Age: \(age)")


class Employess {
    var name: String?
}
var anyObject: AnyObject
//anyObject = "Abdul"
// will throuugh error due to "AnyObject" is suppose to be a reference type instance of any class type

anyObject = Employess()
name = Employess() // Any object can also able to declare a class ans reference type

//MARK: - Generic
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let trirdNum = a
    a = b
    b = trirdNum
}

var num1 = 10
var num2 = 20
swapTwoValues(&num1, &num2)
print("Swaping two numbers, Num1: \(num1) & Num2: \(num2)")


var value1 = "Abdul"
var value2 = "Maalik"
swapTwoValues(&value1, &value2)
print("Swaping two numbers, Num1: \(value1) & Num2: \(value2)")
