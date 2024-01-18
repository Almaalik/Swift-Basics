import UIKit

//MARK: - Singleton

//A singleton is an intsance of a class that can only be created once and is globally accessible throughout your code base.

//Disadvantages of Singleton: Tight Coupling: Overuse of Singleton can lead to tight coupling between classes, making it difficult to test and maintain the codebase. Global State: Singleton introduces global state, which can lead to unintended side effects and make debugging complex


class MainClass {
    var singleton = Singleton.shared
    
    let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
    func loggerFunction() {
        for i in 1...10 {
            concurrentQueue.async {
                Singleton.shared.writeLog(key: "Key: \(i)", value: "Value: \(i)")
            }
       }
    }
    
}

class Singleton {
    
    static var shared = Singleton()
    private var logDictionary = [String: Any]()
    private let serialQueue = DispatchQueue(label: "serialQueue", attributes: .concurrent)
    
    private init() {}
    
    func writeLog(key: String, value: Any) {
        serialQueue.async (flags: .barrier){ [weak self] in
//Barrier is switching between serial and concurrent queue and perform as a serial queue until code in the barrier flow finishes its execution and again switches back to concurrent queue after executing the barrier block
            self?.logDictionary[key] = value
            print("Key is: \(key) and value is: \(value)")
        }
    }
}

var vc = MainClass()
vc.loggerFunction()

//2.Is Singleton threadsafe? - No
//3.How to make Singleton threadsafe -- NO
//4.How to make it threadsafe -- Make it run inside a concurrent queue
//5. Which secnarion we consider using singleton -- 


