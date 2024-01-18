import UIKit
import Foundation


//MARK: - Weak vs Unownded vs Strong || Retain cycle || Memory management

/* Weak and Unknown reference are weak
1. Strong -- hold a strong memory reference and increase retain count
2. Weak and Unowned -- hold a weak memory reference and doesn't increase retain count
 Unowned can never be nil Weak can be nil
ARC Doesn't take weak and unowned reference into account
 */

/*
 How to solve Memory Leaks
 --The ARC is responsible for tracking and managing your app’s memory usage and also freeing up the memory used by class instances when those instances are no longer needed.
 --We can break this strong retain cycle by marking one of the properties as weak or unowned.

 1.Monitoring memory leaks --open Instruments e look for the option Leaks
 2.Using the Analyze tool -- (Product -. Analyze) The Analyze tool is a function in Xcode for statically analyzing code after potential memory leaks. Once the analysis has finished running, the developer is provided with a list of suspicious places in the code.
 3.Using the Xcode Memory Graph tool -- To do this, first edit the scheme for your app in Xcode -- Click on ‘Run’ scheme and then select the diagnostics section. There are two settings in this section that need to be enabled. The first is Malloc Scribble in the memory management group: -- Enabling Malloc Scribble will fill freed memory with a predefined value that makes it more obvious when memory is leaked. This increases Xcode’s accuracy of identifying leaks.

 */

class Vechile {
    var car: Car?
    let id: String
    init(id: String, car: Car?) {
        self.id = id
        self.car = car
        print("\(self) allocated")
    }
    deinit {
        print("\(self) deallocated")
    }
}

class Car {
    unowned var vechile: Vechile?
    let name: String
    init(name: String, vechile: Vechile?) {
        self.name = name
        self.vechile =  vechile
        print("\(self) allocated")
    }
    deinit {
        print("\(self) deallocated")
    }
}
/* Creating object but not assigning it into a var since ARC will automatically deallocate the memory
Creaing a object and storing it into a var memory will not deallocate  */

//Vechile(id: "", car: nil)
var vechile: Vechile? = Vechile(id: "1234", car: nil)
var car: Car?  = Car(name: "BMW", vechile: nil)

vechile?.car = car
car?.vechile = vechile

vechile = nil
car = nil


//MARK: - ARC - Automatic Reference Counting

/*
 On iOS, you use Automatic Reference Counting (ARC) to manage memory,
 
 The goal of Automatic Reference Counting is to know which data can be removed from RAM memory, to free up space.
 An essential concept in ARC is the retain count, which is a number that keeps track of how many objects are “holding onto” to another object.
 ARC only applies to reference types such as classes, and not to value types like structs. Value types are copied, so they don’t work with references.
 
 When the retain count is greater than zero, the object is kept in memory
 When this retain count reaches zero, the object is removed from memory
 
*/

class Bus
{
var name = ""

init(name:String) {
self.name = name
print("Instance of Car \(name) is initialized")
}

deinit {
    print("Instance of \(name) is deinitialized")
}
}

var bus_1:Bus?
var bus_2:Bus?

bus_1 = Bus(name: "Maserati")
bus_2 = bus_1

bus_1 = nil
bus_2 = nil
