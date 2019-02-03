import UIKit

enum Transmission {
    case manual, auto
}

enum TransmissionMode: String {
    case auto = "автоматический режим"
    case manual = "ручной режим"
    case sport = "спортивный режим"
}

enum DoorState: String {
    case open = "открыты"
    case close = "закрыты"
}

enum EngineSate: String {
    case start = "заведен"
    case stop = "заглушен"
}

enum TrunkState: String {
    case full = "Груз загружен"
    case empty = "Груз выгружен"
}



class Car {
    let color: UIColor
    let wheels: Int
    var transmission: Transmission
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
    
    func startEngine() {
        self .engineState = .start
    }
    func stopEngine() {
        self .engineState = .stop
    }
    
    func openDoor() {
        self .doorState = .open
    }
    func closeDoor() {
        self .doorState = .close
    }
    
    func noise() {
        // пустая функция
    }
    
    init(color: UIColor, wheels: Int, transmission: Transmission) {
        self.color = color
        self.wheels = wheels
        self.transmission = transmission
       
    }
}

class SportCar: Car {


    var transmissionMode: TransmissionMode = .auto {
        didSet {
            print("Коробка передачь переведена в \(transmissionMode.rawValue)")
        }
    }

//    не смог сделать override константы transmission
//    в таком виде ругается, что не может перезаписать сохраненное значение
//    override let transmission: Transmission = .auto
    
    
    
// Если я пытаюсь убрать из Инициализатора transmissionMode, то ругается, что я мол хочу сделать оверрайд инициализарота
    init(color: UIColor, wheels: Int, transmission: Transmission, transmissionMode: TransmissionMode) {
      super.init(color: color, wheels: wheels, transmission: transmission)

    }

    func autoMode() {
        self .transmissionMode = .auto
    }
    
    func manualMode() {
        self .transmissionMode = .manual
    }
    
    func sportMode() {
        self .transmissionMode = .sport
    }
    
    override func noise() {
        print ("Биип-Биип")
    }
    
}


var sportCar1 = SportCar(color: .white, wheels: 4, transmission: .auto, transmissionMode: .auto)
var sportCar2 = SportCar(color: .red, wheels: 4, transmission: .auto, transmissionMode: .auto)
sportCar1.openDoor()
sportCar2.closeDoor()
sportCar1.manualMode()
sportCar2.manualMode()
sportCar2.noise()



class TrunkCar: Car {

    var trunkState: TrunkState = .empty {
        didSet {
            print (trunkState.rawValue)
        }
    }

    
    func loadTrunk() {
        self .trunkState = .full
    }

    func unLoadTrunk() {
        self .trunkState = .empty
    }


init(color: UIColor, wheels: Int, transmission: Transmission, trunkState: TrunkState) {
    super.init(color: color, wheels: wheels, transmission: transmission)
    
}


override func noise() {
    print ("БУУУУУУУУУУУУУ")
}


}



var trunk1 = TrunkCar(color: .white, wheels: 6, transmission: .manual, trunkState: .empty)
var trunk2 = TrunkCar(color: .green, wheels: 6, transmission: .manual, trunkState: .empty)


trunk1.noise()
trunk2.startEngine()

