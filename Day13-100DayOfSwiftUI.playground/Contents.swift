import UIKit

var greeting = "Hello, playground"

//Protocols

protocol Vehicle {
    var name : String { get }
    var currentPassengers : Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    var name: String
    
    var currentPassengers: Int
    
    func estimateTime(for distance: Int) -> Int {
        distance / 40
    }
    func travel(distance: Int) {
        print("Distance is \(distance)")
    }
    func openSunroof() {
        print("Its a sunny day!")
    }
}

struct Bus : Vehicle {
    var name: String
    
    var currentPassengers: Int
    
    func estimateTime(for distance: Int) -> Int {
        distance / 30
    }
    func travel(distance: Int) {
        print("Distance is \(distance)")
    }
}
func commute( distance: Int, for vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("Thats too slow! I'll try a different vehicle.")
    }
    else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(for vehicles : [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

let mercedes = Car(name: "Mercedes C Class", currentPassengers: 4)
commute(distance: 200, for: mercedes)

let volvo = Bus(name: "Volvo 3 Axle", currentPassengers: 48)
commute(distance: 120, for: volvo)

getTravelEstimates(for: [mercedes,volvo], distance: 240)


//Opaque return types

//Extensions

//Protocol extensions

//Checkpoint 8

protocol Building{
    var name : String { get set}
    var numberOfRooms : Int { get }
    var cost : Int { get }
    var realEstateAgent : String { get set }
    
    func salesSummary () -> String
}

struct House : Building {
    var name: String
    
    var numberOfRooms: Int
    
    var cost: Int
    
    var realEstateAgent: String
    
    
    func salesSummary() -> String {
        
        let str = "The name of the house is \(name), number of rooms are \(numberOfRooms). It will cost Rs \(cost) and you can contact \(realEstateAgent) for further information"
        return str
    }
    
    
}

struct Office : Building {
    var name: String
    
    var numberOfRooms: Int
    
    var cost: Int
    
    var realEstateAgent: String
    
    func salesSummary() -> String {
        let str = "The name of the Office is \(name), number of rooms are \(numberOfRooms). It will cost Rs \(cost) and you can contact \(realEstateAgent) for further information"
        return str
        
    }
}

let bungalow = House(name: "Kitura", numberOfRooms: 5, cost: 5_00_000, realEstateAgent: "Agent 47")
let bungalowSummary = bungalow.salesSummary()
print(bungalowSummary)

let ANZ = Office(name: "ANZ Bank", numberOfRooms: 512, cost: 50_000_000, realEstateAgent: "James Bond")
let officeSummary = ANZ.salesSummary()
print(officeSummary)
