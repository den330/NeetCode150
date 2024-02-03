// not O(n)
func longestConsecutive(_ nums: [Int]) -> Int {
    if nums.isEmpty {
        return 0
    }

    if nums.count == 1 {
        return 1
    }
    
    var sortedArr = nums.sorted(by: <)
    var currentNum: Int?
    var currentCount = 0
    var currentMax = 0
    for num in sortedArr {
        guard let theCurrentNum = currentNum else {
            currentNum = num
            currentCount += 1
            currentMax = currentCount
            continue
        }
        if num == theCurrentNum + 1 {
            currentCount += 1
        } else if num == theCurrentNum {
            continue
        } else {
            currentCount = 1
        }
        currentMax = currentCount > currentMax ? currentCount : currentMax
        currentNum = num
    }
    return currentMax
}


// O(n)
func longestConsecutiveOn(_ nums: [Int]) -> Int {
    var numSet = Set(nums)
    var finalStreak = 0
    for num in numSet {
        if !numSet.contains(num - 1) {
            var theNum = num
            var currentStreak = 1
            while numSet.contains(theNum + 1) {
                currentStreak += 1
                theNum += 1
            }
            finalStreak = currentStreak > finalStreak ? currentStreak : finalStreak
        }
    }
    return finalStreak
}