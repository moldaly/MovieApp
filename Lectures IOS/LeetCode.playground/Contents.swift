import Cocoa

var input = [2, 3, -1, 0]
var sum = 5

func findTwoSumHash(inputArray: [Int], sum: Int) -> [Int] {
    var dictionary: [Int:Int] = [:]
    var newArray: [Int] = []
    
    for (idx, element) in inputArray.enumerated() {
        if let prevIndex = dictionary[sum - element] {
            newArray.append(prevIndex)
            newArray.append(idx)
        } else {
            dictionary[element] = idx
        }
        
    }
    return newArray
}


findTwoSumHash(inputArray: input, sum: sum)



func findTwoSum(inputArray: [Int], sum: Int) {
    var dictionary: [Int: Int] = [:]
    
    for element in inputArray {
        let difference = sum - element
        
        if let _ = dictionary[difference] {
            print("(\(element), \(difference))")
        }
        
        dictionary[element] = element
    }
}

findTwoSum(inputArray: input, sum: sum)

func findTwoSumSorted(inputArray: [Int], sum: Int) {
    let sortedArray = inputArray.sorted()
    var leftIndex = 0
    var rightIndex = sortedArray.count - 1
    
    while leftIndex < rightIndex {
        let leftElement = sortedArray[leftIndex]
        let rightElement = sortedArray[rightIndex]
        let currentSum = leftElement + rightElement
        
        if currentSum == sum {
            print("(\(leftElement), \(rightElement))")
            return
        } else if currentSum < sum {
            leftIndex += 1
        } else {
            rightIndex -= 1
        }
    }
}

findTwoSumSorted(inputArray: input, sum: sum)

//
//var strs: [String] = ["flower","flow","flight"]
//
//class Solution {
//    func longestCommonPrefix(_ strs: [String]) -> String {
//        guard strs.count > 0 else {
//            return ""
//        }
//        var result: String = ""
//        var prev: String = " "
//        var index: Int = 0
//
//        for item in strs {
//            var temp = prev.index (prev.startIndex, offsetBy: index)
//            var temp2 = item.index (item.startIndex, offsetBy: index)
//            var temp3 = result.index (result.startIndex, offsetBy: index)
//            if  prev[temp] == item[temp2] {
//                result[temp3] = item[temp2]
//            }
//            prev[temp] = item[temp2]
//            index += 1
//        }
//
//        return result
//    }
//}

let strings = [
    "one",
    "owo",
    "ohree"
]

let ints = strings.map { (string) -> Int in
    return string.count
}

print(ints)


class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty {
            return ""
        }
        var common = strs[0]
        
        for ch in strs {
            while !ch.hasPrefix(common) {
                common = String(common.dropLast())
            }
        }
        return common
    }
}
let solution: Solution = Solution()
print(solution.longestCommonPrefix(strings))

func longestCommonPrefix(_ strs: [String]) -> String {
        guard !strs.isEmpty else { return "" }
        guard strs.count > 1 else { return strs.first! }
        var prefix = strs.first!
        
        for index in 0...(strs.count - 2) {
            prefix = prefix.commonPrefix(with: strs[index + 1])
            if prefix == "" { return "" }
        }
        
        return prefix
    }

