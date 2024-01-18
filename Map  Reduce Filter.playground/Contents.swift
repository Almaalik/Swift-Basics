import UIKit

//MARK: - Higher Order Functions

// Higher order functions are simply functions that operate on other functions by either taking a function as an argument, or returning a function. Swift’s Array type has a few methods that are higher order functions: sorted, map, filter, and reduce. These methods use closures to allow us to pass in functionality that can then determine how we want the method to sort, map, filter, or reduce an array of


struct Person {
    let name: String
    let isSubscribed: Bool
    let email: String?
    let ratings: Int
    let monthlyPrice: Double
    
}


//MARK: - MAP -- Returns an array containing the result of mapping the given closure over the sequence's elements.
//Mapping is similar to sort in that it iterates through the array that is calling it, but instead of sorting it changes each element of the array based on the closure passed to the method.

var arrayElements = ["One", "Two", "Three", "Four"]

let person = [
    Person(name: "rasul", isSubscribed: false, email: "abdul@", ratings: 100, monthlyPrice: 10.09),
    Person(name: "imran", isSubscribed: true, email: "maalik@", ratings: 112, monthlyPrice: 23.00),
    Person(name: "abdul", isSubscribed: false, email: nil, ratings: 104, monthlyPrice: 34.71)
]

var results = arrayElements.map {$0.uppercased()}
print("Results: \(results)")


let names = person.map {$0.name}
print("Names array: \(names)")

let addedRatings = person.map {$0.ratings + 10}
print("Ratings array: \(addedRatings)")

let sortedNames = person.map {$0.name}.sorted()
print("Names array sorted: \(sortedNames)")

print("EMAIL MAP: \(person.map({$0.email}))")


//MARK: - Compact Map - Returns the array containg the non-nil result of calling the given transformation with each element of this sequence.

let emailsCompactMap = person.compactMap {$0.email}
print("Mails array: \(emailsCompactMap)")


let myMap = person.myMap {$0.email}
print("Mails array: \(myMap)")

let myCompactMap = person.myCompactMap {$0.email}
print("Mails array: \(myCompactMap)")


//MARK: - Filter - the filter method will return an array that has only elements that pass your filter specified in your closure.

let higherRatings = person.filter {$0.ratings <= 100}
print("Higher ratings: \(higherRatings)")


//MARK: - Reduce - The reduce function allows you to combine all the elements in an array and return an object of any type (generics!!!!)

let num = [1,3,4,5,8,9]
let add = num.reduce(0, +)
let sub = num.reduce(100, -) // 100 - 30 (1+3+4+5+8+9)
print("added array of numbers: \(add) -- Subtraction: \(sub)")
let totalRatings = person.reduce(0, { $0 + $1.ratings })
print("Total ratings: \(totalRatings)")

let resultInString = num.reduce("") {$0 + String($1)}
print("Numbers in array: \(resultInString)")

//MARK: - Chaining
let revenue = person.map { Double($0.ratings) * $0.monthlyPrice }.reduce(0, +)
print("Revenue: \(revenue)")


//MARK: - Flat MAP -  can convert array of array into a single array

let arrayOfArray: [[Int]] = [[1,2,3], [4,5,6], [7,8,9]]
let flatArray = arrayOfArray.flatMap { $0 }
print("Flatted array: \(flatArray)")

var arrayOfNumber = [1, 5, 14, 23, 20]


//MARK: - Sorted -- Lets start with the sorted function. If we call sorted on an array it will return a new array that sorted in ascending order. In order for this method to work the elements in the array need to conform to the Comparable protocol.

let arrayOfNum = [0, 5, 8, 4, 12, 19, 15, 20]

var sortedInAscending = arrayOfNum.sorted()
var sortedInDecending = arrayOfNum.sorted(by: { (a, b) -> Bool in
    return a > b
})
print("Ascending: \(sortedInAscending) && Decending: \(sortedInDecending)")

var decendingNum = arrayOfNum.sorted(by: >)

print("Deending sorted numbers: \(decendingNum)")



//MARK: - MAP Extension

extension Collection {
    public func myMap<T>(_ transform: (Element) throws -> T) rethrows -> [T] {
        var result = [T]()
        for item in self {
            result.append(try transform(item))
        }
        return result
    }
    
    public func myCompactMap<T>(_ transform: (Element) throws -> T?) rethrows -> [T] {
        var result = [T]()
        for item in self {
            if let values = try transform(item) {
                result.append(values)
            }
        }
        return result
    }
}
