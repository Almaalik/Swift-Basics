//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

//MARK: - Access specifier

//Access specifier is keyword which helps in Access control of code block. Access control restricts access to the parts of your code from code in other source files and modules.
//Encapsulation is one pillar of Object Oriented Programming and access specifiers helps in encapsulating.

/*
 1.Private access restricts the use of an entity to the enclosing declaration, and to
 extensions of that declaration that are in the same file. Use private access to hide
 the implementation details of a specific piece of functionality when those details
 are used only within a single declaration.

 2.File-private access restricts the use of an entity to its own defining source file. Use
 file-private access to hide the implementation details of a specific piece of
 functionality when those details are used within an entire file.
 
 
 3.Internal access enables entities to be used within any source file from their defining
 module, but not in any source file outside of that module. You typically use internal
 access when defining an app's or a framework's internal structure
 On Di


 4.Open access and public access enable entities to be used within any source file from
 their defining module, and also in a source file from another module that imports the
 defining module. You typically use open or public access when specifying the public
 interface to a framework. The difference between open and public access is described
 below.

 */

class MainClass {
    
    private func privatefunction1() {
        
    }
    
    public func privatefunction2() {
        
    }
    
    open func privatefunction3() {
        
    }
    
    fileprivate func privatefunction4() {
        
    }
}

extension MainClass {
    
    func functionCall() {
        let vc = MainClass()
        vc.privatefunction1()
        vc.privatefunction2()
        vc.privatefunction3()
        vc.privatefunction4()
    }
    
    
}

class SubClass {
    
    func functionCall() {
        let vc = MainClass()
        
        vc.privatefunction2()
        vc.privatefunction3()
        vc.privatefunction4()
    }
    
}
