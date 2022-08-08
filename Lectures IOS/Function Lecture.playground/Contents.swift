import Cocoa
typealias Grades = (firstMidTerm: Double, secondMidTerm: Double, finalExam: Double)

func regularGradeCalculator (with grades: Grades) -> Double {
    0.3 * (grades.firstMidTerm + grades.secondMidTerm) + 0.4 * grades.finalExam
}

func bonusGradeCalculator (with grades: Grades) -> Double {
    let total = 0.3 * (grades.firstMidTerm + grades.secondMidTerm) + 0.4 * grades.finalExam
    return total + 5
}
let students = ["Naruto", "Saske", "Sakura"]
let studentsGrade: [String: Grades] = [
    "Naruto": (firstMidTerm: 40, secondMidTerm: 70, finalExam: 50),
    "Sakura": (firstMidTerm: 90, secondMidTerm: 90, finalExam: 90)
]
func calculateGrades(with students: [String], studentsGrades: [String: Grades], calculator: (Grades) -> Double) {
    for student in students {
        if let grades = studentsGrades[student] {
            print("\(student) grade is \(calculator(grades))")
        }
    }
}

//let gradesCalculator: (Grades) -> Double
//
//let isTeacherHapppy = true
//if isTeacherHapppy {
//    gradesCalculator = bonusGradeCalculator(with:)
//} else {
//    gradesCalculator = regularGradeCalculator(with:)
//}

func getGradesCalculator(isTeacherHappy: Bool) -> (Grades) -> Double {
    if isTeacherHappy {
        return bonusGradeCalculator(with:)
    } else {
        return regularGradeCalculator(with:)
    }
}

//calculateGrades(with: students, studentsGrades: studentsGrade, calculator: regularGradeCalculator(with:))

//calculateGrades(with: students, studentsGrades: studentsGrade, calculator: getGradesCalculator(isTeacherHappy: false))


func EvenOddNumber(input: Int) -> String {
    if (input % 2 == 0) {
       return "\(input) is even number"
    } else {
        return "\(input) is odd number"
    }
}

//print(EvenOddNumber(input: 5))


func counts(arr: [Int], value: Int) -> Int {
    var count = 0
    for item in arr {
        if item == value {
            count += 1
        }
    }
    return count
}
//print(counts(arr: [2, 1, 2, 2, 4, 4], value: 2))


func sumOfProducts(_ array1: [Int], _ array2: [Int]) -> Int {
    var sum = 0
    for index in 0..<array1.count {
        sum += array1[index] * array2[index]
    }
    return sum
}

//print(sumOfProducts([3, 4, 5], [6, 7, 8]))

var findHypotenuse = { (length: Double, width: Double) -> (Double) in
  let hypotenuse = sqrt(length * length + width * width)
  return hypotenuse
}

let hypotenuse = findHypotenuse(3, 4)

//print("Hypetenuse: ",hypotenuse) // output: Hypotenuse: 5.0



//let completionHandler: (Bool) -> () = { (isSucceeded: Bool) -> Void in
//    if isSucceeded {
//         print("Download completed!")
//         // some UI changes
//    }
//}
//
//// функция внутри будет выполняться пару секунд
//func downloadFile(completion: (Bool) -> Void) {
//    for _ in 1...3 {
//        print("Dowloading...")
//    }
//    completion(true)
//}

//downloadFile(completion: completionHandler)


//func downloadFil(completion: (Bool) -> Void) {
//    for _ in 1...3 {
//        print("Dowloading...")
//    }
//    completion(true)
//}
//
//downloadFil(completion: { (isSucceeded: Bool) -> Void in
//    if isSucceeded {
//         print("Download completed!")
//         // some UI changes
//    }
//})

let operation: (Double, Double) -> Double

func plus (num1: Double, num2: Double) -> Double {
    return num1 + num2
}

func minus (num1: Double, num2: Double) -> Double {
    return num1 - num2
}
operation = plus
//print(operation(5, 1))


let products: [String: Double] = [
    "shirt": 20000,
    "hat": 4000,
    "pants": 18000
]

func filterProducts(products: [String: Double], filter: (Double) -> Bool) -> [String:Double] {
    var filteredProducts: [String: Double] = [:]
    
    for(name, price) in products {
        if filter(price) {
            filteredProducts[name] = price
        }
    }
    return filteredProducts
}

//func lowPriceFilter(_ price: Double) -> Bool {
//    if price < 5000 {
//        return true
//    } else {
//        return false
//    }
//}
//
//func highPriceFilter(_ price: Double) -> Bool {
//    if price >= 10000 {
//        return true
//    } else {
//        return false
//    }
//}

let lowPriceProducts = filterProducts(products: products) {
    $0 < 5000
}

let highPriceProducts = filterProducts(products: products) {
    $0 >= 10000
}



func changeUsernameButtonDidTap() {
    changeUsername(username: "Aida") { message in
        showSuccessAlert(with: message)
    } onError: { error in
        showErrorAlert(with: error)
    }
}

func showSuccessAlert(with message: String) {
    //тут будет запрос(условие) в сервер, в завис от этой условии будет высвечиваться success or error
}

func showErrorAlert(with message: String) {
    
}

func changeUsername(username: String, onSuccess: (String) -> Void, onError: (String) -> Void) {
    let isRequestSucceeded = true
    
    if isRequestSucceeded {
        onSuccess("Ur username changed")
    } else {
        onError("Smth went wrong")
    }
}
