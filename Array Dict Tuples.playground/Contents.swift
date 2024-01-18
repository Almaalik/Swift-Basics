import UIKit

//MARK: - Array - An array is a collection of similar types of data.

//1. An array of integer type
var number : [Int] = [2, 4, 6, 8]


//2.In Swift, we can also create an empty array
var value = [Int]()


//3.Access Array Elements
var lang = ["Swift", "Java", "C++"]

// access element at index 0
print(lang[0])   // Swift


//MARK: - 4.Add Elements to an Array
var numbers = [21, 34, 54, 12]


//4.1 Using append method
numbers.append(32)

//4.1 Appendng an array into another
var primeNumbers = [2, 3, 5]
var evenNumbers = [4, 6, 8]

primeNumbers.append(contentsOf: evenNumbers)


//4.2 Using insert()
var num = [21, 34, 54, 12]
num.insert(32, at: 1)


//5. Modify the Elements of an Array
var dailyActivities = ["Eat","Repeat"]
dailyActivities[1] = "Sleep"


//6. Remove an Element from an Array
var languages = ["Swift","Java","Python"]

// remove element at index 1
let removedValue = languages.remove(at: 1)


//7.Looping Through Array
let fruits = ["Apple", "Peach", "Mango"]

for fruit in fruits {
  print(fruit)
}


//8. Find Number of Array Elements
let evenNumberss = [2,4,6,8]
print("Total Elements: \(evenNumbers.count)")


//9. Check if an Array is Empty
let numberss = [21, 33, 59, 17]

// check if numbers is empty
var result = numberss.isEmpty

// array without elements
let evenNum = [Int]()

// check if evenNumbers is empty
result = evenNum.isEmpty

//10. Array With Mixed Data Types
// array with String and integer data
var address: [Any] = ["Scranton", 570]




//MARK: - Swift Dictionary
// Swift dictionary is an unordered collection of items. It stores elements in key/value pairs. Here, keys are unique identifiers that are associated with each value.

var city = ["Nepal": "Kathmandu", "Italy": "Rome", "England": "London"]

// dictionary with keys and values of different data types
var values = [1: "One", 2: "Two", 3: "Three"]
print(numbers)


//Add Elements to a Dictionary
var capitalCity = ["Nepal": "Kathmandu", "England": "London"]
capitalCity["Japan"] = "Tokyo"


//Change Value of Dictionary
var studentID = [111: "Eric", 112: "Kyle", 113: "Butters"]
studentID[112] = "Stan"


//Access Elements from Dictionary

//1. Access Keys Only
var cities = ["Nepal":"Kathmandu", "China":"Beijing", "Japan":"Tokyo"]

// cities.keys return all keys of cities
var countryName  = Array(cities.keys)


//2. Access Values Only
var citiess = ["Nepal":"Kathmandu", "China":"Beijing", "Japan":"Tokyo"]

// cities.values return all values of cities
var countryNam  = Array(citiess.values)



//Remove an Element from a Dictionary
var studID = [111: "Eric", 112: "Kyle", 113: "Butters"]
var removedVal = studID.removeValue(forKey: 112)



//Iterate Over a Dictionary
var classification = ["Fruit": "Apple", "Vegetable": "Broccoli", "Beverage": "Milk"]

for (key,value) in classification {
  print("\(key): \(value)")
}

//Find Number of Dictionary Elements
var stdID = [111: "Eric", 112: "Kyle", 113: "Butters"]
print(stdID.count)

//Create an Empty Dictionary
var emptyDictionary =  [Int: String]()
print("Empty Dictionary: ",emptyDictionary)





//MARK: - Swift Tuple
//In Swift, a tuple is a group of different values. And, each value inside a tuple can be of different data types.

//Suppose we need to store information about the name and price of a product, we can create a tuple with a value to store name (string) and another value to store price (float)

//A temporary container for multiple values is called a tuple. It is a list comma-separated type and is enclosed in parentheses.



//Create A Tuple
var product = ("MacBook", 1099.99)

//Access Tuple Elements
product.0
product.1


//Example: Swift Tuple
var product1 = ("MacBook", 1099.99)

// access tuple elements
print("Name:", product1.0)
print("Price:", product1.1)

//Modify Tuple Element
product1.1 = 1299.99


//Named Tuples
var company = (product: "Programiz App", version: 2.1)

// access tuple element using name
print("Product:", company.product)
print("Version:", company.version)


//Swift Nested Tuple
var alphabets = ("A", "B", "C", ("a", "b", "c"))

// access first element
print(alphabets.0)   // prints "A"

// access nested tuple
print(alphabets.3.0)  // prints "a"


//Add/Remove Elements From Tuple **** We cannot add or remove elements from a tuple in Swift ****

var brandName = ("Programiz","Apple")

//brandName.2 = "Google"
//brandName.remove("Apple")



//Dictionary Inside a Tuple
var laptopLaunch = ("MacBook", 1299, ["Nepal": "10 PM", "England": "10 AM"])
print(laptopLaunch.2) // OP - ["Nepal": "10 PM", "England": "10 AM"]


laptopLaunch.2["USA"] = "11 AM"

print(laptopLaunch.2) //OP - ["Nepal": "10 PM", "England": "10 AM", "USA": "11 AM"]


//MARK: - Sets vs Array

/*
 -Set is unordered while an Array is keeping its order. Printing out the collections after initialization confirms this. Both Arrays and Sets are value types.
 -We have to use append(_:) for an Array and insert(_:) for a Set.
 
 -It returns both a inserted boolean and a memberAfterInsert property which either contains the already-existing object or the just inserted object. This can be valuable if you want to give feedback to the user if an object already exists:
 -A big difference between Sets and Arrays is the uniqueness of elements. An Array can contain the same value twice while a Set will never contain duplicates
 --Array: “An ordered, random-access collection.”
 --Set: “An unordered collection of unique elements.”
 
*/
//Array
var arrayOfBlogCategories: [String] = ["Swift", "Debugging", "Xcode", "Workflow", "Optimization"]
//Sets
var setOfBlogCategories: Set<String> = ["Swift", "Debugging", "Xcode", "Workflow", "Optimization"]

let (inserted, memberAfterInsert) = setOfBlogCategories.insert("Swift")
if !inserted {
    print("\(memberAfterInsert) already exists")
}
