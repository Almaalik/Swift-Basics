import UIKit

//Operation - An abstract class that represents the code and data associated with a single task.

    //Block Operation - An operation that manages the concurrent execution of one or more blocks.
//Operation Queue - Aqueue the regulates the execution of operation

class OperationQueue: ObservableObject {
    func testOperationQueue() {
        print("Operation started")
        blockFunction()
        print("Operation ended")
    }
    
    private func blockFunction() {
        let op = BlockOperation()
        op.addExecutionBlock {
            print("Execution task 1")
        }
        op.addExecutionBlock {
            print("Execution task 2")
        }
        op.addExecutionBlock {
            print("Execution task 3")
        }
        op.addExecutionBlock {
            print("Execution task 4")
        }
        //        op.start()
        
        
        let op1 = BlockOperation()
        op1.addExecutionBlock {
            for i in 0...5 {
                print(i)
            }
        }
        
        let op2 = BlockOperation()
        op2.addExecutionBlock {
            for i in 0...5 {
                print(i)
            }
        }
        
        let opQueue = OperationQueue()
        op1.addDependency(op2)
    }
    
}
