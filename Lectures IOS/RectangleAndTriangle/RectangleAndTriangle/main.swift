//
//  main.swift
//  RectangleAndTriangle
//
//  Created by tamzimun on 03.05.2022.
//

import Foundation


let input = readLine()!.split(separator: " ")

// создайте здесь классы Rectangle, Triangle

class Rectangle {
    private var width: Double
    private var length: Double
    
    init (_ width: Double, _ length: Double) {
        self.width = width
        self.length = length
    }
    
    func perimeter() -> Double {
        return (width + length) * 2
    }
    
    func area() -> Double {
        return width * length
    }
}

class Triangle {
    private var leg1: Double
    private var leg2: Double
    private var hypotenuse: Double
    
    init (_ leg1: Double, _ leg2: Double, _ hypotenuse: Double) {
        self.leg1 = leg1
        self.leg2 = leg2
        self.hypotenuse = hypotenuse
    }
    
    func perimeter() -> Double {
        return  leg1 + leg2 + hypotenuse
    }
    
    func area() -> Double {
        return  (leg1 * leg2) / 2
    }
}

func calculate(){
    if input.count == 2{
        let rect = Rectangle(Double(input[0])!, Double(input[1])!)
        print("\(rect.perimeter()) \(rect.area())")
    }else{
        let triangle = Triangle(Double(input[0])!, Double(input[1])!, Double(input[2])!)
        print("\(triangle.perimeter()) \(triangle.area())")
    }
}

calculate()

