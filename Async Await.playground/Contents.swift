import UIKit

/*
 
 Sync: When the code reaches the sync statement it will block the current queue until that task completes.

 Once the task returns/completes, control is returned to the caller, and the code that follows the sync task will continue.

 Async: When the code reaches the Async statement it will not block the current queue it will initiate that task and move forward. The initiated task will execute in parallel.

 It immediately returns control back to the caller without waiting for the contents of the async closure to execute.
 
 
 Async - it can be seen as a method attribute making it clear that a method perform async work
 
 Await - is the keyword to call asynchronous method
 
 MainActor - will help you make sure your UI is always updated on the main thread
 
 Task - a unit of async work
 */

class AsyncAwait {
    
    func fetchNumbers() async -> [Int] {
      return [1,3,2,6,77,34,228]
    }
    
    func fetchNumber() async -> Int {
        Int.random(in: 1...10)
    }
    
    func calculateTotal(for numbers: [Int]) async -> Int {
        let total = numbers.reduce(0, +)
        return total
    }
    
    func printOutpput(output: Int) async -> String {
        return "The output is: \(output)"
    }
    
    func process() async {
        
        async let random1 = fetchNumber()
        async let random2 = fetchNumber()
        async let random3 = fetchNumber()
        async let random4 = fetchNumber()
        
        let randomNumber = await [random1, random2, random3, random4]
        print("Random numbers \(randomNumber)")
        
        let number = await fetchNumbers()
        print("Numbers \(number)")
        let total = await calculateTotal(for: number)
        print("Total; \(total)")
        let output = await printOutpput(output: total)
        print("Final output: \(output)")
    }
    
    func functionCall() {
        Task {
            await process()
        }
    }
}

var asyncAwait = AsyncAwait()
asyncAwait.functionCall()
