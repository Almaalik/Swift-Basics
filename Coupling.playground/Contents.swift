import UIKit


protocol Vehicle: AnyObject {
    
    func start()
}

class Car: Vehicle {
    
    func start() {
        print("Car started")
    }
}

class Bike: Vehicle {
    
    func start() {
        print("Bike started")
    }
}



class Traveller {
    //Tight coupling
    let car: Car = Car()
    
    //Loose coupling
    private weak var vehicle: Vehicle?
    
    init(_vehicle: Vehicle) {
        vehicle = _vehicle
    }
    
    func startTrip() {
        //Tight coupling
        car.start()
        
        //Loose coupling
        vehicle?.start()
    }
}


let car = Car()
let bike = Bike()

let traveller1 = Traveller(_vehicle: car)
let traveller2 = Traveller(_vehicle: bike)
traveller1.startTrip()
traveller2.startTrip()
