import UIKit
/*
 What are closures? -- Closures are self-contained blocks of functionality that can be passed around and used in your code.
 
Non-Escaping closures? -- non-escaping means that a closure will not live or reman in memory once the function that
 calls this closure finish execution. So closure needs to be executed before its calling
 function finish execution.closure is non-escaping closure by default in swift.

 Escaping closures? -- Escaping closures will remain in memory after the function from which they gets called finish
 execution. Generally used in API calls where code is running asynchronously and execution
 time is unknown.
 */

class Closures {
    func additionOfTwoNumber(num1: Int, num2: Int, completion: @escaping(_ result: Int) -> ()) {
        let result = num1 + num2
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            print("Adding two numbers \(num1) & \(num2)...")
            completion(result)
        }
    }
    
    func additionAction() {
        print("Add Action start")
        additionOfTwoNumber(num1: 21, num2: 22) { result in
            print("Addition of two number: \(result)")
        }
        print("Add Action ends")
    }
    
    func subtractionOfTwoNumber(num1: Int, num2: Int, completion: (_ result: Int) -> ()) {
        let result = num1 - num2
            print("Subtracting two numbers \(num1) & \(num2)...")
            completion(result)
    }
    
    func subtractionAction() {
        print("Sub Action start")
        subtractionOfTwoNumber(num1: 27, num2: 22) { result in
            print("Subtraction of two number: \(result)")
        }
        print("Sub Action ends")
    }
}

let closureClass = Closures()
closureClass.additionAction()
closureClass.subtractionAction()
