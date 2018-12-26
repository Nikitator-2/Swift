import UIKit




//функция решающая квадратное уравнение
func quadraticEquation (a:Double, b:Double, c:Double){
    

    let d:Double = b*b-4*a*c
    let x1:Double = (-b+sqrt(d))/(2*a)
    let x2:Double = (-b-sqrt(d))/(2*a)

    print("Задание 1. Решить вадратное уравнение")
    print("Значения:\na = \(a)\nb = \(b)\nc = \(c)\n")
    
    print("Ответы:")
    print("d = \(d)")
    print("x1 = \(x1)")
    print("x2 = \(x2)")

    }

//функция для квадратного треугольника
func rightTriangle (ab:Double,ac:Double){
    
    //площадь
    let s=(ab*ac)/2
    
    //гипотенуза
    let bc = sqrt(ab*ab+ac*ac)
    
    //периметр
    let perim = ab+ac+bc
    
    print("Задание 2.Найти площадь, периметр и гипотенузу треугольника")
    print("Катет AB = \(ab)")
    print("Катет AC = \(ac)\n")
    print("Ответы:")
    print("Площадь треугольника = \(s)")
    print("Гипотенуза = \(bc)")
    print("Периметр = \(perim)\n")
    
}

//функция для расчета суммы вклада
func ttlDep (deposit:Double, percent:Double){

    var dep:Double = deposit
    for years in 1...5 {
    
    dep = dep+(dep*percent/100)
    print("Сумма вклада на конец \(years) года составит \(dep)")
        }
    }
    
//Задание 1.
//задаем значения для квадратного уравнения
let a:Double = 5
let b:Double = -8
let c:Double = 3

quadraticEquation(a:a,b:b,c:c)


//Задание 2.
//задаем катеты

let ab:Double = 5
let ac:Double = 8

rightTriangle(ab: ab, ac: ac)

//Задание 3.
//Найти сумму вклада через 5 лет.

let deposit:Double = 1_000_000
let percent:Double = 11.5

ttlDep(deposit:deposit, percent:percent)







