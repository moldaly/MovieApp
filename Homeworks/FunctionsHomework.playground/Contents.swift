import Cocoa


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

