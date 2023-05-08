//
//  main.swift
//  Staff
//
//  Created by tamzimun on 03.05.2022.
//

let input = readLine()!.split(separator: ",")
var amount: Double = 0
for t in input{
    amount += calculateSalary(t)
}
print(amount)

class Staff {
    var salary: Double = 500000
    
    func salaryOfStuff() -> Double {
        return salary
    }
}

class Lecturer: Staff {
    override func salaryOfStuff() -> Double {
        return salary * 0.9
    }
}

class Professor: Staff {
    override func salaryOfStuff() -> Double {
        return salary * 1.1
    }
}

class Rector: Staff {
    override func salaryOfStuff() -> Double {
        return salary * 2
    }
}

func calculateSalary(_ t: String.SubSequence) -> Double{
    let status = String(t.split(separator: " ")[0])
    let number = Double(t.split(separator: " ")[1])
    var overall: Double = 0
    let lecturer: Lecturer = Lecturer()
    let professor: Professor = Professor()
    let rector: Rector = Rector()
    
    if number! > 0 {
        if status == "lecturer"{
            overall += number! * lecturer.salaryOfStuff()
        }
        if status == "professor"{
            overall += number! * professor.salaryOfStuff()
        }
        if status == "rector"{
            overall += number! * rector.salaryOfStuff()
        }
    }
    return overall
}
