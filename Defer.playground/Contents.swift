import UIKit

//MARK: - Defer

//The 'defer' statement in Swift is used to execute a set of statements just before code execution leaves the current block of code. It helps to keep the code clean and manageable, especially when several different possible points of exit are available from a function.


func testDefer() {
    print("Start")
    defer {
        print("This is deferred until the end")
    }
    print("End")
}

testDefer()
