import UIKit


//MARK: - == vs ===
//== Equality
// === Identity

struct Person: Equatable {
    var name: String
    var country: String
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.country == rhs.country
    }
}

let person1 = Person(name: "Abdul", country: "India")
let person2 = Person(name: "Maalik", country: "India")

if person1 == person2 {
    print("\(person1) is equal to \(person2)")
} else {
    print("\(person1) is not equal to \(person2)")
}



class PersonClass: Equatable {
    var name: String
    var country: String
    
    init(name: String, country: String) {
        self.name = name
        self.country = country
    }
    
    static func == (lhs: PersonClass, rhs: PersonClass) -> Bool {
        return lhs.country == rhs.country
    }
}

var person3 = PersonClass(name: "Maalik", country: "UAE")
var person4 = person3

person4.country = "USA"

if person3 === person4 {
    print("\(person3.country) is equal to \(person4.country)")
} else {
    print("\(person3.country) is not equal to \(person4.country)")
}



//MARK: - Self vs self
//Self is refer to type
//self is refer to object

struct Sample {
    var name: String
    static var country = "India"
    
    init(name: String) {
        self.name = name
    }
    
    func isValid() {
        print("Is name valid: \(name.isStringValid())")
    }
    
    func getCountry() {
        print("Country is: \(Self.country)")
    }
}


extension String {
    func isStringValid() -> Bool {
        return self.count > 3
    }
}

var sampleClass = Sample(name: "Maalik")
sampleClass.isValid()
sampleClass.getCountry()
