import UIKit

//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

enum EngineState: String {
    case start = "Двигатель заведен"
    case stop = "Двигатель остановлен"
}

enum WindowsState {
    case open, close
}

enum CargoStatus {
    case load(Int)
    case unload(Int)


}

//1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

// в общем-то можно было сделать одну структуру и добавить свойство грузовик или легковой автомобиль.

struct AnyCar {
    let brand: String
    let yearOfManufacture: UInt
    let trunkCapacity: UInt
    var engineState: EngineState {
        didSet {
            print(engineState.rawValue)
        }
    }
    var windowsState: WindowsState
    var filledSpace: UInt
    var freeSpace: UInt {
        get {
            return trunkCapacity - filledSpace
        }
    }
    
    mutating func startEngine() {
        self .engineState = .start
    }
    mutating func stopEngine() {
        self .engineState = .stop
    }
    
    mutating func OpenWindows() {
        self .windowsState = .open
    }
    mutating func closeWindows() {
        self .windowsState = .close
    }
    
    
    // наш автопарк не может содержать машины произведенные до 2000 года.
    
    init?(brand: String, yearOfManufacture: UInt, trunkCapacity: UInt, engineState: EngineState, windowsState: WindowsState, filledSpace: UInt) {
        guard yearOfManufacture >= 2000 else { // проверяем, удовлетворяет ли нас год выпуска автомобиля
            return nil
        }
        
        
        self .brand = brand
        self .yearOfManufacture = yearOfManufacture
        self .trunkCapacity = trunkCapacity
        self .engineState = engineState
        self .windowsState = windowsState
        self .filledSpace = 0
        
    }
    
}


struct AnyTruck {
    let brand: String
    let yearOfManufacture: UInt
    let truckBodyCapacity: UInt
    var engineState: EngineState {
        didSet {
            print(engineState.rawValue)
        }
    }
    var windowsState: WindowsState
    var filledSpace: UInt
    
    var freeSpace: UInt {
        get {
            return truckBodyCapacity - filledSpace
        }
    }
    
    mutating func startEngine() {
        self .engineState = .start
    }
    mutating func stopEngine() {
        self .engineState = .stop
    }
    
    mutating func OpenWindows() {
        self .windowsState = .open
    }
    mutating func closeWindows() {
        self .windowsState = .close
    }
    
    // наш автопарк не может содержать грузовики произведенные до 2010 года.
    
    init?(brand: String, yearOfManufacture: UInt, truckBodyCapacity: UInt, engineState: EngineState, windowsState: WindowsState, filledSpace: UInt) {
        guard yearOfManufacture >= 2000 else { // проверяем, удовлетворяет ли нас год выпуска автомобиля
            return nil
        }
        
        
        self .brand = brand
        self .yearOfManufacture = yearOfManufacture
        self .truckBodyCapacity = truckBodyCapacity
        self .engineState = engineState
        self .windowsState = windowsState
        self .filledSpace = 0
    }
}



if var car1 = AnyCar(brand: "Volvo", yearOfManufacture: 2000, trunkCapacity: 300, engineState: .stop, windowsState: .close, filledSpace: 0) {
    print("Первая машина в автопарке \(car1.brand). Год выпуска \(car1.yearOfManufacture)")
    car1.engineState = .start
}

if var truck1 = AnyTruck(brand: "Камаз", yearOfManufacture: 2014, truckBodyCapacity: 1000, engineState: .stop, windowsState: .close, filledSpace: 0) {
    print("Первый грузовик в автопарке \(truck1.brand). Год выпуска \(truck1.yearOfManufacture). Вместимость кузова \(truck1.truckBodyCapacity) кг")
    
    truck1.engineState = .start
    
    

}

// как реализовать погрузку / выгрузку грузов через вынкцию внутри enum я что-то не сообразил...
