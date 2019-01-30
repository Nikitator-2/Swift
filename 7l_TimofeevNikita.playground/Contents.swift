import UIKit


// Хотим купить определенные продукты в магазине

struct Item {
    var price: Int
    var count: Int
    let product: Product
}

struct Product {
    let name: String
}


enum ShopError: Error {
    
    case invalidSelection
    case outOfStock
    case insufficientFunds (moneyNeeded: Int)
}


class Shop {
    
    var inventory = [
        "Изолента": Item(price: 20, count: 3, product: Product (name: "Изолента")),
        "Чипсы": Item(price: 34, count: 7, product: Product (name: "Чипсы")),
        "Пиво": Item(price: 22, count: 18, product: Product (name: "Пиво")),
        ]



var moneyDeposited = 50

func buy (itemNamed name: String) -> (Product?, ShopError?) {
    
    guard let item = inventory[name] else {
        return (nil, ShopError.invalidSelection)
    }
    
    guard item.count > 0 else {
        return (nil, ShopError.outOfStock)
    }
    
    guard item.price <= moneyDeposited else {
        
        return (nil, ShopError.insufficientFunds(moneyNeeded: item.price - moneyDeposited))
    }
    
    
    moneyDeposited -= item.price
    var newItem = item
    newItem.count -= 1
    inventory[name] = newItem
    
    return (newItem.product, nil)
    
    }
}

let shop = Shop()
let sell1 = shop.buy(itemNamed: "Изолента")
let sell2 = shop.buy(itemNamed: "Чипсы")
let sell3 = shop.buy(itemNamed: "Пиво")

if let product = sell1.0 {
    print("Мы купили: \(product.name)")
} else if let error = sell1.1 {
        print("Произошла ошибка: \(error.localizedDescription)")
        }
        

// Ждем прибытия зеленых человечков

enum UFOSError: Error {
    
    case noUFO // человечки не прилетели
    case uFOsAreNotGreen // человечки оказались не зелеными
    case uFOsAreNotGuys // человечки оказались не человечками, а кошечками
}


struct UFOs {
    var count: Int
    var color: UIColor
    var type: String
}


class Cosmoport {
    
    var freeSpace: UFOs
    
    init(freeSpace: UFOs) {
        self.freeSpace = freeSpace
    }
    
    func lending( ufo: UFOs) throws -> () {
        
        guard  ufo.count > 0 else {
            throw UFOSError.noUFO
        }
        
        guard ufo.color == .green else {
            throw UFOSError.uFOsAreNotGreen
        }
        
        guard ufo.type == "Guys" else {
            throw UFOSError.uFOsAreNotGuys
        }
        return print("Прилетели зеленые человечки")
    }
    
}



let ufo1 = UFOs(count: 2, color: .green, type: "Guys")
let cosmoport = Cosmoport(freeSpace: ufo1)


do {
 let _ = try cosmoport.lending(ufo: ufo1)
} catch UFOSError.noUFO {
    print("Ни кто не прилетел")
} catch UFOSError.uFOsAreNotGreen {
    print("Человечки не зеленые")
} catch UFOSError.uFOsAreNotGuys {
    print("Инопланетяне не человечки")
} catch let error {
    print(error.localizedDescription)

}


