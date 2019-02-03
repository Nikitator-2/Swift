import UIKit


class Family {
    
    
    var childrens: UInt
    
    init(childrens: UInt) {
        self.childrens = childrens
        
    }
}


struct Queue<T> {
    private var elements: [T] = []
    
    mutating func push (_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        return elements.removeLast()
    }
    
    mutating func fifo() -> T? {
        return elements.removeFirst()
    }
 
    subscript (elements: Int ...) -> Int {
        var famCount = 0
        for index in elements where index < self.elements.count {
            famCount += 1
        }
        return famCount
    }
    
}

func lageFamily (array: [Int], predicate: (Int) -> Bool) -> [Int] {
    var tmpQueue = [Int] ()
    for element in array {
        if predicate(element) {
            tmpQueue.append(element)
        }
    }
    return tmpQueue
}


var apartmantsQueue = Queue<Family> () // создаем очередь на квартиры

apartmantsQueue.push(Family(childrens: 4))
apartmantsQueue.push(Family(childrens: 2))
apartmantsQueue.push(Family(childrens: 5))
apartmantsQueue.push(Family(childrens: 3))
apartmantsQueue.push(Family(childrens: 1))
apartmantsQueue.push(Family(childrens: 6))

print (apartmantsQueue[0,1,3])




