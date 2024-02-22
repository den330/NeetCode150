// first sol, array slice not good
func search(_ nums: [Int], _ target: Int) -> Int {
    if nums.count == 1 {
        return nums.first
    }
    let index: Int = nums.count / 2
    let currentNum = nums[index]
    if currentNum == target {return index}
    if currentNum > target {
        return search(Array(nums[0..<index]), target)
    } else {
        return search(Array(nums[index..<nums.count]), target) + index
    }
}

// 2nd sol
func search(_ nums: [Int], _ target: Int) -> Int {
    var upperBound: Int = nums.count - 1
    var lowerBound: Int = 0
    while upperBound >= lowerBound {
        let middleIndex = (upperBound + lowerBound) / 2
        let middleNum = nums[middleIndex]
        if middleNum == target {
            return middleIndex
        } else if middleNum > target {
            upperBound = middleIndex - 1
        } else {
            lowerBound = middleIndex + 1
        }
    }
    return -1
}