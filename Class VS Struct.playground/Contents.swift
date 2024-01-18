import UIKit

//MARK: - Class VS Struct
//Class -- Inheritance & Reference type
class Main {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
var myClass = Main(name: "Abdul", age: 26)
var anotherClass = myClass
anotherClass.name = "Maalik"
print("My Class \(myClass.name)")
print("Another Class \(anotherClass.name)")

//Struct -- Lightweight, Performance, Value type
struct MainStruct {
    var name: String
    var age: Int
}
var structClass = MainStruct(name: "John", age: 10)
var anotherStruct = structClass
anotherStruct.name = "Doe"
anotherStruct.age = 12
print("Main Struct \(structClass)")
print("Another Struct \(anotherStruct)")

/*
 1.We can't able to stored property using class keyword (static let name = "India")
 2.We can store computed property using calss keyword
 class var name: String {
 return "Aabdul Maalik "
 3.We can override a class func but not a static func
 4.Class only belongs to class, we cannot have a class on a static
 
 */

class Sample {
    
    func test() {
        print("Normal func")
    }
    
    static func test2() {
        print("Static func")
    }
    class func test3() {
        print("Class func")
    }
}

class Sample2: Sample {
    
    override func test() {
      print("Overriding normal func")
    }
    
    override class func test3() {
        print("Overriding normal class func")
    }
}

var sampleClass = Sample()
sampleClass.test()

//Not accessible due to its a static function -- static functions are invoked by the class itself not by the instance
//sampleClass.test2()
Sample.test2()
Sample.test3()


class Testing {
    
    static var number = 10
    var count: Int
    
    init(count: Int) {
        self.count = count
    }
    
    func addVariables() {
        print("Adding two variables, Number: \(Testing.number) and Count: \(count) = \(count + Testing.number)")
    }
}
let testingClass = Testing(count: 10)
testingClass.addVariables()

Testing.number = 20

let testingClass2 = Testing(count: 10)
testingClass2.addVariables()
