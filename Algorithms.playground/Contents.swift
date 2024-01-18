import UIKit

//Two sum problem. Find all the pairs from ana given array which sum is equal to target

var arrayList = [2,3,4,3,4,1,6,6,6,7,5,9,1,8,9]
var target = 10

for (index1, item1) in arrayList.enumerated() {
    for (index2, item2) in arrayList.enumerated() {
        if index1 != index2 && item1 + item2 == target {
            print("First approach (\(item1),\(item2))")
        }
    }
}

func secondApproach(input: [Int], sum: Int) {
    var dict = [Int: Int]()
    
    for item in input {
        let diff = sum - item
        if let _ = dict[diff] {
            print("Second approach (\(item),\(diff))")
        }
        dict[item] = item
    }
}

func finalApproach(input: [Int], sum: Int) {
    
    var sortedArray = input.sorted()
    var left = 0
    var right = sortedArray.count - 1
    
    while (left < right) {
        if left != 0 && sortedArray[left] == sortedArray[left - 1] {
            left = left + 1
            continue
        }
        let sumValue = sortedArray[left] + sortedArray[right]
        if sumValue == sum {
            print("Final approach (\(sortedArray[left]), \(sortedArray[right]))")
            left = left + 1
            right = right - 1
        } else if sumValue > sum {
            right = right - 1
        } else {
           left = left + 1
        }
    }
    
}
secondApproach(input: arrayList, sum: target)
finalApproach(input: arrayList, sum: target)
