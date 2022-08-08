import Cocoa

class Transport{ // основной класс
   var speed: Double = 0.0 // скорость
   var number_of_passengers = 0 // количество пассажиров
   
   func gasCost() -> Double{
       return 2.5
   }
}

class Car: Transport{ // машина
   var hasTrunk: Bool = true // имеет багажник
    override func gasCost() -> Double {
        return 20.4
    }
}

class Bus: Transport{ // автобус
   var hasTerminal: Bool = true // имеет терминал
    override func gasCost() -> Double {
        return 30.5
    }
}

var car = Car() // создаем обьект класса Car
car.speed = 70
car.hasTrunk = false
car.number_of_passengers = 1
car.gasCost()

var bus = Bus() // создаем обьект класса Bus
bus.speed = 50
bus.hasTerminal = true
bus.number_of_passengers = 10
bus.gasCost()

class BankAccount {
    var bankHolder: String = ""
    private var pinCode: String = ""
    var Pincode: String {
        get {
            return pinCode
        }
        set {
            pinCode = newValue
        }
    }
}

var account = BankAccount()
account.Pincode = "23424"
//print(account.Pincode)

class Transformer {
    func run() {
        
    }
    func fire() {
        
    }
    func transform() {
        
    }
}

class Autobot: Transformer {
    private var attackLevel: Int = 0
    func fly() {
        
    }
}

class Decepticon: Transformer {
    func jump() {
        
    }
}

//Палимарфизм

class Animal{ // наследуемый класс
    var name: String = ""
    
    func speak() {
        print ("HRRR")
    }
}

class Cat: Animal{ // наследующий класс
    override func speak(){
        print("Meeow")
    }
}
class Dog: Animal{ // наследующий класс
    override func speak(){
        print("Woof")
    }
}

var kitty = Cat()
//kitty.speak()
var spike = Dog()
//spike.speak()

//Абстакция

class Customer{
   var name: String = ""
   private var password: String! //приватное поле, чтобы скрыть от внешнего мира

   init(){
       password = "1234"
   }

   func checkPassword(_ pin: String) -> Bool{ // метод проверяющий валидность пароля
       if pin == password{
           return true
       }
       return false
   }

}

var client: Customer = Customer()
client.checkPassword("1235") // false
client.checkPassword("1234") // true

//Домашнее задание

class Shape {
    var x: Double = 19
    var y: Double = 12
    
    func area() {
        print(x * y)
    }
    
    func perimeter() {
        print(x + y)
    }
}


//class Circle: Shape {
//    override func area() {
//        print(.pi * x * y)
//    }
//    override func perimeter() {
//        print(x + y * 2)
//    }
//}

//class Rectangle: Shape {
//    override func area() {
//        print( x * 2 * y * 2)
//    }
//    override func perimeter() {
//        print(x * 2)
//    }
//}

//var circle: Circle = Circle()
////circle.area()
//var rectangle: Rectangle = Rectangle()
////rectangle.perimeter()







//protocol

protocol Defensible{ // протокол, с объявленным свойством
    var defenseScore: Int {set get}
}

class Player: Defensible{ // класс который подписывается под протокол
    var defenseScore: Int = 10
    
}

var player: Defensible = Player()
player.defenseScore = 20



protocol Calculatable{ // протокол с объявленными методами
    func area() -> Double
    func perimeter() -> Double
}

struct Circl: Calculatable{
    var radius: Double = 2
    
    func area() -> Double { // реализация метода
        return .pi*radius*radius
    }
    
    func perimeter() -> Double { // реализация метода
        return 2 * .pi * radius
    }
}

struct Triangle: Calculatable{
    var a: Double = 3
    var b: Double = 4
    var c: Double = 5
    
    func area() -> Double { // реализация метода
        return a*b*c // неверная формула, было сделана для примера
    }
    
    func perimeter() -> Double { // реализация метода
        return a+b+c
    }
}
// тест, массив с типом протокола
var figures: [Calculatable] = [Triangle.init(a: 10, b: 5, c: 7), Circl.init(radius: 10)]

//for figure in figures{
//    print(figure.area())
//    print(figure.perimeter())
//}


//Задание
protocol Sum {
    func sumOfArray() -> Int
}
protocol Multiplication {
    func mulpiplicationOfArray() -> Int
}

class Calculate: Sum, Multiplication {
    private var numbers: [Int]
    
    init (numbers: [Int]) {
        self.numbers = numbers
    }
    
    func sumOfArray() -> Int {
        var result = 0
        for item in numbers {
            result += item
        }
        return result
    }
    func mulpiplicationOfArray() -> Int {
        var result = 1
        for item in numbers {
            result = result * item
        }
        return result
    }
}
class Temp {
    var temp: [Int] = [1, 3 , 5]
}

extension Temp: Multiplication {
    
    func mulpiplicationOfArray() -> Int {
        var result = 1
        for item in temp {
            result = result * item
        }
        return result
    }
}


var calc: Sum = Calculate.init(numbers: [2, 3, 5])

//print(calc.sumOfArray())

var calcul: Multiplication = Calculate.init(numbers: [2, 3, 5])

//print(calcul.mulpiplicationOfArray())



extension Double{
    var minutes: Double{
        return self * 60
    }
    var seconds: Double{
        return self * 3600
    }
}
var time_in_hours: Double = 2.5
//print(time_in_hours.minutes)
//print(time_in_hours.seconds)








