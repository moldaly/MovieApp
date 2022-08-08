import Cocoa

var code = [
    "a" : "b",
    "b" : "c",
    "c" : "d",
    "d" : "e",
    "e" : "f",
    "f" : "g",
    "g" : "h",
    "h" : "i",
    "i" : "j",
    "j" : "k",
    "k" : "l",
    "l" : "m",
    "m" : "n",
    "n" : "o",
    "o" : "p",
    "p" : "q",
    "q" : "r",
    "r" : "s",
    "s" : "t",
    "t" : "u",
    "u" : "v",
    "v" : "w",
    "w" : "x",
    "x" : "y",
    "y" : "z",
    "z" : "a"
]

func encryptMessage(input: String) -> String {
    var temp = ""
    for item in input {
        if (code[String(item)] != nil)  {
            temp += code[String(item)]!
        } else {
            temp += " "
        }
    }
    return temp
}

//print(encryptMessage(input: "hello programmer"))

var numbers: [Int] = []
//var numbers = [0, 2, 3, 5]
func arrayToDict(array: [Int]) -> [Int:Int] {
    var myDict : [Int : Int] = [:]
    let count = 1
    if numbers.count != 0 {
        for i in 0...numbers.count-1{
            if myDict[numbers[i]] != nil{
                myDict[numbers[i]] = count + 1
            } else {
                myDict[numbers[i]] = count
            }
        }
    }
    return myDict
}
//print(arrayToDict(array: numbers))

var student: [String: Float] = [
    "Moldaly Aida":4.0,
    "Asylbek Asema":3.1,
    "Margulan Bahtyiar":3.0
]
func averageGpa(dictionary: [String:Float]) -> Float {
    var temp: Float = 0.0
    for values in student.values {
        temp += Float(values)
    }
    let average: Float = temp / Float(student.count)
    return average
}
print(averageGpa(dictionary: student))


func gpaLargerThree(dictionary: [String:Float]) -> [String:Float] {
    var myDict : [String:Float] = [:]
    for (key, values) in student {
        if Float(values) > 3.0 {
            myDict[key] = Float(values)
        }
    }
    return myDict
}
print(gpaLargerThree(dictionary: student))

var studentsA = ["Moldaly","Aida","Asylbek","Asema","Margulan","Bahtyar"]

func arrayToDict(array: [String]) -> [String:Int] {
    var myDict : [String:Int] = [:]
    let count = 1
    for i in 0...studentsA.count - 1 {
        if myDict[studentsA[i]] != nil{
            myDict[studentsA[i]] = count + 1
        } else {
            myDict[studentsA[i]] = count
        }
    }
    return myDict
}
print(arrayToDict(array: studentsA))
