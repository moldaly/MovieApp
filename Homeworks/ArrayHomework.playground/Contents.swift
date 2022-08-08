import UIKit

var numbers: [Int] = []
//var numbers = [1, 0, 4, 5, 6]
func containsZero(array: [Int]) -> Bool {
    if numbers.count != 0 {
        for item in numbers {
            if (item == 0){
                return true
            }
        }
    }
    return false
}
print(containsZero(array: numbers))

//var numbers: [Int] = []
//var numbers = [1, 0, 0, 5, 6]
func containsTwoZeros(array: [Int]) -> Bool {
    var count = 0
    for item in numbers {
        if (item == 0) {
           count += 1
        }
    }
    if (count == 2){
        return true
    } else {
        return false
    }
}
//print(containsTwoZeros(array: numbers))

//var numbers: [Int] = []
//var numbers = [1, 0, 0, 0, 9]
func containsThreeZeros(array: [Int]) -> Bool {
    if numbers.count != 0 {
        for i in 0..<numbers.count - 2 {
            if numbers[i..<i + 3] == [0,0,0] {
                return true
            }
        }
    }
    return false
}

//print(containsThreeZeros(array: numbers))

//var numbers: [Int] = []
//var numbers = [1, 0, 0, 0, 9]
func sumElements(array: [Int]) -> Int {
    var sum = 0
    for item in numbers {
           sum += item
    }
    return sum
}
//print(sumElements(array: numbers))

//var numbers: [Int] = []
//var numbers = [9, 0, 0, 0, 9]
func arrayReversed(array: [Int]) -> [Int]{
    var reversedNumbers = [Int]()

    for arrayElements in numbers {
        reversedNumbers.insert(arrayElements, at: 0)
    }
    return reversedNumbers
}

//print(arrayReversed(array: numbers))

//var numbers: [Int] = []
//var numbers = [9, 0, 0, 0, 9]
func EvenOddNumbers(array: [Int]) {
    var evenNumbers = 0
    var oddNumbers = 0
    for item in numbers {
        if (item % 2 == 0) {
           evenNumbers += 1
        } else {
            oddNumbers += 1
        }
    }
    print("Четные числа: \(evenNumbers)")
    print("Нечетные числа: \(oddNumbers)")
}

//print(EvenOddNumbers(array: numbers))

//var numbers: [Int] = []
//var numbers = [1]
func diffLargeSmall(array: [Int]) -> String {
    if numbers.count == 0 {
        return "Array is empty"
    }
    var theLargestNumber = numbers[0]
    for item in numbers {
        if (item > theLargestNumber) {
           theLargestNumber = item
        }
    }
    var theSmallestNumber = numbers[0]
    for item in numbers {
        if (item < theSmallestNumber) {
           theSmallestNumber = item
        }
    }
    return "Разницу между наибольшим и наименьшим числом: \(theLargestNumber - theSmallestNumber)"
}

//print(diffLargeSmall(array: numbers))


