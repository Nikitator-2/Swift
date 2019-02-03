import UIKit

enum Transmission {
    case manual, auto
}

enum DoorState: String {
    case open = "открыты"
    case close = "закрыты"
}

enum EngineSate: String {
    case start = "заведен"
    case stop = "заглушен"
}

protocol Car {
    
    var brand: String { get }
    var color: UIColor { get }
    var transmission: Transmission { get }
    var driveStatus: Bool { get }
    var doorState: DoorState { get set}
    var engineState: EngineSate { get  set}
    
    func driveForvard ()
    func stopDriving ()
    
    
}

extension Car {
    
    mutating func startEngine() {
        self.engineState = .start
    }
    mutating func stopEngine() {
        self.engineState = .stop
    }
    
    mutating func openDoor() {
        self.doorState = .open
    }
    mutating func closeDoor() {
        self.doorState = .close
    }
    
    }
    


class TrunkCar: Car {
    
    let brand: String
    let color: UIColor
    let transmission: Transmission
    let trunkSize: UInt
    let noiseSound = "БУУУИИИИИИП!!!"
    
    var doorState: DoorState = .close {
        didSet {
            print("Двери были \(doorState.rawValue)")
        }
    }
    var engineState: EngineSate = .stop {
        didSet {
            print("Двигатель \(engineState.rawValue)")
        }
    }
    
    var driveStatus: Bool {
        didSet {
            print("Машина \(driveStatus ? "поехала" : "остановилась")")
        }
    }
    
    init(brand: String, color: UIColor, transmission: Transmission, trunkSize: UInt) {
        self.brand = brand
        self.color = color
        self.transmission = transmission
        self.trunkSize = trunkSize
        driveStatus = false
    }
    
    
    func driveForvard () {
        if !driveStatus {
            driveStatus = true
        }
        
    }
    
    func stopDriving () {
        if driveStatus {
            driveStatus = false
        }
    }
    
}

class SportCar: Car {
    
    let brand: String
    let color: UIColor
    let transmission: Transmission
    let maxSpeed: UInt
    let noiseSound = "БииБии"
    var doorState: DoorState = .close {
        didSet {
            print("Двери были \(doorState.rawValue)")
        }
    }
    var engineState: EngineSate = .stop {
        didSet {
            print("Двигатель \(engineState.rawValue)")
        }
    }
    
    var driveStatus: Bool {
        didSet {
            print("Машина \(driveStatus ? "поехала" : "остановилась")")
        }
    }
    
    init(brand: String, color: UIColor, transmission: Transmission, maxSpeed: UInt) {
        self.brand = brand
        self.color = color
        self.transmission = transmission
        self.maxSpeed = maxSpeed
        driveStatus = false
    }
    
    
    func driveForvard () {
        if !driveStatus {
            driveStatus = true
        }
        
    }
    
    func stopDriving () {
        if driveStatus {
            driveStatus = false
        }
    }
    
}


extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Грузовик марки \(brand), двери \(doorState.rawValue), двигатель \(engineState.rawValue), объем цистерны \(trunkSize) литров"
    }
    
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Спортивный автомобиль марки \(brand), двери \(doorState.rawValue), двигатель \(engineState.rawValue), максимальная скорость \(maxSpeed) километров в час"
    }
    
}


var sport1 = SportCar(brand: "BMW", color: .black, transmission: .auto, maxSpeed: 300)
var sport2 = SportCar(brand: "Lamborgini", color: .red, transmission: .auto, maxSpeed: 500)

var trunk1 = TrunkCar(brand: "Volvo", color: .brown, transmission: .manual, trunkSize: 10000)
var trunk2 = TrunkCar(brand: "MAZ", color: .yellow, transmission: .manual, trunkSize: 5000)




print(sport1.description)
print(sport2.description)
print(trunk1.description)
print(trunk2.description)


sport1.startEngine()
sport1.driveForvard()
sport1.stopDriving()
sport1.stopEngine()
sport1.openDoor()
sport1.closeDoor()

