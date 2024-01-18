import UIKit

//MARK: - KVC & KVO
/*
 KVC - Key Value Coding is a simple mechanism for accessing an object's property indirectly, using string to identify properties rsther than through an invocation of an accessor method or accessing them directly throug instance variables.
 
 KVO - In Key Value Observing we observe the change in the value of the property
 */

class MainView {
    
    func load() {
        let subClass = SubView(name: "Abdul")
        print("User name: \(subClass.name), age:  \(subClass.age)")
        
        //KVC
        if let name = subClass.value(forKey: "name") as? String {
            print("User name from KVC: \(name)")
        }
        
        //KVO
        let name2 = subClass.observe(\.name, options: [.old, .new]) { subClass, value in
            print("Old Name from KVO: \(value.oldValue)")
            print("New Name from KVO: \(value.newValue)")
        }
        
        subClass.name = "Maalik"
        subClass.setValue("Abdul Maalik", forKey: "name")
        
            sleep(3)
            print("...........")
            subClass.setValue("DispatchQueue Maalik", forKey: "name")
    }
}

class SubView: NSObject {
    @objc dynamic var name: String
    var age: String
    init(name: String) {
        self.name = name
        self.age = "26"
    }
}

var mainClass = MainView()
mainClass.load()
