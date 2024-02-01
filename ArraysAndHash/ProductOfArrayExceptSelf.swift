func productExceptSelf(_ nums: [Int]) -> [Int] {
    var leftProducts: [Int] = Array(repeating: 1, count: nums.count)
    var rightProducts: [Int] = Array(repeating: 1, count: nums.count)
    var resultProducts: [Int] = Array(repeating: 1, count: nums.count)
    for i in stride(from: 0, through: nums.count - 1, by: +1) {
        if i >= 1 {
            leftProducts[i] = leftProducts[i - 1] * nums[i - 1]
        } else {
            leftProducts[i] = 1
        }
    }

    for i in stride(from: nums.count - 1, through: 0, by: -1) {
        if i < nums.count - 1 {
            rightProducts[i] = rightProducts[i + 1] * nums[i + 1]
        } else {
            rightProducts[i] = 1
        }
    }

    for i in 0..<nums.count {
        resultProducts[i] = leftProducts[i] * rightProducts[i]
    }
    return resultProducts
}

func productExceptSelfWithO1Space(_ nums: [Int]) -> [Int] {
    var resultArr: [Int] = Array(repeating: 1, count: nums.count)
    for i in stride(from: 0, through: nums.count - 1, by: +1) {
        if i >= 1 {
            resultArr[i] = resultArr[i - 1] * nums[i - 1]
        }
    }

    var rightProduct = 1
    for i in stride(from: nums.count - 1, through: 0, by: -1) {
        resultArr[i] = resultArr[i] * rightProduct
        rightProduct = nums[i] * rightProduct
    }

    return resultArr
}
