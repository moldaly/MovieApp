//
//  main.swift
//  atatat
//
//  Created by tamzimun on 03.05.2022.
//

import Foundation

let input = readLine()!.split(separator: " ")
let first = Double(input.first!)
let second = String(input.last!)

class Circle {
    private var rad: Double
    private var color: String
    
    init (_ rad: Double,_ color: String) {
        self.rad = rad
        self.color = color
    }
    
    func getArea() -> String {
        let area: Double = .pi * rad * rad
        return ("Circle is \(color) and area is \(area)")
    }
}

//class AreaOfCircle {
    func area(){
        let circle: Circle = Circle(first!, String(second))
        print(circle.getArea())
    }
//}
area()
