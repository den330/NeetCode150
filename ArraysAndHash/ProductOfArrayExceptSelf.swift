func productExceptSelf(_ nums: [Int]) -> [Int] {
    var leftProducts: [Int] = Array(repeating: 0, count: nums.count)
    var rightProducts: [Int] = Array(repeating: 0, count: nums.count)
    var resultProducts: [Int] = []
    for i in stride(from: 0, through: nums.count - 1, by: +1) {
        if i >= 1 {
            leftProducts[i] = leftProducts[i - 1] * nums[i]
        } else {
            leftProducts[i] = 1
        }
    }

    for i in stride(from: nums.count - 1, through: 0, by: -1) {
        if i < nums.count - 1 {
            rightProducts[i] = rightProducts[i + 1] * nums[i]
        } else {
            rightProducts[i] = 1
        }
    }

    for i in 0..<nums.count {
        resultProducts[i] = leftProducts[i] * rightProducts[i]
    }
    return resultProducts
}

func productExceptSelWithO1Space(_ nums: [Int]) -> [Int] {
    
}
