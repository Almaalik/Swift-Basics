import UIKit

//Lazy is stored property not computed property

//The initial value is not calculated until it is called or used for the first time.


class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    lazy var fullName: String = {
        return firstName + lastName
    }()
    
    var fullNameComputed: String {
        return firstName + lastName
    }
}

var personClass = Person(firstName: "Abdul", lastName: "Maalik")
personClass.fullName
personClass.fullNameComputed

personClass.firstName = "M"


personClass.fullName
personClass.fullNameComputed

personClass.fullName = "M Abdul Maalik"

personClass.fullName
personClass.fullNameComputed




struct Student {
   var rollNumber: Int
   var name: String
   lazy var uniqueId: String = {
      "ID_\(name)_\(rollNumber)"
   }()
}

// Instance creation
var amit = Student(rollNumber: 12009, name: "Amit")
print(amit.uniqueId)

/*
 In the above example, we have created a struct classed Student having some stored properties and one lazy property. We defined a lazy variable to create and get a unique ID.

 The stored properties get initialized with their initial values when you create an instance of this Student struct. However, the lazy property called uniqueId is not initialized. So now the question is when will it be initialized?

 When the lazy property is read by calling it, it will be initialized and return the calculated value of the type string.
 */
