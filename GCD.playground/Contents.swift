import UIKit


//MARK: - DispatchQueue - Serial, Concurrent, Sync & Async, Multithreading & GCD

/*
 Introduction of Grand Central Dispatch 🎉
 Grand Central Dispatch or GCD is a low-level API for managing concurrent operations. It will make your application smooth and more responsive. Also helps for improving application performance. Sometimes we are trying to perform multiple tasks at the same time that time most of the developer-facing application hang or freezing issue this is the common issue. That’s why we are using GCD to manage multiple tasks at the same time.

 List of DispatchQueue Priority -
 .userInteractive
 .userInitiated
 .default
 .utility
 .background
 .unspecified
 
 */


/*
 Serial Queue -- FIFO , one at a time
 Concurrent Queue -- Parallel execution
 */
//1.Serial Queue
let serialQueue = DispatchQueue(label: "serialqueue")
serialQueue.async {
    print("Queue 1 started")
    print("Queue 1 ended")
}
serialQueue.async {
    print("Queue 2 started")
    print("Queue 2 ended")
}
//2.Concurrent Queue
let concurrentQueue = DispatchQueue(label: "concurrentqueue", attributes: .concurrent)
concurrentQueue.async {
    print("Queue 1 started")
    print("Queue 1 ended")
}
concurrentQueue.async {
    print("Queue 2 started")
    print("Queue 2 ended")
}
/*
 Two types of queue 1. Background Queue 2.Main Queue
 1.Background Queue
 > .userInteractive -- Highest priority on the system, use for animation or tracking events interactively
 > .userIntiated
 > .utility
 > .background -- Lowest priority of all task
 */

let queue = DispatchQueue.global()
let group = DispatchGroup()

queue.async(group: group) {
    sleep(3)
    print("Task 1 Completed")
}
queue.async(group: group) {
    sleep(1)
    print("Task 2 Completed")
}
group.wait()
print("All task executed")

group.enter()
queue.async(group: group) {
    sleep(3)
    print("Task 1 Completed")
    group.leave()
}
group.enter()
queue.async(group: group) {
    sleep(1)
    print("Task 2 Completed")
    group.leave()
}
group.notify(queue: queue) {
    print("Alll tasks executed")
}
print("Continue execution")


//https://www.youtube.com/watch?v=Z2mQKrOcuGE&list=PLV7VzbWXa60EiWHqcH_pNjuVYxW0JpcET&index=16


//MARK: - Dispatch Queue

/*
 In Swift, the DispatchQueue class is used to manage the execution of tasks or closures in a concurrent or serial manner. A queue is a FIFO (First In, First Out) list of tasks, and a DispatchQueue manages the execution of these tasks by dispatching them to one or more threads for execution. There are several global concurrent queues available in the system, each with a different Quality of Service (QoS) level, which is used to prioritize the execution of tasks on the queue.
 
 DispatchQueue.global(qos: .background)

 DispatchQueue.global(qos: .userInteractive)

 DispatchQueue.global(qos: .userInitiated)
 
 
 DispatchQueue.global(qos: .background)
 The DispatchQueue.global(qos: .background) method call creates a new global concurrent queue with a Quality of Service (QoS) of .background. This QoS is used for tasks that are not time-critical and can be executed in the background without significantly affecting the performance of the app. Examples of tasks that may be executed on the .background queue include data synchronization, non-essential data processing, or downloading large files.

 DispatchQueue.global(qos: .userInteractive)
 The DispatchQueue.global(qos: .userInteractive) method call creates a new global concurrent queue with a Quality of Service (QoS) of .userInteractive. This QoS is used for tasks that are time-critical and require immediate user feedback. Examples of tasks that may be executed on the .userInteractive queue include updating the UI, handling user input, or playing audio.

 DispatchQueue.global(qos: .userInitiated)
 The DispatchQueue.global(qos: .userInitiated) method call creates a new global concurrent queue with a Quality of Service (QoS) of .userInitiated. This QoS is used for tasks that are initiated by the user and require immediate results. Examples of tasks that may be executed on the .userInitiated queue include loading data for a UI element, processing user input, or performing a search.
 
 Will the global methods ever run in main thread?
 Global queue is a concurrent queue that is managed by the system, which means that it can run tasks on any available thread. By default, tasks that are submitted to a global queue will be executed on a non-main thread, unless you specifically target the main queue using DispatchQueue.main.
 
 Getting results back to main thread
 You can dispatch code from a background thread back onto the main thread using DispatchQueue.main.async. This is useful when you want to update the UI after a background task has completed. For example:
 
 */

DispatchQueue.global(qos: .userInteractive).async {
    // Perform time-critical task here, such as updating the UI
    DispatchQueue.main.async {
        // Update the UI on the main thread
    }
}


//MARK: - Dispatch Barrier

/*
 A dispatch barrier allows us to create a synchronization point within a concurrent dispatch queue. In normal operation, the queue acts just like a normal concurrent queue. But when the barrier is executing, it acts as a serial queue. After the barrier finishes, the queue goes back to being a normal concurrent queue.It allows you to make a thread-unsafe object to thread-safe.
 */

private let concurrentQueue1 = DispatchQueue(label: "com.dispatchBarrier", attributes: .concurrent)
concurrentQueue1.async {
    for value in 1...5 {
print("TASK I — async \(value)")
}
}
concurrentQueue1.async {
    for value in 6...10 {
print("TASK II — sync \(value)")
}
}
for value in 11...15 {
concurrentQueue1.async(flags: .barrier) {
print("TASK III — barrier \(value)")
}
}
concurrentQueue1.async{
    for value in 16...20 {
print("TASK VI — async \(value)")
}
}

//MARK: - What do you understand by dynamic dispatch?

//The process of selecting which implementation of a polymorphic operation to call at run time is called Dynamic dispatch. It is used when we need to invoke our methods like the object method. 
