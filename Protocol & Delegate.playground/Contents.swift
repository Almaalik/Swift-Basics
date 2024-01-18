import UIKit

// MARK: - Protocol - Delegate
//1.Protocol extension 2.Protocol Optionals 3.Protocol Composition

//Protocol -- Protocol is used to define a “blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality.

//These protocols in swift can be further adopted by a class, structure, or enumeration to provide an actual implementation of such requirements. Any of these types which satisfy the requirements of a protocol is said to conform to that protocol.

//Delegate -- The core purpose of the delegate design pattern is to allow a delegate object to report back to its owner in a separate way.

//Just like the observer pattern, implementation of the delegate pattern can be done in many different ways, with a one-to-many or many-to-many relationship.

protocol ViewControllerDelegate {
    func getinfo(info: String)
}

class ViewController: ViewControllerDelegate {
    
    func getinfo(info: String) {
        print("Data from viewcontroller2: \(info)")
    }
}

class ViewController2 {
    var delegate: ViewControllerDelegate?
    
    func viewLoad() {
        print("Call to vc2")
        delegate?.getinfo(info: "This is viewcontroller2")
    }
}

let controller = ViewController()
let controller2 =  ViewController2()
controller2.delegate = controller
controller2.viewLoad()

//MARK: - Protocol Extension

//Protocol Extension -- We can implement optional deleate into extension to just call the method

protocol ProtocolExtensionDelegate {
    func methodMandatory(data: String)
    func methodOptional(data: String)
}
extension ProtocolExtensionDelegate {
    func methodOptional(data: String) {
        
    }
}

class ProtocolExtension: ProtocolExtensionDelegate {
    func methodMandatory(data: String) {
        print("Protocol extension: \(data)")
    }
    
    //Optional to implement
//    func methodOptional(data: String) {
//        print("Protocol extension: \(data)")
//    }
}

class ProtocolExtension2 {
    var delegate: ProtocolExtensionDelegate?
    
    func loadView() {
        delegate?.methodMandatory(data: "Madatory")
        
        //Optional to implement
//        delegate?.methodOptional(data: "Optional")
    }
}

var protocolExtn1 = ProtocolExtension()
var protocolExtn2 = ProtocolExtension2()
protocolExtn2.delegate = protocolExtn1
protocolExtn2.loadView()


//MARK: - Protocol Optional

//Protocol Optional -- In your protocol add optional to those methods which you don’t need to implement. And along with that, you have to add @objc in the protocol and before the optional keyword.


@objc protocol ProtocoOptionalDelegate {
    func methodMandatory(data: String)
    @objc  optional func methodOptional(data: String)
}

class ProtocoOptional: ProtocoOptionalDelegate {
    func methodMandatory(data: String) {
        print("Protocol optional: \(data)")
    }
}

class ProtocoOptional2 {
    var delegate: ProtocoOptionalDelegate?
    
    func loadView() {
        delegate?.methodMandatory(data: "Optional")
    }
}

var protocoOptional = ProtocoOptional()
var protocoOptional2 = ProtocoOptional2()
protocoOptional2.delegate = protocoOptional
protocoOptional2.loadView()


//MARK: - Protocol Composition


protocol SubClassDelegate1 {
   func passCandidateName(candidatename: String)
    func passCandidateAge(age: Int)
}
protocol SubClassDelegate2 {
   func candidateExperience(experience: Int)
}
//As it is extention it is optional as per optional delegate method
extension SubClassDelegate1 {
   func passCandidateAge(age: Int) {
   }
}
protocol SubClassDelegate3: SubClassDelegate1, SubClassDelegate2 {
   
}

class MainClass: SubClassDelegate3 {
    
    func candidateExperience(experience: Int) {
        print("Candidate experience: \(experience)")
    }
    func passCandidateName(candidatename: String) {
        print("Candidate name is : \(candidatename)")
    }
}

class SubClass {
    var delegate: SubClassDelegate3?
    var candidatename = "Abdul Maalik.M"
    
    func actionToPassData() {
        delegate?.passCandidateName(candidatename: candidatename)
        delegate?.candidateExperience(experience: 2)
    }
}

var class1 = MainClass()
var class2 = SubClass()
class2.delegate = class1
class2.actionToPassData()

//MARK: - Associated Protocol

protocol Calculator {
    associatedtype dataType
    func processTwoNumbers(num1: dataType, numb2: dataType) -> dataType
}

class CalculateIntNumbers: Calculator {
    typealias dataType = Int
    func processTwoNumbers(num1: dataType, numb2: dataType) -> dataType {
        return num1 * numb2
    }
}
class CalculateDoubleNumbers: Calculator {
    typealias dataType = Double
    func processTwoNumbers(num1: dataType, numb2: dataType) -> dataType {
        return num1 + numb2
    }
}
print(CalculateIntNumbers().processTwoNumbers(num1: 1, numb2: 4))
print(CalculateDoubleNumbers().processTwoNumbers(num1: 1.5, numb2: 1.6))


//MARK: - Protocol interview question

struct Student: School {
    func doSomething() {
        
    }
}

class Teacher: School {
    func doSomething() {
        
    }
}

protocol School {
    func doSomething()
}


class Test {
    func test() {
        var array = [School]()
        array.append(Teacher())
        array.append(Student())
        array[0].doSomething()
        array[1].doSomething()
    }
    
}



