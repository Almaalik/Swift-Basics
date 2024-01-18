import UIKit

//MARK: - Equatable - A type that can be compared for value equality

struct Student: Equatable {
    var name: String
    var marks: Int
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.marks == rhs.marks && lhs.name == rhs.name
    }
}

let obj1 = Student(name: "Abdul", marks: 22)
let obj2 = Student(name: "Abdul", marks: 22)

if obj1 == obj2 {
    print("Objects are same")
} else {
    print("Objects are not same")
}


//MARK: - Comparable - A type that can be compared using relational operators like <, <=, > and >=

struct Students: Comparable {
    var name: String
    var marks: Int
    
    static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.marks < rhs.marks
    }
}

let object1 = Students(name: "Abdul", marks: 22)
let object2 = Students(name: "Abdul", marks: 27)

if object1 < object2 {
    print("Objects are greater")
} else {
    print("Objects are lesser")
}

//MARK: - Hashable - A type that can be hased into hasher to produce an integer hash value

struct Employee: Hashable {
    var name: String
    var salary: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
   
}

let employee1 = Employee(name: "Abdul", salary: 22)
let employee2 = Employee(name: "Maalik", salary: 27)

print("Employee1 hash value \(employee1.hashValue)")
print("Employee2 hash value \(employee2.hashValue)")



