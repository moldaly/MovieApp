//
//  main.swift
//  Protocol
//
//  Created by tamzimun on 06.05.2022.
//

import Foundation

protocol Drawable {
    func drawFigure( _ position1: Int, _ position2: Int)
}

class Figures {
    var position1: Int
    var position2: Int
    
    init (position1: Int, position2: Int){
        self.position1 = position1
        self.position2 = position2
    }
}

class Circle: Figures, Drawable {
    func drawFigure( _ position1: Int, _ position2: Int) {
        print("Круг нарисован в позиций x = \(position1) и y = \(position2)")
    }
}

class Rectangle: Figures, Drawable {
    func drawFigure(_ position1: Int, _ position2: Int) {
        print("Прямоуголник нарисован в позиций x = \(position1) и y = \(position2)")
    }
}

func textToDrawable(_ t: String.SubSequence) -> Drawable{
    let figure: Drawable?
    let elements = t.split(separator: " ")
    
    if elements[0] == "circle" {
        figure = Circle(position1: Int(elements[1])!, position2: Int(elements[2])!)
    } else if elements[0] == "rectangle"{
        figure = Rectangle(position1: Int(elements[1])!, position2: Int(elements[2])!)
    }
    return figure!
}
let input = readLine()!.split(separator: ",")
var figures: [Drawable] = []
for t in input{
    figures.append(textToDrawable(t))
}
for figure in figures{
    figure.drawFigure()
}
