import UIKit

//MARK: - Dependency Injection

/*
 objects or functions receive objects that they depend on, instead of creating their own. For example, instead of creating a service around user defaults inside your view models, you should be passed an instance of such service.
 
 */

class ViewController {
    var name: String?
    
    init(with name: String) {
        self.name = name
    }
}


class ViewController2 {
    var name: String?
    
    public func setName(with name: String) {
        self.name = name
    }
}

class ViewController3 {
    var name: String?
}


//1.Constructor/ Initializer Injection
let vc1 = ViewController(with: "Abdul Maalik")
print(vc1.name ?? "")



//2.Setter/Function/Method Injection

let vc2 = ViewController2()
vc2.setName(with: "Abdul")
print(vc2.name ?? "")



//3.Property Injection
let vc3 = ViewController3()
vc3.name = "Maalik"
print(vc3.name ?? "")

