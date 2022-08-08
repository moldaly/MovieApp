//: Playground - noun: a place where people can play

import UIKit
import CoreFoundation

class Student {
    var name: String

    init(name: String) {
        self.name = name
        print("Student \(name) initialized")
    }

    deinit {
        print("Student \(name) is being deinitialized")
    }
}

//var student1: Student? = Student(name: "Nurbek")
//// Student Nurbek initialized
//
//student1 = nil // Здесь счетчик сильных ссылок равен 0
//// Student Nurbek is being deallocated

//var student1: Student? = Student(name: "Nurbek")
//// Student Nurbek initialized
//print(CFGetRetainCount(student1))
//// 1
//var student2: Student? = student1
//print(CFGetRetainCount(student1))
//// 2
//var student3: Student? = student1
//print(CFGetRetainCount(student1))
//// 3
//
//student3 = nil
//print(CFGetRetainCount(student1))
//// 2
//student2 = nil
//print(CFGetRetainCount(student1))
//

// 1
//student1 = nil // Здесь счетчик сильных ссылок равен 0
// Student Nurbek is being deallocated




class Pet {
    let name: String
    weak var owner: Person?

    init(name: String) {
        self.name = name
        print("Pet allocated")
    }

    deinit {
        print("Pet deallocated")
    }
}

class Person {
    let name: String
    var pet: Pet?

    init(name: String) {
        self.name = name
        print("Person allocated")
    }

    deinit {
        print("Person deallocated")

    }
}

//var hachiko: Pet? = Pet(name: "Hachikō")
//var ueno: Person? = Person(name: "Hidesaburō Ueno")
//
//hachiko?.owner = ueno
//ueno?.pet = hachiko
//

//ueno = nil
//hachiko = nil

