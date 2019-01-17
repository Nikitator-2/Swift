import UIKit

var fibNumArr = [0,1] // готовим массив для чисел Фибоначчи

//Готовим массив для составления таблицы простых чисед
var oneMoreArray = [Int]()
let oneMoreArrayLength = 1000

// 1. Написать функцию, которая определяет, четное число или нет.
func evenTest(_ number: Int) -> Bool {
    if number % 2 == 0 {
        return true
    } else {
        return false
    }
}

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func divisible3Test(_ number: Int) -> Bool {
    if number % 3 == 0 {
        return true
    } else {
        return false
    }
}

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
// 50 после корректировки ))
func addNumToArr() {
    
    fibNumArr.append(fibNumArr[(fibNumArr.count) - 1] + fibNumArr[(fibNumArr.count) - 2])
    
}

//6. Функция для 6-го задания

func primeNumbers(_ p:Int) {
    
    
    for i in stride(from: (2 * p), through: oneMoreArrayLength-1, by: p) {
        
        if oneMoreArray[i-2] % p == 0 {
            oneMoreArray[i-2] = 0
        }
    }
    
}



// Вызов первого задания
let numForTest = 6
print("Задано число \(numForTest)")
let evenTestResult = evenTest(numForTest)
if evenTestResult == true {
    print("Это чётное число")
} else {
    print("Это нёчетное число")
}

// Вызов второго задания

let divisible3TestResult = divisible3Test(numForTest)
if divisible3TestResult == true {
    print("Оно делится на 3 без остатка")
} else {
    print("Оно не делится на 3 без остатка")
}

// 3. Создать возрастающий массив из 100 чисел.

var someArray = [Int]()
for i in 1...100 {
    someArray.append(i)
}

print("Массив из 100 чисел")
print(someArray)


//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
// Если удалять элементы в возрастающем порядке, то программа в итоге крашится, так как не хватает в итоге элементов.
//Можно, конечно, вставлять проверки, не закончился ли массив, но, мне кажется в данном случае так изящнее


for i in 1...100 {
    if evenTest(someArray[100-i]) == true {
        someArray.remove(at: 100-i)
    } else {
        if divisible3Test(someArray[100-i]) == false {
            someArray.remove(at: 100-i)
            
        }
    }
}



print("Убрали из массива все четные и все, которые не деляться на 3")
print(someArray)


//Заполняем массив числами Фибоначчи.
//Для записи таких больших чисел подойдет только тип Double. Или есть какое-то другое решение?

//После прочтения коммента к домашке, добавляем только 50.



for _ in 1...50{
addNumToArr()
}
    
print("Числа Фибоначчи")
print(fibNumArr)


//6. * Заполнить массив из 100 элементов различными простыми числами


// Создаем таблицу простых чисел

for i in 2...oneMoreArrayLength {
    oneMoreArray.append(i)
}

var p = 2

repeat {
    primeNumbers(p)
    p += 1
    if p == oneMoreArrayLength {
        break
    }
    while oneMoreArray[p-2] == 0 {
        p += 1
        if p == oneMoreArrayLength {
            break
        }
    }
    
    if p == oneMoreArrayLength {
        break
    }
} while oneMoreArray[p-2] != 0

// Создаем массив из 100 простых чисел

var primNumArr: [Int] = []

var primNumCount = 0
for _ in 0...99 {
    while oneMoreArray[primNumCount] == 0 {
        primNumCount += 1
    }
    primNumArr.append(oneMoreArray[primNumCount])
        primNumCount += 1
}


print("Массив из 100 простых чисел")
print(primNumArr)




